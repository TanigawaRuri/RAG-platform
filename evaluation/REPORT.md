# RAG Evaluation Report

## Dataset

- Questions: 31
- Evaluation type: source-document retrieval recall

## Retrieval Quality

| Metric | Score |
|---|---:|
| Recall@1 | 100.0% |
| Recall@3 | 100.0% |
| Recall@5 | 100.0% |

## Performance

| Metric | Mean |
|---|---:|
| Retrieval latency | 135.74 ms |
| LLM latency | 1422.96 ms |
| End-to-end latency | 1558.70 ms |

## Cache Performance (Redis)

| Metric | Value |
|---|---:|
| Cache miss (cold) latency | 1558.70 ms |
| Cache hit (warm) latency | 0.48 ms |
| Cache hit confirmation rate | 100.0% |
| Speedup (miss / hit) | 3260.4x |

## Interpretation

Recall@k is counted as a hit when the expected source document appears in the top-k retrieved results. The current benchmark uses a small synthetic policy knowledge base, so the perfect retrieval score should be treated as a baseline rather than evidence of general retrieval quality.

The latency breakdown shows that LLM inference dominates the request path, making inference optimization, model routing, caching, and batching the most promising performance levers.

Caching has the largest measured impact of any lever tested so far: for repeated queries, response time drops from a full RAG + LLM round trip (~1559 ms) to a Redis lookup (~0.48 ms), a 3260x improvement. This applies specifically to repeated/identical queries; a production traffic mix of unique and repeated questions will see a smaller blended improvement, so cache hit-rate under real traffic is the number that determines actual production impact.

## Next Experiments

1. Compare embedding models.
2. Tune chunk size and overlap.
3. Add hybrid keyword + vector retrieval.
4. Add a reranker.
5. Measure cache hit-rate under real (non-repeated) production-like traffic, not just repeated-query benchmarks.
6. Compare inference backends such as Triton or Ray Serve under concurrent load.
