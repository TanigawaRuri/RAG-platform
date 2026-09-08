import os

from opentelemetry import trace
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import (
    OTLPSpanExporter,
)

def setup_tracing(service_name: str = "llm-rag-service") -> None:
    resource = Resource.create(
        {
            "service.name": service_name,
            "service.version": "1.0.0",
            "deployment.environment": os.getenv(
                "ENVIRONMENT",
                "development",
            ),
        }
    )

    provider = TracerProvider(resource=resource)

    endpoint = os.getenv(
        "OTEL_EXPORTER_OTLP_ENDPOINT"
    )

    if endpoint:
        exporter = OTLPSpanExporter(
            endpoint=f"{endpoint}/v1/traces"
        )

        processor = BatchSpanProcessor(exporter)
        provider.add_span_processor(processor)

    trace.set_tracer_provider(provider)


def get_tracer(name: str):
    return trace.get_tracer(name)