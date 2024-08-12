FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy scripts to the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Optional: Verify the installation and paths
RUN python3 --version
RUN pip3 --version
RUN ls -l /usr/bin/feed.py
RUN ls -l /entrypoint.sh
