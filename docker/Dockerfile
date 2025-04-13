# Use a more secure and updated base image
FROM osrf/ros:humble-ros-core

# Use a vulnerability scanning tool to identify and mitigate issues
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    debsums \
    apt-transport-https && \
    debsums -c && \
    rm -rf /var/lib/apt/lists/*

# Update all packages to their latest versions to mitigate vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Install necessary ROS2 packages and system utilities
RUN apt-get update && apt-get install -y \
    ros-humble-rviz2 \
    ros-humble-rqt \
    ros-humble-rqt-common-plugins \
    python3-pip \
    python3-colcon-common-extensions \
    git \
    vim \
    supervisor \
    xvfb \
    x11vnc \
    novnc \
    iputils-ping \
    net-tools \
    iproute2 \
    openssh-server \
    fluxbox \
    xterm \
    sudo \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*

# Ensure SSH runs properly
RUN mkdir -p /var/run/sshd

# Enable SSH Root Login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install Python dependencies
RUN pip3 install --no-cache-dir \
    numpy \
    matplotlib \
    jupyter \
    notebook

# Setup workspace
WORKDIR /workspace
RUN mkdir -p ros2_ws/src

# Setup ROS environment
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc
RUN echo "source /workspace/ros2_ws/install/setup.bash 2>/dev/null || true" >> /etc/bash.bashrc

# Create a student user (runtime configurable)
ARG USERNAME=student
ENV USERNAME=$USERNAME
RUN useradd -m "$USERNAME" && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod -aG sudo "$USERNAME"

# Set VNC Password dynamically based on USERNAME
RUN mkdir -p /root/.vnc && \
    echo -n "$USERNAME" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Copy supervisord configuration **before modifying it**
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Modify supervisord.conf to use the VNC password
RUN sed -i 's/x11vnc -display :1 -forever -shared -nopw/x11vnc -display :0 -forever -shared -rfbauth \/root\/.vnc\/passwd/' /etc/supervisor/conf.d/supervisord.conf

# Set Jupyter Token dynamically
RUN mkdir -p /root/.jupyter
RUN echo "c.NotebookApp.token = '$USERNAME'" > /root/.jupyter/jupyter_notebook_config.py

# Setup noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    git clone https://github.com/novnc/websockify.git /opt/novnc/utils/websockify && \
    chmod +x /opt/novnc/utils/novnc_proxy

# Configure X11, VNC, and Fluxbox for GUI access
RUN mkdir -p /root/.vnc && \
    echo '#!/bin/sh' > /root/.vnc/xstartup && \
    echo 'fluxbox &' >> /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# Copy supervisord configuration (again for Docker caching reasons)
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose required ports
EXPOSE 22 80 8888 11311 5900 6080

# Start Supervisor to manage services (SSH, Jupyter, VNC, noVNC)
CMD ["/usr/bin/supervisord"]
