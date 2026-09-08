from pydantic import BaseModel, Field

class ChatRequest(BaseModel):
    message: str = Field(min_length=1, max_length=10_000)

class ChatResponse(BaseModel):
    answer: str
    model: str
    model_tier: str
    routing_reason: str
    latency_ms: float