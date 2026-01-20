Dans le cas ou l'ordinateur comprend qu'on veut parler à un appareil du même réseaux (par exemple deux frère sur la même wifi):
L'ordi utilise le **Layer 2:**
	Un **switch** est un équipement de couche 2 qui relie plusieurs appareils dans un même réseau local (LAN). Il utilise les **adresses MAC** pour envoyer les données uniquement au bon destinataire, contrairement au routeur qui s'occupe de l'interconnexion entre différents réseaux via l'IP.
	L'ordinateur du frère 1 se dit: c'est la même IP réseaux que moi ! Je vais envoyer une **trame** (c'est le nom du colis) (sur le colis, il est marqué l'adresse MAC et plus l'adresse IP)
	Comment l'ordi sait a quel adresse IP il doit envoyé le message ? Il utilise sa table [[Table ARP]] .

Dans le cas ou l'un des frère est sur Paris et l'autre sur Angoulême (pas la même box)
**Layer 3:**
	Couche 3 (Réseau) (Layer 3) : On parle de **Paquet (Packet)**. C'est l'enveloppe avec les adresses IP.
	Si la trame (MAC) est le facteur qui livre dans ton immeuble, le paquet (IP) est le service postal qui trie les lettres par ville et par rue.
	


Cas A : L'IP est dans le même réseau (ex: ton IP est 192.168.1.10/24 et tu parles à 192.168.1.50).

    Le PC se dit : "C'est dans mon salon (mon LAN)".

    Action : Il va chercher dans sa table ARP l'adresse MAC de 192.168.1.50. S'il ne l'a pas, il crie sur le réseau (ARP Request) pour l'obtenir.

    Il crée une trame (Couche 2) avec la MAC du voisin en destination.
   
Cas B : L'IP est hors du réseau (ex: tu parles à 8.8.8.8).

    Le PC se dit : "Ce n'est pas chez moi, je ne peux pas l'atteindre directement".

    Action : Il ne cherche pas l'adresse MAC de 8.8.8.8 (ça ne servirait à rien, elle est à l'autre bout du monde).

    À la place, il va chercher l'adresse MAC de sa Passerelle par défaut (ton Routeur).

    Il crée une trame (Couche 2) avec la MAC du routeur, mais garde l'IP 8.8.8.8 (Couche 3) à l'intérieur.
