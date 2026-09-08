import re

def split_into_sentences(text: str) -> list[str]:
    text = text.replace("\n", " ")

    sentences = re.split(r"(?<=[.!?])\s+", text)

    return [
        sentence.strip()
        for sentence in sentences
        if sentence.strip()
    ]

def chunk_text(
    text: str,
    chunk_size: int = 100,
    overlap: int = 20
) -> list[str]:
    words = text.split()
    if not words:
        return []
    
    chunks = []
    start = 0

    while start < len(words):
        end = min(start + chunk_size, len(words))

        chunk = " ".join(words[start:end])
        chunks.append(chunk)

        if end == len(words):
            break

        start = end - overlap
    
    return chunks

def chunk_documents(documents: list[dict]) -> list[dict]:
    chunks = []
    
    for document in documents:
        document_chunks = chunk_text(document["text"])

        for index, chunk in enumerate(document_chunks):
            chunks.append(
                {
                    "text": chunk,
                    "source": document["source"],
                    "chunk_id": index
                }
            )
    
    return chunks