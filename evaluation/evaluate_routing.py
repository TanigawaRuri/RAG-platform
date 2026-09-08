import json
from pathlib import Path

from app.llm.router import ModelRouter

DATASET_PATH = Path(__file__).parent / "routing_dataset.json"
RESULTS_PATH = Path(__file__).parent / "routing_results.json"

def load_dataset():
    return json.loads(DATASET_PATH.read_text(encoding="utf-8"))

def main():
    router = ModelRouter(small_model=None, large_model=None)
    dataset = load_dataset()
    results = []

    for item in dataset:
        decision = router.route(item["question"])
        results.append({
            "question": item["question"],
            "expected_tier": item["expected_tier"],
            "predicted_tier": decision.tier.value,
            "reason": decision.reason,
            "correct": decision.tier.value == item["expected_tier"],
        })
        
        correct = sum(item["correct"] for item in results)
        accuracy = correct / len(results) if results else 0.0

        payload = {
            "total": len(results),
            "correct": correct,
            "accuracy": accuracy,
            "results": results,
        }

        RESULTS_PATH.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"

    print("=" * 60)
    print("MODEL ROUTING EVALUATION")
    print("=" * 60)
    for item in results:
        status = "PASS" if item["correct"] else "FAIL"
        print(f"[{status}] expected={item['expected_tier']:<6} predicted={item['predicted_tier']:<6} reason={item['reason']}")
        print(f"       {item['question']}")
    print("-" * 60)
    print(f"Total queries: {len(results)}")
    print(f"Accuracy:      {accuracy:.2%}")
    print(f"Saved to:      {RESULTS_PATH}")

if __name__ == "__main__":
    main()