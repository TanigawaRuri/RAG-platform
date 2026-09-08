from openai import OpenAI

from app.core.config import settings
from app.llm.base import LLM

class OpenAICompatibleLLM(LLM):
    def __init__(
        self,
        model: str,
        api_key: str | None = None,
        base_url: str | None = None
    ):
        self._model = model
        self.client = OpenAI(
            api_key=api_key or settings.openai_api_key,
            base_url=base_url
        )

    @property
    def model_name(self) -> str:
        return self._model

    def generate(self, messages: list[dict]) -> str:
        response = self.client.chat.completions.create(
            model=self._model,
            messages=messages,
            reasoning_effort="minimal",
            max_completion_tokens=500
        )
        return response.choices[0].message.content or ""
