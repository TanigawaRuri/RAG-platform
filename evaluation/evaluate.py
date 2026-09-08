import json
import time
from pathlib import Path
from openai import OpenAI

from app.core.config import settings
from app.llm.router import ModelRouter

from app.services.rag_service import RAGService
from app.services.llm_service import LLMService
from evaluation.metrics import calculate_recall

DATASET_PATH = Path(__file__).parent / "dataset.json"
RESULTS_PATH = Path(__file__).parent / "results.json"

rag_service = RAGService()
llm_service = LLMService(
    client=OpenAI(api_key=settings.openai_api_key),
    router=ModelRouter.from_env()
)

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
        "retrieval_latency" : retrieval_latency,
        "llm_latency" : results.latency_ms
    }

def evaluate_question(item: dict) -> dict:
    question = item["question"]
    response = run_rag(question)

    retrieved_documents = response.get(
        "retrieved_documents",
        [],
    )

    return {
        "id": item["id"],
        "question": question,
        "expected_document": item["expected_document"], 
        "expected_answer": item["expected_answer"],
        "retrieved_documents": retrieved_documents,
        "retrieval_latency": response["retrieval_latency"],
        "llm_latency": response["llm_latency"],
        "latency_ms": round(response["retrieval_latency"] + response["llm_latency"], 2),
    }


def main():
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
            result = evaluate_question(item)
            results.append(result)

        except Exception as exc:
            print(f"  ERROR: {exc}")

    recall_1 = calculate_recall(results, 1)
    recall_3 = calculate_recall(results, 3)
    recall_5 = calculate_recall(results, 5)

    retrieval_latencies = [result["retrieval_latency"] for result in results]
    llm_latencies = [result["llm_latency"] for result in results]
    average_latency = sum(latencies) / len(latencies) if latencies else 0

    average_retrieval_latency = (
        sum(retrieval_latencies) / len(retrieval_latencies)
        if retrieval_latencies else 0
    )
    average_llm_latency = (
        sum(llm_latencies) / len(llm_latencies)
        if llm_latencies else 0
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

    with open(RESULTS_PATH, "w", encoding="utf-8") as f:
        json.dump(
            {
                "metrics": {
                    "recall_at_1": recall_1,
                    "recall_at_3": recall_3,
                    "recall_at_5": recall_5,
                    "average_latency_ms": average_latency,
                    "average_retrieval_latency_ms": average_retrieval_latency,
                    "average_llm_latency_ms": average_llm_latency
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
    main()