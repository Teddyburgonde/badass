FROM quay.io/frrouting/frr:master

COPY ./conf/daemons.conf /etc/frr/daemons

COPY conf/zebra.conf /etc/frr/
COPY conf/bgpd.conf /etc/frr/
COPY conf/ospfd.conf /etc/frr/
COPY conf/isisd.conf /etc/frr/