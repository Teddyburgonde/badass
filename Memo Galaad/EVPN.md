EVPN (Ethernet VPN) : C'est le "cerveau" qui va annoncer à tout le monde : "Hé, la machine avec telle adresse MAC se trouve derrière tel routeur !". Cela permet d'apprendre les adresses MAC automatiquement sans inonder le réseau de messages inutiles.

> **EVPN** = Une **base de données partagée** présente dans chaque VTEP, qui répertorie :
> 
> 1. Les **Adresses MAC** des machines.
>     
> 2. Leur **VNI** (leur réseau virtuel).
>     
> 3. L'**IP du VTEP** associé (où se trouve la machine physiquement).
>     

C'est cette base de données qui évite au réseau de "crier" (broadcast) tout le temps.


En gros des qu'un serveur se branche sur un VTEP, le VTEP envoie un message BGP (grace a l'EVPN) a tout les autres VTEP en leurs disant : eh, un serveur avec l'adresse MAC : AA:AA et le VIN 100 viens de se connecter a moi !


EVPN (_Ethernet Virtual Private Network_) n'est pas un protocole qui fonctionne tout seul. C'est une **famille d'adresses** (on appelle ça une _Address-Family_) que l'on rajoute à l'intérieur de [[BGP]].

- **Sans EVPN :** BGP transporte des messages du type : _"Pour aller au réseau 8.8.8.8, passe par moi"_.
    
- **Avec EVPN :** BGP transporte des messages beaucoup plus riches : _"Hé, j'ai un Docker avec la MAC `AA:BB` et l'IP `192.168.1.1` qui est branché sur mon VNI 100"_.