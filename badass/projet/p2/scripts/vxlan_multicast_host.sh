#!/bin/sh

# Nettoyage des anciennes interfaces (si elles existent)
ip link del vxlan10 2>/dev/null
ip link del br0 2>/dev/null

# Création du bridge et activation du bridge
ip link add br0 type bridge
ip link set br0 up 

# Création de l'interface VXLAN en mode multicast
ip link add vxlan10 type vxlan id 10 group 239.1.1.1 dev eth0 dstport 4789
ip link set vxlan10 up

# Attachement de l'interface physique et du VXLAN au bridge
ip link set eth0 master br0
ip link set vxlan10 master br0

# Attribution de l'adresse IP au bridge
ip addr add 10.0.0.1/24 dev br0