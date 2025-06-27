#!/bin/bash

# Start Ollama in background
ollama serve --addr 0.0.0.0:11434 &

# Wait for Ollama to boot
sleep 5

# Pull the model
ollama pull smollm:135m

# Keep Ollama running in foreground
wait
