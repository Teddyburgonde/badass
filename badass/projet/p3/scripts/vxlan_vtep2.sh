#!/bin/sh

ip link add vxlan0 type vxlan id 42 local 1.1.1.3
ip link set dev vxlan0 up
ip link add br0 type bridge
ip link set br0 up
ip link set dev vxlan0 master br0
ip link set dev eth0 master br0
ip addr add 172.16.1.3/24 dev br0
