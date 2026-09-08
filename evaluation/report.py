import json
from pathlib import Path

RESULTS_PATH = Path(__file__).parent / "results.json"
REPORT_PATH = Path(__file__).parent / "REPORT.md"

def main():
    data = json.loads(RESULTS_PATH.read_text(encoding="utf-8"))
    metrics = data["metrics"]
    report = f"""# RAG Evaluation Report

## Dataset

- Questions: {len(data["results"])}
- Evaluation type: source-document retrieval recall

## Retrieval Quality

| Metric | Score |
|---|---:|
| Recall@1 | {metrics["recall_at_1"]:.1%} |
| Recall@3 | {metrics["recall_at_3"]:.1%} |
| Recall@5 | {metrics["recall_at_5"]:.1%} |

## Performance

| Metric | Mean |
|---|---:|
| Retrieval latency | {metrics["average_retrieval_latency_ms"]:.2f} ms |
| LLM latency | {metrics["average_llm_latency_ms"]:.2f} ms |
| End-to-end latency | {metrics["average_latency_ms"]:.2f} ms |

## Interpretation

Recall@k is counted as a hit when the expected source document appears in the top-k retrieved results. The current benchmark uses a small synthetic policy knowledge base, so the perfect retrieval score should be treated as a baseline rather than evidence of general retrieval quality.

The latency breakdown shows that LLM inference dominates the request path, making inference optimization, model routing, caching, and batching the most promising next performance levers.

## Next Experiments

1. Compare embedding models.
2. Tune chunk size and overlap.
3. Add hybrid keyword + vector retrieval.
4. Add a reranker.
5. Measure cache hit-rate and latency under repeated traffic.
6. Compare inference backends such as Triton or Ray Serve under concurrent load.
"""
    REPORT_PATH.write_text(report, encoding="utf-8")
    print(f"Report written to {REPORT_PATH}")

if __name__ == "__main__":
    main()