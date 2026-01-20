


En BGP, il y a une règle stricte : un routeur ne répète pas à ses voisins ce qu'il a appris d'un autre voisin.

- Résultat : Si tu as 10 VTEP, chaque VTEP doit être connecté individuellement à **tous** les autres pour que tout le monde ait la même "carte EVPN".
    
- Avec 10 routeurs, ça fait 45 connexions à configurer. C'est l'enfer.


- **Le rôle :** Tous les VTEP se connectent **uniquement** au RR.
    
- **L'action :** Quand le VTEP-1 envoie une info au RR, le RR "réfléchit" (renvoie) cette info à tous les autres VTEP connectés à lui.