import time
from fastapi import APIRouter, Depends

from app.api.dependencies import get_llm_service, get_rag_service, get_redis_cache
from app.cache import make_cache_key
from app.cache.redis_cache import RedisCache
from app.core.config import settings
from app.schemas.chat import ChatRequest, ChatResponse
from app.services.llm_service import LLMService
from app.services.rag_service import RAGService

app = APIRouter(tags=["chat"])

@app.post("/chat", response_model=ChatResponse)
async def chat(
    request: ChatRequest,
    llm_service: LLMService = Depends(get_llm_service),
    rag_service: RAGService = Depends(get_rag_service),
    redis_cache: RedisCache = Depends(get_redis_cache)
) -> ChatResponse:
    start = time.perf_counter()
    key = make_cache_key(request.message)

    cached = await redis_cache.get(key)
    if cached is not None:
        cached["latency_ms"] = round((time.perf_counter() - start) * 1000, 2)
        return ChatResponse(**cached)

    documents = rag_service.retrieve(query=request.message, top_k=3)["documents"]
    response = llm_service.chat(message=request.message, context=documents)

    await redis_cache.set(key, response.model_dump(), ttl=settings.cache_ttl_seconds)
    response.latency_ms = round((time.perf_counter() - start) * 1000, 2)
    return response

@app.post("/search")
async def search(
    request: ChatRequest,
    rag_service: RAGService = Depends(get_rag_service),
):
    return rag_service.retrieve(
        query=request.message,
        top_k=3,
    )
    