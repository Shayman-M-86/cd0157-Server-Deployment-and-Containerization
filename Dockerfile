# Build command:
#   docker build -f Docker/Dockerfile -t kubernetes-testing:latest .

FROM python:3.14-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    HOST=0.0.0.0 \
    PORT=8080 \
    WEB_CONCURRENCY=2 \
    TIMEOUT=60 


# Install runtime dependencies.
COPY . /app

WORKDIR /app

RUN uv sync --frozen --no-dev

# Copy application source.

EXPOSE 8080

CMD ["bash", "scripts/run.sh"]
