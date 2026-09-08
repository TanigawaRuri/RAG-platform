from typing import Iterable

def recall_at_k(
    retrieved_documents: Iterable[str],
    expected_document: str | None,
    k: int
) -> float:
    if expected_document is None:
        return 0.0
    
    retrived = retrieved_documents[:k]

    return float(expected_document in retrived)

def mean(values: list[float]) -> float:
    if not values:
        return 0.0
    
    return sum(values) / len(values)

def calculate_recall(
    results: list[dict],
    k: int
) -> float:
    scores = [
        recall_at_k(
            result["retrieved_documents"],
            result["expected_document"],
            k
        )
        for result in results
        if result["expected_document"] is not None
    ]

    return mean(scores)

def percentile(values: list[float], p: float) -> float:
    if not values:
        return 0.0

    values = sorted(values)

    index = (len(values) - 1) * p
    lower = int(index)
    upper = min(lower + 1, len(values) - 1)

    weight = index - lower

    return (
        values[lower]
        + (values[upper] - values[lower]) * weight
    )