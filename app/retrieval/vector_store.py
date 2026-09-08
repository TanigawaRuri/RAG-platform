import faiss
import numpy as np
from sentence_transformers import SentenceTransformer


class VectorStore:
    def __init__(
        self,
        model_name: str = "BAAI/bge-m3",
    ):
        self.model = SentenceTransformer(model_name)

        self.index = None
        self.documents = []

    def build(self, documents: list[dict]):
        self.documents = documents
        texts = [
            document["text"]
            for document in documents
        ]
        embeddings = self.model.encode(
            texts,
            normalize_embeddings=True,
            convert_to_numpy=True,
        )

        embeddings = embeddings.astype("float32")
        dimension = embeddings.shape[1]
        self.index = faiss.IndexFlatIP(dimension)
        self.index.add(embeddings)

    def search(
        self,
        query: str,
        top_k: int = 3,
    ) -> list[dict]:

        if self.index is None:
            raise RuntimeError(
                "Vector store has not been built."
            )
        
        query_embedding = self.model.encode(
            [query],
            normalize_embeddings=True,
            convert_to_numpy=True,
        )
        query_embedding = query_embedding.astype("float32")
        scores, indices = self.index.search(
            query_embedding,
            top_k,
        )

        results = []

        for score, index in zip(scores[0], indices[0]):
            if index == -1:
                continue

            document = self.documents[index].copy()
            document["score"] = float(score)
            results.append(document)

        return results