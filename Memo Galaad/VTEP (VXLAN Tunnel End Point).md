Le **VTEP**, c'est ton **routeur "boosté"** qui a deux fonctions clés :

1. **L'envoi :** Il reçoit une "lettre" normale (Trame Ethernet/MAC) d'un ordinateur. Il voit qu'elle doit aller loin, alors il la glisse dans une enveloppe **VXLAN** (il l'encapsule) pour qu'elle puisse voyager sur l'autoroute des adresses IP.
    
2. **La réception :** Il reçoit une enveloppe VXLAN qui vient d'un autre routeur. Il l'ouvre, récupère la "lettre" originale à l'intérieur, et la donne à l'ordinateur destinataire comme si de rien n'était.
    

### Pourquoi c'est un "routeur boosté" ?

Parce qu'un routeur classique, s'il reçoit une "lettre" (trame) destinée à une adresse MAC qu'il ne connaît pas localement, il ne sait pas quoi en faire.

Le **VTEP**, lui, sait "tricher" : il ne jette pas la lettre, il l'emballe dans un paquet IP pour la faire sortir de son réseau local et l'envoyer à un autre VTEP.