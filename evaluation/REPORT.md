# RAG Evaluation Report

## Dataset

Number of questions: 31

## Retrieval

| Metric | Score |
|---|---:|
| Recall@1 | 100.0% |
| Recall@3 | 100.0% |
| Recall@5 | 100.0% |

## Performance

| Metric | Result |
|---|---:|
| retrieval | 111.37 ms |
| llm | 590.25 ms |
| total | 701.62 ms |
| Average latency | 902.96 ms |

## Analysis

### Retrieval

Recall@3 measures whether the expected source document
appears within the top three retrieved documents.

### Next improvements

Potential improvements include:

1. Better embedding models
2. Query rewriting
3. Improved chunking
4. Hybrid keyword/vector search
5. Reranking
6. Retrieval caching
