import asyncio
import json
import time
from pathlib import Path

from app.core.config import settings
from app.llm.router import ModelRouter

from app.services.rag_service import RAGService
from app.services.llm_service import LLMService
from app.cache import make_cache_key 
from app.cache.redis_cache import RedisCache
from evaluation.metrics import calculate_recall

DATASET_PATH = Path(__file__).parent / "dataset.json"
RESULTS_PATH = Path(__file__).parent / "results.json"

rag_service = RAGService()
llm_service = LLMService(
    router=ModelRouter.from_env()
)
cache = RedisCache(
        host=settings.redis_host,
        port=settings.redis_port)

def load_dataset() -> list[dict]:
    with open(DATASET_PATH, "r", encoding="utf-8") as f:
        return json.load(f)

def run_rag(question: str) -> dict:
    retrieval = rag_service.retrieve(query=question, top_k=5)
    retrieval_documents = retrieval['documents']
    retrieval_latency = retrieval['latency_ms']

    results = llm_service.chat(message=question, context=retrieval_documents)

    retrieved_documents = [document['source'] for document in retrieval_documents]

    return {
        "answer": results.answer,
        "retrieved_documents": retrieved_documents,
        "retrieval_latency": retrieval_latency,
        "llm_latency": results.latency_ms,
    }


async def run_rag_cached(question: str) -> dict:
    cache_key = make_cache_key(question)

    start = time.perf_counter()
    cached = await cache.get(cache_key)
    if cached is not None:
        latency_ms = round((time.perf_counter() - start) * 1000, 2)
        return {
            "cache_hit": True,
            "latency_ms": latency_ms,
            **cached,
        }

    response = run_rag(question)
    total_latency = round(response["retrieval_latency"] + response["llm_latency"], 2)
    await cache.set(cache_key, response, settings.cache_ttl_seconds)

    return {
        "cache_hit": False,
        "latency_ms": total_latency,
        **response,
    }


async def evaluate_question(item: dict) -> dict:
    question = item["question"]

    await cache.delete(make_cache_key(question))
    cold = await run_rag_cached(question)

    warm = await run_rag_cached(question)

    retrieved_documents = cold.get("retrieved_documents", [])

    return {
        "id": item["id"],
        "question": question,
        "expected_document": item["expected_document"],
        "expected_answer": item["expected_answer"],
        "retrieved_documents": retrieved_documents,
        "retrieval_latency": cold["retrieval_latency"],
        "llm_latency": cold["llm_latency"],
        "latency_ms": cold["latency_ms"],
        "cache_miss_latency_ms": cold["latency_ms"],
        "cache_hit_latency_ms": warm["latency_ms"],
        "cache_hit_confirmed": warm["cache_hit"],
    }


async def main():
    dataset = load_dataset()

    print("=" * 50)
    print("             RAG EVALUATION")
    print("=" * 50)

    results = []

    for index, item in enumerate(dataset, start=1):
        print(
            f"[{index:02d}/{len(dataset)}] "
            f"{item['question']}"
        )

        try:
            result = await evaluate_question(item)
            results.append(result)

        except Exception as exc:
            print(f"  ERROR: {exc}")

    recall_1 = calculate_recall(results, 1)
    recall_3 = calculate_recall(results, 3)
    recall_5 = calculate_recall(results, 5)

    retrieval_latencies = [result["retrieval_latency"] for result in results]
    llm_latencies = [result["llm_latency"] for result in results]
    end_to_end_latencies = [result["latency_ms"] for result in results]

    average_retrieval_latency = (
        sum(retrieval_latencies) / len(retrieval_latencies)
        if retrieval_latencies else 0
    )
    average_llm_latency = (
        sum(llm_latencies) / len(llm_latencies)
        if llm_latencies else 0
    )
    average_latency = (
        sum(end_to_end_latencies) / len(end_to_end_latencies)
        if end_to_end_latencies else 0
    )

    cache_miss_latencies = [result["cache_miss_latency_ms"] for result in results]
    cache_hit_latencies = [result["cache_hit_latency_ms"] for result in results]
    confirmed_hits = sum(1 for result in results if result["cache_hit_confirmed"])

    average_cache_miss_latency = (
        sum(cache_miss_latencies) / len(cache_miss_latencies)
        if cache_miss_latencies else 0
    )
    average_cache_hit_latency = (
        sum(cache_hit_latencies) / len(cache_hit_latencies)
        if cache_hit_latencies else 0
    )
    cache_hit_confirmation_rate = confirmed_hits / len(results) if results else 0
    speedup_factor = (
        average_cache_miss_latency / average_cache_hit_latency
        if average_cache_hit_latency else 0
    )

    print()
    print("Retrieval")
    print("-" * 50)
    print(f"Recall@1: {recall_1:.1%}")
    print(f"Recall@3: {recall_3:.1%}")
    print(f"Recall@5: {recall_5:.1%}")

    print()
    print("Performance")
    print("-" * 50)
    print(f"Average retrieval latency: {average_retrieval_latency:.2f} ms")
    print(f"Average LLM latency: {average_llm_latency:.2f} ms")
    print(f"Average end-to-end latency: {average_latency:.2f} ms")

    print()
    print("Cache (Redis)")
    print("-" * 50)
    print(f"Average cache-miss (cold) latency: {average_cache_miss_latency:.2f} ms")
    print(f"Average cache-hit (warm) latency: {average_cache_hit_latency:.2f} ms")
    print(f"Cache hit confirmation rate: {cache_hit_confirmation_rate:.1%}")
    print(f"Speedup factor (miss / hit): {speedup_factor:.1f}x")

    with open(RESULTS_PATH, "w", encoding="utf-8") as f:
        json.dump(
            {
                "metrics": {
                    "recall_at_1": recall_1,
                    "recall_at_3": recall_3,
                    "recall_at_5": recall_5,
                    "average_latency_ms": average_latency,
                    "average_retrieval_latency_ms": average_retrieval_latency,
                    "average_llm_latency_ms": average_llm_latency,
                    "average_cache_miss_latency_ms": average_cache_miss_latency,
                    "average_cache_hit_latency_ms": average_cache_hit_latency,
                    "cache_hit_confirmation_rate": cache_hit_confirmation_rate,
                    "cache_speedup_factor": speedup_factor,
                },
                "results": results,
            },
            f,
            ensure_ascii=False,
            indent=2,
        )

    print()
    print(f"Results saved to: {RESULTS_PATH}")


if __name__ == "__main__":
    asyncio.run(main())