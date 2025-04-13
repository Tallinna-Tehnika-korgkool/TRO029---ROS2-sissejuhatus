# ROS 2 Humble base image
FROM ros:humble

# Süsteemi uuendus ja turvakontroll
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    debsums \
    apt-transport-https && \
    debsums -c && \
    rm -rf /var/lib/apt/lists/*

# Vajalikud ROS 2 paketid ja tööriistad
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

# SSH jaoks vajalik kaust
RUN mkdir -p /var/run/sshd

# SSH Root login lubamine
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Python-põhised tööriistad
RUN pip3 install --no-cache-dir \
    numpy \
    matplotlib \
    jupyter \
    notebook

# Töökeskkonna seadistus
WORKDIR /workspace
RUN mkdir -p ros2_ws/src

# ROS 2 keskkonna allikate lisamine
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc && \
    echo "source /workspace/ros2_ws/install/setup.bash 2>/dev/null || true" >> /etc/bash.bashrc

# Tudengi kasutaja loomine
ARG USERNAME=student
ENV USERNAME=$USERNAME
RUN useradd -m "$USERNAME" && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod -aG sudo "$USERNAME"

# VNC parooli seadistus
RUN mkdir -p /root/.vnc && \
    echo -n "$USERNAME" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Supervisord konfiguratsioonifail
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Jupyter parool ja seadistused
RUN mkdir -p /root/.jupyter && \
    echo "c.NotebookApp.token = '$USERNAME'" > /root/.jupyter/jupyter_notebook_config.py

# noVNC seadistamine
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    git clone https://github.com/novnc/websockify.git /opt/novnc/utils/websockify && \
    chmod +x /opt/novnc/utils/novnc_proxy

# X11 + VNC GUI seadistamine
RUN mkdir -p /root/.vnc && \
    echo '#!/bin/sh' > /root/.vnc/xstartup && \
    echo 'fluxbox &' >> /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# Kaust logide jaoks
RUN mkdir -p /var/log/supervisor

# Vajalikud pordid
EXPOSE 22 80 8888 11311 5900 6080

# Käivitamine
CMD ["/usr/bin/supervisord"]
