FROM debian:stable-slim

RUN apt update && apt install -y \
    frr \
    iproute2 \
    iputils-ping \
    procps \
 && sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons \
 && echo "/usr/lib/frr/watchfrr -d" >> /root/.bashrc

CMD ["/bin/bash"]
