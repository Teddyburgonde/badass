#!/bin/sh

# Nettoyage
ip link del vxlan10 2>/dev/null
ip link del br0 2>/dev/null

# Bridge
ip link add br0 type bridge
ip link set br0 up


# VXLAN statique
ip link add vxlan10 type vxlan id 10 remote 10.0.0.2 dev eth0 dstport 4789
ip link set vxlan10 up

# Bridge attach
ip link set eth0 master br0
ip link set vxlan10 master br0

# Attribution de l'adresse IP au bridge
ip addr add 10.0.0.1/24 dev br0
