FROM maven:3.6.3-openjdk-17-slim

RUN useradd -m -u 1000 -s /bin/bash jenkins & \
apt-get clean & \
apt-get update & \
apt install -y openssh-client
