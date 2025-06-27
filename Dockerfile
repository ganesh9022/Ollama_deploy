FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gnupg && \
    apt-get clean

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Expose Ollama's default port
EXPOSE 11434

# Copy and set up entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Ollama
CMD ["/entrypoint.sh"]
