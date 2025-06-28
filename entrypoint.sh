#!/bin/bash
set -e

export OLLAMA_HOST=0.0.0.0:11434

echo "Starting Ollama server..."
ollama serve &
OLLAMA_PID=$!

echo "Waiting for Ollama to be ready..."
while ! curl -s http://localhost:11434/api/tags >/dev/null 2>&1; do
    sleep 2
done

echo "Pulling smollm:135m model..."
ollama pull smollm:135m

echo "Ollama is ready!"
wait $OLLAMA_PID
