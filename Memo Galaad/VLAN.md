
### 1. Le VLAN (Le classique)

Le **VLAN** (Virtual LAN) permet de découper un switch physique en plusieurs réseaux logiques.

- **Le principe :** On ajoute un "Tag" (une étiquette) de 12 bits sur le paquet pour dire à quel groupe il appartient.
    
- **La limite :** Avec 12 bits, on ne peut créer que **4096 VLANs** maximum. Dans un immense Data Center (Cloud, Azure, AWS), c'est beaucoup trop peu.
    
- **Le problème :** Un VLAN ne peut pas "traverser" un routeur facilement sans perdre son étiquette. Il reste coincé dans un bâtiment ou un étage.
    

### 2. Pourquoi passer au VXLAN ?

Le **VXLAN** est l'évolution moderne pour briser les limites du VLAN.

| **Caractéristique** | **VLAN**                    | **VXLAN**                                   |
| ------------------- | --------------------------- | ------------------------------------------- |
| **Identifiant**     | 12 bits (**4 096** réseaux) | 24 bits (**16 millions** de réseaux)        |
| **Transport**       | Niveau 2 (Ethernet)         | Niveau 3 (**UDP / IP**)                     |
| **Flexibilité**     | Bloqué par les routeurs     | Traverse tout l'Internet ou le réseau local |

---

### 3. Les 3 raisons majeures du VXLAN :

1. **L'Échelle :** On passe de 4 000 à 16 millions de réseaux virtuels (indispensable pour les milliers de clients d'un Cloud).
    
2. **L'Encapsulation (Le Tunnel) :** VXLAN cache le paquet du Docker à l'intérieur d'un paquet IP standard. Pour les routeurs au milieu, c'est juste du trafic classique. Ils ne savent même pas qu'il y a un Docker à l'intérieur.
    
3. **La Mobilité :** Un Docker peut "déménager" d'un serveur à un autre (même très loin) sans changer d'adresse IP, car le tunnel VXLAN le suit partout.
    

---