import hashlib

def make_cache_key(query: str) -> str:
    normalized = " ".join(query.lower().split())

    digest = hashlib.sha256(
        normalized.encode("utf-8")
    ).hexdigest()

    return f"rag:answer:{digest}"

