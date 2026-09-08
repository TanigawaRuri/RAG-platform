from dataclasses import dataclass
from enum import Enum

from app.core.config import settings
from app.llm.base import LLM

class ModelTier(str, Enum):
    SMALL = "small"
    LARGE = "large"

@dataclass
class RoutingDecision:
    tier: ModelTier
    reason: str

class ModelRouter:
    COMPLEX_KEYWORDS = (
        "compare", "comparison", "analyze", "analysis", "explain why",
        "explain", "different", "difference", "differences", "recommend",
        "recommendation", "pros and cons", "trade-off", "tradeoff",
        "evaluate", "evaluate whether"
    )

    def __init__(self, small_model: LLM, large_model: LLM, word_threshold: int = 30):
        self.small_model = small_model
        self.large_model = large_model
        self.word_threshold = word_threshold
    
    @classmethod
    def from_env(cls, word_threshold: int = 30) -> "ModelRouter":
        from app.llm.client import OpenAICompatibleLLM
        
        return cls(
            small_model=OpenAICompatibleLLM(model=settings.SMALL_MODEL),
            large_model=OpenAICompatibleLLM(model=settings.LARGE_MODEL),
            word_threshold=word_threshold
        )

    def route(self, question: str) -> RoutingDecision:
        normalized = question.lower().strip()

        for keyword in self.COMPLEX_KEYWORDS:
            if keyword in normalized:
                return RoutingDecision(tier=ModelTier.LARGE, reason=f"complex_keyword:{keyword}")
        
        word_count = len(normalized.split())
        if word_count > self.word_threshold:
            return RoutingDecision(
                tier=ModelTier.LARGE,
                reason=f"long_query:{word_count}_words"
            )
        
        return RoutingDecision(
            tier=ModelTier.SMALL,
            reason="simple_query"
        )

    def get_model(self, decision: RoutingDecision) -> LLM:
        return self.large_model if decision.tier == ModelTier.LARGE else self.small_model

    def route_and_get_model(self, question: str) -> tuple[LLM, RoutingDecision]:
        decision = self.route(question)
        return self.get_model(decision), decision