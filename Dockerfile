FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gnupg && \
    apt-get clean

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Preload the smollm model
RUN ollama pull smollm:135m

# Expose Ollama's default port
EXPOSE 11434

# Start the Ollama server
CMD ["ollama", "serve"]
