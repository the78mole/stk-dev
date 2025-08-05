# Use Ubuntu as base image
FROM ubuntu:24.04

# Set environment variables for non-interactive package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential cmake libbluetooth-dev libsdl2-dev \
    libcurl4-openssl-dev libenet-dev libfreetype6-dev libharfbuzz-dev \
    libjpeg-dev libogg-dev libopenal-dev libpng-dev \
    libssl-dev libvorbis-dev libmbedtls-dev pkg-config zlib1g-dev \
    git subversion wget curl vim nano sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install OpenGL/GPU libraries and Mesa drivers
RUN apt-get update && apt-get install -y \
    mesa-utils \
    mesa-common-dev \
    libgl1-mesa-dev \
    libgl1-mesa-dri \
    libglapi-mesa \
    libglu1-mesa-dev \
    libglfw3-dev \
    libglew-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    x11-utils \
    xauth \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install libshaderc for Vulkan support
RUN apt-get update && apt-get install -y \
    libshaderc-dev \
    vulkan-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure ubuntu user for sudo access
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy entrypoint script and GPU test
COPY .devcontainer/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY .devcontainer/gpu-test.sh /usr/local/bin/gpu-test.sh
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/gpu-test.sh

# Create workspace directory and set permissions
RUN mkdir -p /workspace && chown -R ubuntu:ubuntu /workspace

# Switch to ubuntu user
USER ubuntu

# Set working directory
WORKDIR /workspace

# Set entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set default container command
CMD ["bash"]
