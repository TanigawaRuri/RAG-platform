from pathlib import Path

def load_documents(data_dir: str = "data") -> list[dict]:
    documents = []
    data_path = Path(data_dir)

    for file_path in data_path.glob("*.md"):
        text = file_path.read_text(encoding="utf-8")

        documents.append(
            {
                "text": text,
                "source": file_path.name 
            }
        )
    
    return documents