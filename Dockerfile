FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gnupg && \
    apt-get clean

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Expose the Ollama port
EXPOSE 11434

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start Ollama and preload the model
CMD ["/entrypoint.sh"]
