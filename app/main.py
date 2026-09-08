from contextlib import asynccontextmanager

from fastapi import FastAPI
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from prometheus_fastapi_instrumentator import Instrumentator

from app.api.routes import chat, health
from app.cache.redis_cache import RedisCache
from app.core.config import settings
from app.llm.router import ModelRouter
from app.monitoring.middleware import metrics_middleware
from app.monitoring.tracing import setup_tracing
from app.services.llm_service import LLMService
from app.services.rag_service import RAGService

@asynccontextmanager
async def lifespan(app: FastAPI):
    app.state.redis_cache = RedisCache(
        host=settings.redis_host,
        port=settings.redis_port,
        db=settings.redis_db
        )

    app.state.rag_service = RAGService()
    app.state.llm_service = LLMService(
        router=ModelRouter.from_env()
    )
    yield
    await app.state.redis_cache.client.aclose()

setup_tracing()
app = FastAPI(title="Production RAG API", lifespan=lifespan)

Instrumentator(excluded_handlers=["/metrics"]).instrument(app).expose(app, endpoint="/metrics", include_in_schema=False)

FastAPIInstrumentor.instrument_app(app)
app.middleware("http")(metrics_middleware)
app.include_router(chat.app, prefix='/api/v1')
app.include_router(health.app, prefix='/api/v1')
