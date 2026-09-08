from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    SMALL_MODEL: str = "gpt-5-nano"
    LARGE_MODEL: str = "gpt-5.1"

    openai_api_key: str | None = None

    redis_host: str = "localhost"
    redis_port: int = 6379
    redis_db: int = 0
    cache_ttl_seconds: int = 300

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore"
    )

settings = Settings()