import time

from app.llm.router import ModelRouter
from app.monitoring.metrics import LLM_ERRORS, LLM_LATENCY, LLM_REQUESTS
from app.monitoring.tracing import get_tracer
from app.schemas.chat import ChatResponse

tracer = get_tracer(__name__)

class LLMService:
    def __init__(self, router: ModelRouter) -> None:
        self.router = router

    def chat(self, message: str, context: list[dict]) -> ChatResponse:
        start_time = time.perf_counter()
        model, decision = self.router.route_and_get_model(message)
        model_name = model.model_name
        LLM_REQUESTS.labels(model=model_name).inc()

        with tracer.start_as_current_span("llm.inference") as span:
            span.set_attribute("llm.model", model_name)
            span.set_attribute("llm.tier", decision.tier)
            span.set_attribute("llm.routing_reason", decision.reason)

            context_text = "\n\n".join(
                f"[Source: {item['source']}]\n{item['text']}" for item in context
            )

            system_prompt = """
                You are a helpful company assistant.

                Answer the user's question using ONLY the
                provided context.

                If the context does not contain enough information,
                say that you don't have enough information.

                Do not invent company policies.
            """

            user_prompt = f"""
                Context:

                {context_text}

                Question:

                {message}
            """
            try:
                answer_text = model.generate(
                    messages=[
                        {"role": "system", "content": system_prompt},
                        {"role": "user", "content": user_prompt},
                    ]
                )
            except Exception as exc:
                LLM_ERRORS.labels(model=model_name).inc()
                span.record_exception(exc)
                raise
            finally:
                elapsed_ms = (time.perf_counter() - start_time) * 1000
                LLM_LATENCY.labels(model=model_name).observe(elapsed_ms / 1000)
                span.set_attribute("llm.latency_ms", elapsed_ms)

        return ChatResponse(
            answer=answer_text,
            model=model_name,
            model_tier=decision.tier,
            routing_reason=decision.reason,
            latency_ms=round(elapsed_ms, 2)
        )
    