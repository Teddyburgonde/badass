
[[BusyBox]] = Le logiciel qui permet à tes petits Dockers d'avoir des commandes Linux sans prendre de place.

**Rappel Notion adresse ip de base :**
[[Notation CIDR]] ( le /24  après l'adresse IP)

Une box Wifi contient 3 choses Importante :
-Un routeur,
-Un Modem,
-Un Switch.

**Adresse MAC ou Adresse IP ?**
[[Layer 2 (Trame, MAC) ou Layer 3 (Paquet, IP)]]


**Réseaux LAN** = (Local Area Network). Terme pour définir la bulle d'action d'un réseaux.

De base, les machine d'un data center communique entre elle via le réseau LAN.
Donc, si une machine doit entrer en maintenance, elle fait une migration a chaud (c'est a dire elle copie son contenu vers une autre machine sans coupé le process)
Les utilisateurs du site hébergé par la machine ne se rendent pas compte du changement.
[[Data Center Fonctionnement La migration à chaud]]


Mais comment elle fait si les deux machine sont à l'autre bout de la planète, ou que le data center est très très grand et que les deux machine sont loin ? On ne va pas mettre un câble qui parcours tout le chemin ! C'est la qu'intervient le VXLAN:
[[VXLAN]]
Le VXLAN permet de faire un périmètre LAN plus modulable !

[[VLAN]] (et pourquoi VXLAN est mieux)

[[VTEP (VXLAN Tunnel End Point)]] = C'est le nom du "postier" (ton routeur ou switch) qui emballe et déballe les trames en format VXLAN.

[[EVPN]] = (_Ethernet Virtual Private Network_)

[[BGP]] (utilise EVPN pour la VXLAN) =  (_Border Gateway Protocol_)
C'est le messager entre les VTEP, genre c'est ce qui gere leurs communication entre eux. Et l'EVPN est une carte utilisé par BGP pour savoir a qui envoyer. Et BGP va utiliser les chemain cree par OSPF entre les VTEP.
Et donc BGP utilise EVPN pour savoir ou envoyer les infos, et utilise les route que lui donne OSPF ?

[[Le RR (Route Reflector)]] = un routeur central ou tout le monde se connecte. Évite de devoir connecter tout les VTEP entre eux.

[[Exemple VNI, VTEP, VXLAN]]
**En résumé :** Le **VNI** est le numéro qui permet au routeur de séparer les différents réseaux virtuels qui voyagent dans le même tunnel. C'est l'identifiant de la "bulle" dont on parlait tout à l'heure.

**La Loopback** = **adresse IP virtuelle** qu'on donne au routeur (son nom reel)

[[OSPF et IS-IS]] = Ce sont des protocoles de routage dits **IGP** (Interior Gateway Protocol).
**Leur seul but :** Faire en sorte que chaque routeur connaisse la route pour atteindre les **adresses IP physiques** et les **Loopbacks** des autres routeurs


**Difference [[OSPF et IS-IS]] et [[BGP]] avec [[EVPN]]:** 
- **OSPF / IS-IS :** S'occupe de faire parler les **Routeurs** entre eux (IP à IP). C'est le réseau de transport.
    
- **BGP / EVPN :** S'occupe de faire parler les **Dockers** entre eux (MAC à MAC). C'est le réseau de service.

Pourquoi a-t-on besoin des deux cartes ?
Imagine que tu veux envoyer un colis à un ami :

1. **L'annuaire (EVPN)** te dit : "Ton ami habite au 22 rue de la Paix à Lyon". (C'est la destination finale).
    
2. **Le GPS (OSPF)** te dit : "Pour aller à Lyon, prends l'autoroute A6". (C'est le chemin pour y aller).
    

**Si tu n'as que la carte EVPN :** Tu sais que ton ami est à Lyon, mais tu n'as pas de route pour sortir de chez toi. Tu es bloqué. **Si tu n'as que la carte OSPF :** Tu as de superbes autoroutes vides, mais tu ne sais pas où habitent tes amis. Tu ne peux rien envoyer.


- **L'Underlay (OSPF/IS-IS)** : C'est la base. Tu le configures pour que les routeurs puissent faire un `ping` entre eux. On appelle ça le **Transport**.
    
- **L'Overlay (BGP/EVPN/VXLAN)** : C'est ce qui tourne "au-dessus". Ça utilise le transport pour faire croire aux Dockers qu'ils sont sur le même réseau. On appelle ça le **Service**.


[[Fonctionnement Globale]]

### Résumé de la hiérarchie pour ton projet :

1. **OSPF (Underlay) :** Crée la route physique (le goudron) entre les Loopbacks.
    
2. **BGP (Protocole) :** Établit la connexion logique entre les VTEP.
    
3. **EVPN (Fonction) :** Circule dans BGP pour remplir les tables MAC/IP.
    
4. **VXLAN (Data Plane) :** Emballe les données réelles des Dockers et les envoie sur la route tracée par OSPF.


