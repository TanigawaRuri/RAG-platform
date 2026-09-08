from unittest.mock import AsyncMock

import pytest
import redis.asyncio as redis

from app.cache import make_cache_key
from app.cache.redis_cache import RedisCache

def test_cache_key_normalizes_whitespace_and_case():
    assert make_cache_key("  Hello   World ") == make_cache_key("hello world")
    assert make_cache_key("hello world") != make_cache_key("hello there")

@pytest.mark.asyncio
async def test_cache_get_returns_none_on_redis_error():
    cache = RedisCache("localhost", 6379)
    cache.client.get = AsyncMock(side_effect=redis.RedisError("down"))

    assert await cache.get("key") is None


@pytest.mark.asyncio
async def test_cache_set_returns_false_on_redis_error():
    cache = RedisCache("localhost", 6379)
    cache.client.set = AsyncMock(side_effect=redis.RedisError("down"))

    assert await cache.set("key", {"answer": "x"}, ttl=60) is False
