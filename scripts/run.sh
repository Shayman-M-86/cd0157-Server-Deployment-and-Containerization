#!/usr/bin/env bash
set -e

HOST="${HOST:-0.0.0.0}"
PORT="${PORT:-8080}"

exec uv run -- \
  gunicorn --bind "$HOST:$PORT" main:APP