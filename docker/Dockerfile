# =========================================================
# ROS 2 Humble – Student Environment (TRO029) (bulletproof)
# =========================================================
FROM ros:humble

SHELL ["/bin/bash", "-lc"]

# ---------------------------------------------------------
# System update + integrity tools
# ---------------------------------------------------------
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
      debsums \
      apt-transport-https && \
    debsums -c || true && \
    rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------
# ROS 2 CLI + tools + GUI + remote access
# ---------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    # --- ROS 2 CLI (CRITICAL) ---
    ros-humble-ros2cli \
    ros-humble-ros2launch \
    ros-humble-ros2topic \
    ros-humble-ros2node \
    ros-humble-ros2service \
    ros-humble-ros2param \
    \
    # --- ROS visual / demo ---
    ros-humble-rviz2 \
    ros-humble-rqt \
    ros-humble-rqt-common-plugins \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    \
    # --- Dev tools ---
    python3-colcon-common-extensions \
    python3-pip \
    git \
    vim \
    sudo \
    \
    # --- Networking / diagnostics ---
    iputils-ping \
    net-tools \
    iproute2 \
    \
    # --- GUI / VNC / remote ---
    supervisor \
    xvfb \
    x11vnc \
    fluxbox \
    xterm \
    tightvncserver \
    openssh-server \
    \
    && rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------
# Python tools (Jupyter)
# ---------------------------------------------------------
RUN pip3 install --no-cache-dir \
    numpy \
    matplotlib \
    jupyter \
    notebook

# ---------------------------------------------------------
# SSH setup
# ---------------------------------------------------------
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# ---------------------------------------------------------
# Bulletproof ROS env for bash -lc (no manual "source" needed)
# - We create /etc/profile.d/ros_env.sh
# - We set BASH_ENV so non-interactive shells also source it
# ---------------------------------------------------------
ENV ROS_DISTRO=humble
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV BASH_ENV=/etc/profile.d/ros_env.sh

RUN set -eux; \
    printf '%s\n' \
      '#!/usr/bin/env bash' \
      'set +e' \
      '' \
      '# Source ROS setup (sets PATH, AMENT_PREFIX_PATH, etc.)' \
      'if [ -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]; then' \
      '  source "/opt/ros/${ROS_DISTRO}/setup.bash"' \
      'fi' \
      '' \
      '# Ensure Python can see ROS dist-info without manual sourcing' \
      'PYVER="$(python3 -c '\''import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")'\'' )"' \
      'ROSROOT="/opt/ros/${ROS_DISTRO}"' \
      'for p in \' \
      '  "${ROSROOT}/lib/python${PYVER}/site-packages" \' \
      '  "${ROSROOT}/local/lib/python${PYVER}/dist-packages" \' \
      '  "${ROSROOT}/lib/python${PYVER}/dist-packages" \' \
      '  "${ROSROOT}/local/lib/python${PYVER}/site-packages" \' \
      '; do' \
      '  if [ -d "$p" ]; then' \
      '    export PYTHONPATH="$p:${PYTHONPATH:-}"' \
      '  fi' \
      'done' \
      '' \
      'set -e' \
      > /etc/profile.d/ros_env.sh; \
    chmod +x /etc/profile.d/ros_env.sh; \
    # also for interactive shells
    echo 'source /etc/profile.d/ros_env.sh' >> /etc/bash.bashrc

# ---------------------------------------------------------
# Workspace layout
# ---------------------------------------------------------
WORKDIR /workspace
RUN mkdir -p /workspace/ros2_ws/src

# Optional overlay (if exists)
RUN echo 'source /workspace/ros2_ws/install/setup.bash 2>/dev/null || true' >> /etc/bash.bashrc

# ---------------------------------------------------------
# Student user
# ---------------------------------------------------------
ARG USERNAME=student
ENV USERNAME=${USERNAME}

RUN useradd -m "${USERNAME}" && \
    echo "${USERNAME}:${USERNAME}" | chpasswd && \
    usermod -aG sudo "${USERNAME}"

# ---------------------------------------------------------
# VNC password (root)
# ---------------------------------------------------------
RUN mkdir -p /root/.vnc && \
    echo -n "${USERNAME}" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# ---------------------------------------------------------
# Supervisord
# ---------------------------------------------------------
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# ---------------------------------------------------------
# Jupyter config (token)
# ---------------------------------------------------------
RUN mkdir -p /root/.jupyter && \
    echo "c.NotebookApp.token = '${USERNAME}'" > /root/.jupyter/jupyter_notebook_config.py

# ---------------------------------------------------------
# noVNC (upstream)
# ---------------------------------------------------------
RUN git clone --depth 1 https://github.com/novnc/noVNC.git /opt/novnc && \
    git clone --depth 1 https://github.com/novnc/websockify.git /opt/novnc/utils/websockify && \
    chmod +x /opt/novnc/utils/novnc_proxy

# ---------------------------------------------------------
# X11 / Fluxbox
# ---------------------------------------------------------
RUN mkdir -p /root/.vnc && \
    printf '%s\n' '#!/bin/sh' 'fluxbox &' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# ---------------------------------------------------------
# Logs + ports
# ---------------------------------------------------------
RUN mkdir -p /var/log/supervisor

EXPOSE 22 80 8888 11311 5900 6080

CMD ["/usr/bin/supervisord"]
