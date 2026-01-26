#!/bin/sh

# Créer l'interface VXLAN avec VNI 10
ip link add vxlan10 type vxlan id 10 local 1.1.1.4 destport 4789 nolearning

# Activer l'interface VXLAN 
ip link set dev vxlan10 up

# Créer le bridge
ip link // a continuer 

ip link add vxlan0 type vxlan id 42 local 1.1.1.4
ip link set dev vxlan0 up
ip link add br0 type bridge
ip link set br0 up
ip link set dev vxlan0 master br0
ip link set dev eth0 master br0
ip addr add 172.16.1.4/24 dev br0




#!/bin/sh

# Créer l'interface VXLAN avec VNI 10
ip link add vxlan10 type vxlan id 10 local 1.1.1.3 dstport 4789 nolearning

# Activer l'interface VXLAN
ip link set dev vxlan10 up

# Créer le bridge 
ip link add br0 type bridge
ip link set br0 up

# Ajouter VXLAN au bridge
ip link set dev vxlan10 master br0

# Ajouter eth1 (interface vers le Host) au bridge
ip link set dev eth1 master br0
ip link set dev eth1 up