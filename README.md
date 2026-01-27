# BADASS - BGP At Doors of Autonomous Systems is Simple

**Projet d'administration réseau avec GNS3, Docker et FRRouting**

---

## 📋 Table des matières

- [Vue d'ensemble](#vue-densemble)
- [Architecture P3](#architecture-p3)
- [Installation](#installation)
- [Structure du projet](#structure-du-projet)
- [Tests P1](#tests-p1---gns3--docker)
- [Tests P2](#tests-p2---vxlan)
- [Tests P3](#tests-p3---bgp-evpn)
- [Vérifications](#vérifications)
- [Troubleshooting](#troubleshooting)

---

## 🎯 Vue d'ensemble

Ce projet implémente une architecture réseau BGP EVPN avec VXLAN en utilisant :
- **GNS3** : Émulateur réseau
- **Docker** : Conteneurisation des routeurs et hosts
- **FRRouting (FRR)** : Suite de routage (OSPF, BGP, EVPN)
- **VXLAN** : Overlay réseau (VNI 10)

---

## 🏗️ Architecture P3

```
               rr-gmersch
            (ROUTE REFLECTOR)
             OSPF + BGP EVPN
                   🖥️
                 /  |  \
                /   |   \
               /    |    \
    vtep1-gmersch vtep2-gmersch vtep3-gmersch
      (VTEP1)        (VTEP2)        (VTEP3)
         🖥️             🖥️             🖥️
         |              |              |
         |              |              |
    host1-gmersch  host2-gmersch  host3-gmersch
       (HOST)          (HOST)         (HOST)
         💻              💻             💻
```

---

## 🚀 Installation

### Prérequis
```bash
# Installer GNS3
sudo apt update
sudo apt install gns3-gui gns3-server

# Installer Docker
sudo apt install docker.io
sudo usermod -aG docker $USER
```

### Build des images Docker
```bash
cd p3
make up
```

Vérifier les images :
```bash
docker images | grep gns3
```

Résultat attendu :
```
gns3-router    latest    ...
gns3-host      latest    ...
```

---

## 📂 Structure du projet

```
p3/
├── Makefile                          # Build des images Docker
├── p3.gns3project                    # Export GNS3 (ZIP)
├── host/
│   └── Dockerfile                    # Image Alpine pour hosts
└── router/
    ├── Dockerfile                    # Image FRR pour routeurs
    ├── conf/
    │   ├── daemons                   # Services FRR activés
    │   ├── frr.conf                  # Config par défaut (vide)
    │   ├── rr.conf                   # Config du Route Reflector
    │   ├── vtep1.conf                # Config VTEP1
    │   ├── vtep2.conf                # Config VTEP2
    │   └── vtep3.conf                # Config VTEP3
    └── scripts/
        ├── vxlan_vtep1.sh            # Script VXLAN pour VTEP1
        ├── vxlan_vtep2.sh            # Script VXLAN pour VTEP2
        └── vxlan_vtep3.sh            # Script VXLAN pour VTEP3
```

---

## 🧪 Tests P1 - GNS3 + Docker

### Objectif
Tester la connectivité de base entre un host et un routeur.

### Topologie
```
host-gmersch ←→ routeur-gmersch
```

### Étapes

#### 1. Créer la topologie dans GNS3
- 1 host
- 1 routeur
- Les câbler (host eth0 ↔ routeur eth0)

#### 2. Configurer le routeur
Configurer une IP sur le routeur (via FRR ou directement) :
```bash
# IP du routeur : 10.1.1.1/24
```

#### 3. Configurer le host
```bash
# Accéder au shell du host
docker exec -it <container_id_host> sh

# Configurer l'interface eth0
ip addr add 10.1.1.2/24 dev eth0
ip link set eth0 up

# Ajouter la route par défaut
ip route add default via 10.1.1.1
```

#### 4. Tester
```bash
# Depuis le host
ping 10.1.1.1
```

**✅ Résultat attendu** : Le ping doit fonctionner.

---

## 🧪 Tests P2 - VXLAN

### Objectif
Tester un tunnel VXLAN entre 2 routeurs.

### Topologie
```
host1 ←→ routeur1 ←→ routeur2 ←→ host2
```

### Câblage
```
Router 1 (eth0) ←→ Router 2 (eth0)    [Tunnel VXLAN]
Router 1 (eth1) ←→ Host 1 (eth0)
Router 2 (eth1) ←→ Host 2 (eth0)
```

### Étapes

#### 1. Configurer VXLAN sur routeur-1
```bash
# Accéder au routeur-1
docker exec -it <container_id_routeur1> bash

# Exécuter le script VXLAN (STATIC ou MULTICAST)
sh /scripts/vxlan_static_router.sh
```

#### 2. Configurer VXLAN sur routeur-2
```bash
# Accéder au routeur-2
docker exec -it <container_id_routeur2> bash

# Exécuter le script VXLAN
sh /scripts/vxlan_static_router.sh
```

#### 3. Configurer host1
```bash
# Accéder au host1
docker exec -it <container_id_host1> sh

# Configurer l'IP
ip addr add 1.1.1.1/24 dev eth0
ip link set eth0 up
```

#### 4. Configurer host2
```bash
# Accéder au host2
docker exec -it <container_id_host2> sh

# Configurer l'IP
ip addr add 1.1.1.2/24 dev eth0
ip link set eth0 up
```

#### 5. Tester
```bash
# Depuis host1
ping 1.1.1.2
```

**✅ Résultat attendu** : Le ping doit fonctionner via le tunnel VXLAN.

---

## 🧪 Tests P3 - BGP EVPN

### Objectif
Tester l'architecture complète BGP EVPN avec Route Reflector et 3 VTEPs.

### Topologie
```
               rr-gmersch (RR)
                /    |    \
               /     |     \
        vtep1  vtep2  vtep3
          |      |      |
       host1  host2  host3
```

### Étapes

#### 1. Configurer le Route Reflector (RR)

```bash
# Accéder au RR
docker exec -it <container_id_rr> bash

# Ouvrir vtysh
vtysh

# Entrer en mode configuration
configure terminal

# Copier-coller TOUT le contenu de rr.conf ici
# [Contenu de router/conf/rr.conf]

# Quitter
end
exit
exit
```

#### 2. Configurer VTEP1

```bash
# Accéder au VTEP1
docker exec -it <container_id_vtep1> bash

# Ouvrir vtysh
vtysh

# Entrer en mode configuration
configure terminal

# Copier-coller le contenu de vtep1.conf
# [Contenu de router/conf/vtep1.conf]

# Quitter
end
exit

# Exécuter le script VXLAN
sh /scripts/vxlan_vtep1.sh

# Quitter
exit
```

#### 3. Configurer VTEP2

```bash
# Accéder au VTEP2
docker exec -it <container_id_vtep2> bash

# Ouvrir vtysh
vtysh
configure terminal

# Copier-coller le contenu de vtep2.conf
# [Contenu de router/conf/vtep2.conf]

# Quitter
end
exit

# Exécuter le script VXLAN
sh /scripts/vxlan_vtep2.sh
exit
```

#### 4. Configurer VTEP3

```bash
# Accéder au VTEP3
docker exec -it <container_id_vtep3> bash

# Ouvrir vtysh
vtysh
configure terminal

# Copier-coller le contenu de vtep3.conf
# [Contenu de router/conf/vtep3.conf]

# Quitter
end
exit

# Exécuter le script VXLAN
sh /scripts/vxlan_vtep3.sh
exit
```

#### 5. Configurer les hosts

**Host1 :**
```bash
docker exec -it <container_id_host1> sh
ip addr add 192.168.1.1/24 dev eth0
ip link set eth0 up
```

**Host2 :**
```bash
docker exec -it <container_id_host2> sh
ip addr add 192.168.1.2/24 dev eth0
ip link set eth0 up
```

**Host3 :**
```bash
docker exec -it <container_id_host3> sh
ip addr add 192.168.1.3/24 dev eth0
ip link set eth0 up
```

#### 6. Tester la connectivité

**Depuis host1 :**
```bash
# Ping vers host2
ping 192.168.1.2

# Ping vers host3
ping 192.168.1.3
```

**✅ Résultat attendu** : Les pings doivent fonctionner via VXLAN + BGP EVPN.

---

## ✅ Vérifications

### Sur le RR

#### Vérifier OSPF
```bash
vtysh
show ip ospf neighbor
```

**Attendu** : Les 3 VTEPs doivent apparaître comme neighbors.

#### Vérifier BGP
```bash
show bgp summary
show bgp l2vpn evpn summary
```

**Attendu** : Les 3 VTEPs doivent être connectés (State: Established).

#### Vérifier les routes EVPN
```bash
show bgp l2vpn evpn route
```

**Attendu** : Routes type 3 (VTEP discovery) et type 2 (MAC/IP).

---

### Sur les VTEPs

#### Vérifier OSPF
```bash
vtysh
show ip ospf neighbor
```

**Attendu** : Le RR doit apparaître comme neighbor.

#### Vérifier le VNI
```bash
show evpn vni
```

**Attendu** : VNI 10 doit être présent.

#### Vérifier les MACs apprises
```bash
show evpn mac vni 10
```

**Attendu** : Les MACs des autres hosts doivent apparaître avec leur VTEP source.

**Exemple depuis VTEP1 :**
```
MAC               Type   Flags Intf/Remote ES/VTEP            VLAN  Seq #'s
aa:bb:cc:dd:ee:ff remote       1.1.1.3                              0/0
```

- MAC de host2 (connecté à VTEP2)
- Next Hop : 1.1.1.3 (loopback de VTEP2)

#### Vérifier BGP EVPN
```bash
show bgp l2vpn evpn route type 2
show bgp l2vpn evpn route type 3
```

---

### Sur les Hosts

#### Vérifier la connectivité
```bash
# Depuis host1
ping 192.168.1.2
ping 192.168.1.3

# Vérifier la table ARP
ip neigh show
```

---

### Supprimer les images
```bash
docker rmi -f $(docker images -aq)
```



## 📚 Ressources

- [FRRouting Documentation](https://docs.frrouting.org/)
- [FRR EVPN Guide](https://docs.frrouting.org/en/latest/evpn.html)
- [RFC 7348 - VXLAN](https://tools.ietf.org/html/rfc7348)
- [RFC 7432 - BGP MPLS-Based EVPN](https://tools.ietf.org/html/rfc7432)

---

## 📝 Auteur

**Projet réalisé par :** gmersch & tebandam  
**École :** 42  
**Projet :** BADASS (BGP At Doors of Autonomous Systems is Simple)
