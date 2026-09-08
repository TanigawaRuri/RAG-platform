import time

from app.monitoring.metrics import RETRIEVAL_LATENCY, RETRIEVAL_REQUESTS, RETRIEVED_DOCUMENTS
from app.monitoring.tracing import get_tracer
from app.retrieval.chunker import chunk_documents
from app.retrieval.loader import load_documents
from app.retrieval.vector_store import VectorStore

tracer = get_tracer(__name__)

class RAGService:
    def __init__(self, data_dir: str = "data"):
        documents = load_documents(data_dir)
        if not documents:
            raise ValueError(f"No markdown documents found in {data_dir!r}")
            
        chunks = chunk_documents(documents)
        if not chunks:
            raise ValueError("Knowledge base produced no chunks")

        self.vector_store = VectorStore()
        self.vector_store.build(chunks)
        self.document_count = len(documents)
        self.chunk_count = len(chunks)

    def retrieve(self, query: str, top_k: int = 3) -> dict:
        RETRIEVAL_REQUESTS.inc()
        start = time.perf_counter()

        with tracer.start_as_current_span("rag.retrieval") as span:
            span.set_attribute("rag.top_k", top_k)
            try:
                documents = self.vector_store.search(
                    query=query,
                    top_k=top_k
                )
                span.set_attribute("rag.document_count", len(documents))
                RETRIEVED_DOCUMENTS.observe(len(documents))
                return {
                    "documents": documents,
                    "latency_ms": round((time.perf_counter() - start) * 1000, 2)
                }
            finally:
                elapsed = time.perf_counter() - start
                RETRIEVAL_LATENCY.observe(elapsed)
                span.set_attribute("rag.latancy_ms", elapsed * 1000)