from abc import ABC, abstractmethod

class LLM(ABC):
    @abstractmethod
    def generate(self, messages: list[dict]) -> str:
        raise NotImplementedError

    @property
    @abstractmethod
    def model_name(self) -> str:
        raise NotImplementedError