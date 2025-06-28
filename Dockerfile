FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl sudo gnupg && \
    apt-get clean

# Create ollama user
RUN useradd -m -s /bin/bash ollama && \
    usermod -aG sudo ollama

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Switch to ollama user
USER ollama
WORKDIR /home/ollama

# Expose Ollama's default port
EXPOSE 11434

# Copy and set up entrypoint
COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
USER ollama

# Start Ollama
CMD ["/entrypoint.sh"]
