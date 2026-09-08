from app.schemas.chat import ChatRequest, ChatResponse

def test_chat_request_validation():
    request = ChatRequest(message="hello")
    assert request.message == "hello"

def test_chat_response_contains_routing_metadata():
    response = ChatResponse(
        answer="Hello!",
        model="test-model",
        model_tier="small",
        routing_reason="simple_query",
        latency_ms=100.0
    )
    assert response.model_tier == "small"
