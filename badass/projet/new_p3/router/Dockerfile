# Image officielle de FRRouting
FROM quay.io/frrouting/frr:master

COPY ./conf/daemons /etc/frr/daemons
COPY ./conf/frr.conf /etc/frr/frr.conf

COPY ./scripts/ /scripts/

RUN chmod +x /scripts/*.sh

# Change le propriétaire des fichiers pour l'utilisateur frr
# (nécessaire car FRR s'exécute en
# tant qu'utilisateur 'frr', pas 'root')
RUN chown -R frr:frr /etc/frr/
