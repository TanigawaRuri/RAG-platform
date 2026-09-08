from app.llm.base import LLM
from app.llm.router import ModelRouter, ModelTier

class FakeLLM(LLM):
    def __init__(self, name: str):
        self._name = name

    @property
    def model_name(self) -> str:
        return self._name

    def generate(self, messages: list[dict]) -> str:
        return "fake response"


def create_router():
    return ModelRouter(FakeLLM("small"), FakeLLM("large"))


def test_simple_question_routes_to_small():
    assert create_router().route("How many vacation days do I have?").tier == ModelTier.SMALL


def test_comparison_routes_to_large():
    assert create_router().route("Compare the vacation policy and remote work policy").tier == ModelTier.LARGE


def test_analysis_routes_to_large():
    assert create_router().route("Analyze the differences between these two policies.").tier == ModelTier.LARGE


def test_long_query_routes_to_large():
    question = (
        "Please explain the company's vacation policy including eligibility requirements, "
        "approval procedures, carryover rules, expiration rules, and exceptions for different types of employees."
    )
    assert create_router().route(question).tier == ModelTier.LARGE
