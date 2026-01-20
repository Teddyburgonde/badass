

- Le VTEP-1 voit un Docker.
    
- Le VTEP-1 dit à son processus BGP : "Crée une ligne au format EVPN pour ce Docker".
    
- BGP envoie cette ligne au VTEP-2.
    
- Le VTEP-2 reçoit le message BGP, lit les infos EVPN, et **construit sa carte locale**.
### Le scénario final (Le "Déclic")

Imagine que le **VTEP-2** reçoit un message BGP disant : _"Le Docker A est chez le VTEP-1"_.

1. Le VTEP-2 note ça dans sa **carte EVPN**.
    
2. Une seconde plus tard, le Docker local veut envoyer un message au Docker A.
    
3. Le VTEP-2 regarde sa **carte EVPN** : _"Ah ! Il est chez le VTEP-1 (`1.1.1.1`)"_.
    
4. Le VTEP-2 regarde alors sa **carte OSPF** : _"Ok, et comment je vais physiquement chez `1.1.1.1` ? Ah, par le câble n°2 !"_.
    
5. **BOUM :** Il emballe le paquet et l'envoie.




Pour que ce soit limpide, on va reprendre ton scénario étape par étape :

### 1. Le Docker envoie son message

Le Docker A veut parler au Docker B. Il ne connaît pas les VTEP, il connaît juste l'adresse IP (ou MAC) de son pote. Il envoie sa trame normalement.

### 2. Le VTEP 1 consulte l'annuaire (BGP EVPN)

Le VTEP 1 intercepte le message. Il regarde dans sa table **EVPN** (l'annuaire que **BGP** a rempli avant).

- **L'annuaire lui dit :** "Le Docker B se trouve derrière le **VTEP 2** (qui a l'IP Loopback `2.2.2.2`)".
    
- _Ici, BGP EVPN a fait son job : il a donné la destination finale._
    

### 3. Le VTEP 1 consulte son GPS (OSPF)

Maintenant, le VTEP 1 sait qu'il doit envoyer le paquet à l'adresse `2.2.2.2`. Mais il ne sait pas quel chemin physique prendre dans le labyrinthe des câbles.

- Il regarde sa table **OSPF**.
    
- **Le GPS lui dit :** "Pour aller à `2.2.2.2`, sors par l'interface `eth1` et passe par le routeur du milieu".
    
- _Ici, OSPF a fait son job : il a trouvé la route physique._
    

---

### Résumé pour être sûr que tu as bien les deux rôles :

- **BGP avec EVPN :** C'est le **Cerveau**. Il sait **QUI** est **OÙ** (L'association Docker <-> VTEP).
    
- **OSPF (ou IS-IS) :** C'est les **Jambes**. Il sait **COMMENT** aller d'un VTEP à un autre (Le chemin entre les routeurs).