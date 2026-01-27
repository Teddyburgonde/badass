#!/bin/sh

# Créer l'interface VXLAN avec VNI 10
ip link add vxlan10 type vxlan id 10 local 1.1.1.2 dstport 4789 nolearning 

#Activer l'interface VXLAN
ip link set dev vxlan10 up

# Crée le bridge
ip link add br0 type bridge
ip link set br0 up

# Ajouter VXLAN au bridge
ip link set dev vxlan10 master br0

# Ajouter eth1 (interface vers le Host) au bridge
ip link set dev eth1 master br0
ip link set dev eth1 up

