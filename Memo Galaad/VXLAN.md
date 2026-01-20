
Le VXLAN est un protocole qui permet de créer un **réseau "Overlay"** (superposé). Il permet de transporter du trafic de **Couche 2** (Ethernet) à l'intérieur de paquets de **Couche 3** (IP/UDP).

C'est ce qu'on appelle techniquement du **L2 over L3**.

VXLAN (Virtual Extensible LAN) : C'est une technologie qui permet d'étendre un réseau de Couche 2 (donc basé sur les adresses MAC) par-dessus un réseau de Couche 3 (IP). C'est comme si on créait un "tunnel" pour que des machines distantes croient qu'elles sont branchées sur le même Switch local.

Comme on ne peut pas tirer un câble physique de plusieurs kilomètres (ou à travers la planète), le **VXLAN** va créer un **"tunnel"** logique. Il prend la trame (Layer 2) et l'emballe dans un paquet IP (Layer 3). Ce paquet voyage sur Internet comme n'importe quelle donnée, et une fois arrivé, il est déballé pour retrouver la trame d'origine. C'est ainsi que deux machines éloignées se croient sur le même switch

- **L'encapsulation :** La technique de mettre une trame dans un paquet (la poupée russe).
    
- **Le tunnel :** Le lien virtuel créé entre deux [[VTEP (VXLAN Tunnel End Point)]].
    
- **La segmentation :** Il utilise un identifiant appelé **VNI** (VXLAN Network Identifier). C'est comme un tag VLAN, mais au lieu d'être limité à 4096 réseaux, le VXLAN permet d'en avoir **16 millions**.



### La solution : Le VXLAN (Le "Tunnel")

Le VXLAN permet de créer un **réseau local virtuel par-dessus un réseau IP**.

L'utilité principale est de **supprimer les distances physiques**. Avec le VXLAN, tu peux avoir :

- Le Serveur A à Paris (`192.168.1.10`)
    
- Le Serveur B à Tokyo (`192.168.1.11`)
    
- **Et ils croient qu'ils sont branchés sur le même switch !**
    

### 3. Comment ça marche concrètement ? (L'encapsulation)

Le VXLAN prend la trame Couche 2 (avec l'adresse MAC) que le serveur veut envoyer, et il l'emballe dans un paquet Couche 3 (IP) standard.

1. Le serveur A envoie une trame pour le serveur B.
    
2. Le switch (ou le routeur) VXLAN local dit : "Ah, c'est du VXLAN ! Je mets cette trame dans un colis IP adressé au routeur de Tokyo".
    
3. Le paquet traverse Internet comme n'importe quel autre paquet.
    
4. À Tokyo, le routeur ouvre le colis, sort la trame d'origine et la donne au serveur B.
    

### 4. Les 3 grands avantages du VXLAN :

1. **Mobilité des machines virtuelles (VM) :** Dans un Cloud, on peut déplacer une machine d'un serveur physique à un autre sans changer son adresse IP ou sa configuration, car son "réseau local virtuel" la suit partout.
    
2. **Plus de réseaux (VNI) :** Avec les anciens systèmes (VLAN), on était limité à 4096 réseaux différents. Avec le VXLAN, on peut en créer **16 millions**. C'est crucial pour des géants comme Amazon ou Google qui ont des millions de clients.
    
3. **Utilisation efficace des routes :** Au lieu d'avoir des switchs qui bloquent certains liens pour éviter les boucles (le protocole Spanning Tree), on utilise le routage IP (Couche 3) qui est beaucoup plus intelligent et rapide pour transporter les données VXLAN.