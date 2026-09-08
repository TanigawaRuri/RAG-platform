import time

from fastapi import Request

from app.monitoring.metrics import HTTP_REQUESTS, HTTP_REQUEST_LATENCY

async def metrics_middleware(request: Request, call_next):
    start = time.perf_counter()
    response = await call_next(request)
    elapsed = time.perf_counter() - start

    route = request.scope.get("route")
    endpoint = route.path if route else request.url.path

    HTTP_REQUESTS.labels(
        method=request.method,
        endpoint=endpoint,
        status=str(response.status_code)
    ).inc()

    HTTP_REQUEST_LATENCY.labels(
        method=request.method,
        endpoint=endpoint
    ).observe(elapsed)

    return response