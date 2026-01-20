


La migration à chaud

Attend genre une machine d'un data center peut donner ce qu'elle possède a une autre machine grace au LAN sans que ça coupe le truc en cours ?

C'est exactement ça, et c'est un des trucs les plus impressionnants en infrastructure réseau/serveur !

Imagine une machine virtuelle (VM) qui fait tourner un site web. Elle a besoin de sa mémoire vive (RAM) et de son processeur (CPU) pour fonctionner. Si le serveur physique qui l'héberge commence à fatiguer, on peut "pousser" cette VM vers un autre serveur physique.

### Comment ça marche grâce au LAN :

1. **La copie de la RAM :** Le premier serveur commence à envoyer tout le contenu de la mémoire vive de la VM au deuxième serveur via le réseau local.
    
2. **L'illusion du réseau :** C'est là que le **LAN** (et le VXLAN dans ton projet) est crucial. Pour que la coupure soit invisible, la machine **doit garder la même adresse IP et la même adresse MAC**.
    
3. **Le "Switch" final :** Quand presque toute la mémoire est copiée, le premier serveur fige la VM pendant quelques millisecondes, envoie les dernières données, et le deuxième serveur prend le relais.
    
4. **L'annonce gratuite :** Le nouveau serveur envoie un petit message sur le réseau (un "Gratuitous ARP") pour dire au switch : _"Hé ! L'adresse MAC de cette VM est maintenant sur ma prise à moi !"_.
    

**Résultat :** Les gens qui sont sur le site web ne remarquent rien. Pour eux, l'IP n'a pas bougé. Si tu avais changé de réseau (Layer 3), la connexion aurait été coupée car l'adresse IP aurait dû changer.