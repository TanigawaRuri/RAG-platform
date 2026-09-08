from fastapi import Request

from app.services.llm_service import LLMService
from app.services.rag_service import RAGService
from app.cache.redis_cache import RedisCache

def get_llm_service(request: Request) -> LLMService:
    return request.app.state.llm_service

def get_rag_service(request: Request) -> RAGService:
    return request.app.state.rag_service

def get_redis_cache(request: Request) -> RedisCache:
    return request.app.state.redis_cache