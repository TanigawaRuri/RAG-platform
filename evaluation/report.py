import json
from pathlib import Path

RESULTS_PATH = Path(__file__).parent / "results.json"
REPORT_PATH = Path(__file__).parent / "REPORT.md"


def main():
    data = json.loads(RESULTS_PATH.read_text(encoding="utf-8"))
    metrics = data["metrics"]

    report = f"""# RAG 평가 보고서

## 데이터셋

- 질문 수: {len(data["results"])}
- 평가 방식: 원본 문서 검색 Recall 평가

## 검색 품질

| 평가 지표 | 점수 |
|---|---:|
| Recall@1 | {metrics["recall_at_1"]:.1%} |
| Recall@3 | {metrics["recall_at_3"]:.1%} |
| Recall@5 | {metrics["recall_at_5"]:.1%} |

## 성능

| 평가 지표 | 평균 |
|---|---:|
| 문서 검색 지연 시간 | {metrics["average_retrieval_latency_ms"]:.2f} ms |
| LLM 지연 시간 | {metrics["average_llm_latency_ms"]:.2f} ms |
| 전체 요청 지연 시간 | {metrics["average_latency_ms"]:.2f} ms |

## 캐시 성능 (Redis)

| 평가 지표 | 값 |
|---|---:|
| 캐시 미스 (Cold) 지연 시간 | {metrics["average_cache_miss_latency_ms"]:.2f} ms |
| 캐시 히트 (Warm) 지연 시간 | {metrics["average_cache_hit_latency_ms"]:.2f} ms |
| 캐시 히트 확인율 | {metrics["cache_hit_confirmation_rate"]:.1%} |
| 성능 향상 배수 (Miss / Hit) | {metrics["cache_speedup_factor"]:.1f}x |

## 결과 해석

Recall@k는 기대하는 원본 문서가 검색 결과 상위 k개 내에 포함된 경우를 적중(hit)으로 계산합니다. 현재 벤치마크는 소규모의 임의의 정책 지식 베이스를 사용하고 있으므로, 완벽한 검색 성능은 일반적인 검색 품질을 입증하는 결과라기보다는 기준선(baseline)으로 해석해야 합니다.

지연 시간 분석 결과, 전체 요청 처리 시간에서 LLM 추론이 가장 큰 비중을 차지합니다. 따라서 추론 최적화, 모델 라우팅, 캐싱 및 배치 처리가 성능을 개선할 수 있는 주요 요소로 판단됩니다.

현재까지 측정한 최적화 요소 중 가장 큰 성능 개선 효과는 캐싱에서 확인되었습니다. 동일한 질문이 반복되는 경우, 전체 RAG + LLM 요청을 처리하는 시간(약 {metrics["average_cache_miss_latency_ms"]:.0f} ms)에서 Redis 조회만 수행하는 시간({metrics["average_cache_hit_latency_ms"]:.2f} ms)으로 감소하며, 약 {metrics["cache_speedup_factor"]:.0f}배의 성능 향상이 발생합니다.

다만 이러한 효과는 반복되거나 동일한 질문에 한정됩니다. 실제 운영 환경에서는 고유한 질문과 반복 질문이 혼합되어 발생하므로 전체적인 평균 성능 향상 폭은 더 작을 수 있습니다. 따라서 실제 운영 환경에서의 캐시 적중률(cache hit-rate)이 캐싱의 실질적인 성능 개선 효과를 결정하는 핵심 지표입니다.

## 다음 실험

1. 임베딩 모델별 성능 비교
2. Chunk 크기 및 Overlap 튜닝
3. 키워드 검색 + 벡터 검색을 결합한 Hybrid Retrieval 적용
4. Reranker 적용
5. 반복 질문이 아닌 실제 운영 환경과 유사한 트래픽에서 캐시 적중률 측정
6. 동시 요청 환경에서 Triton, Ray Serve 등의 추론 백엔드 성능 비교
"""

    REPORT_PATH.write_text(report, encoding="utf-8")
    print(f"보고서가 {REPORT_PATH}에 생성되었습니다.")


if __name__ == "__main__":
    main()