#!/bin/sh

# On detecte qui on est 
NAME=$(hostname)

if [ "$NAME" = "gmersch-router-1" ]; then
    MY_IP="10.1.1.1" ; REMOTE="10.1.1.2"
else
    MY_IP="10.1.1.2" ; REMOTE="10.1.1.1"
fi

# 1. Config physique
ip addr add $MY_IP/24 dev eth0
ip link set eth0 up

# 2. Montage VXLAN
ip link add br0 type bridge
ip link set br0 up
ip link add vxlan10 type vxlan id 10 remote $REMOTE dev eth0 dstport 4789
ip link set vxlan10 up

# 3. Branchement (eth1 vers le Host)
ip link set eth1 master br0
ip link set eth1 up
ip link set vxlan10 master br0