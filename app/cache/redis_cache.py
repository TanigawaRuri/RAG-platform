import json
import time
from typing import Any

import redis.asyncio as redis

from app.monitoring.metrics import (
    CACHE_REQUESTS,
    CACHE_LATENCY,
    CACHE_ERRORS
)
from app.monitoring.tracing import get_tracer

tracer = get_tracer(__name__)

class RedisCache:
    def __init__(
        self,
        host: str,
        port: int,
        db: int = 0
    ):
        self.client = redis.Redis(
            host=host,
            port=port,
            db=db,
            decode_responses=True
        )
    
    async def get(self, key: str) -> Any | None:
        start = time.perf_counter()
        with tracer.start_as_current_span("cache.get") as span:
            span.set_attribute("cache.key_hash", key.rsplit(":", 1)[-1])
            try:
                value = await self.client.get(key)
                if value is None:
                    CACHE_REQUESTS.labels(result="miss").inc()
                    span.set_attribute("cache.result", "miss")
                    return None
                CACHE_REQUESTS.labels(result="hit").inc()
                span.set_attribute("cache.result", "hit")
                return json.loads(value)
            except (redis.RedisError, json.JSONDecodeError) as exc:
                CACHE_ERRORS.labels(operation="get").inc()
                span.record_exception(exc)
                CACHE_REQUESTS.labels(result="error").inc()
                return None
            finally:
                CACHE_LATENCY.labels(operation="get").observe(time.perf_counter() - start)
    
    async def set(
        self,
        key: str,
        value: Any,
        ttl: int
    ) -> None:
        start = time.perf_counter()
        with tracer.start_as_current_span("cache.set") as span:
            span.set_attribute("cache.key_hash", key.rsplit(":", 1)[-1])
            span.set_attribute("cache.ttl", ttl)
            try:
                await self.client.set(
                    key,
                    json.dumps(value, ensure_ascii=False),
                    ex=ttl
                )
                return True
            except (redis.RedisError, TypeError) as exc:
                CACHE_ERRORS.labels(operation="set").inc()
                span.record_exception(exc)
                return False
            finally:
                CACHE_LATENCY.labels(operation="set").observe(time.perf_counter() - start)
    
    async def delete(self, key: str) -> None:
        start = time.perf_counter()
        with tracer.start_as_current_span("cache.delete") as span:
            span.set_attribute("cache.key_hash", key.rsplit(":", 1)[-1])
            try:
                await self.client.delete(key)
            except redis.RedisError as exc:
                CACHE_ERRORS.labels(operation="delete").inc()
                span.record_exception(exc)
                raise
            finally:
                CACHE_LATENCY.labels(operation="delete").observe(
                    time.perf_counter() - start
                )
    
    async def ping(self) -> bool:
        try:
            return bool(await self.client.ping())
        except redis.RedisError:
            return False