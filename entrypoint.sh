#!/bin/bash

# Set host to 0.0.0.0 so Render can access it
export OLLAMA_HOST=0.0.0.0

# Start Ollama in background
ollama serve &

# Wait for server to be ready
sleep 5

# Pull the model
ollama pull smollm:135m

# Keep it alive
wait
