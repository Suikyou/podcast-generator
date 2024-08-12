FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PyYAML
RUN pip install PyYAML

# Copy scripts to the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Optional: Verify the installation and paths
RUN python --version
RUN pip --version
RUN ls -l /usr/bin/feed.py
RUN ls -l /entrypoint.sh
