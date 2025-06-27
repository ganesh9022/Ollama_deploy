#!/bin/bash

# Start the Ollama server in the background
ollama serve &

# Wait for the server to boot
sleep 5

# Pull the model
ollama pull smollm:135m

# Keep Ollama running
wait
