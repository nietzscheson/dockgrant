#!/usr/bin/env bash

### See: https://campalus.com/enable-remote-tcp-connections-to-docker-host-running-ubuntu-15-04/
### All credits for Xavi Campa

tee /etc/systemd/system/docker-tcp.socket <<-'EOF'
[Unit]
Description=Docker Socket for the API
[Socket]
ListenStream=2375
BindIPv6Only=both
Service=docker.service
[Install]
WantedBy=sockets.target
EOF

sudo systemctl enable docker-tcp.socket
sudo systemctl enable docker.socket
sudo systemctl stop docker
sudo systemctl start docker-tcp.socket
sudo systemctl start docker
