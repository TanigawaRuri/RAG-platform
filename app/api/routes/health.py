from fastapi import APIRouter, Depends, Response, status

from app.api.dependencies import get_redis_cache
from app.cache.redis_cache import RedisCache

app = APIRouter(tags=["health"])

@app.get("/health")
async def health_check(
    response: Response,
    redis_cache: RedisCache = Depends(get_redis_cache),
):
    try:
        redis_ok = await redis_cache.ping()
    except Exception:
        redis_ok = False

    if not redis_ok:
        response.status_code = status.HTTP_503_SERVICE_UNAVAILABLE

    return {
        "status": "ok" if redis_ok else "degraded",
        "redis": "ok" if redis_ok else "unreachable",
    }