
Reprenons mon image de l'immeuble (le Data Center) pour placer le **VNI** au bon endroit.

Imagine que le Data Center est un immense **hôtel** :

1. **Les VTEP (Routeurs) :** Ce sont les **réceptionnistes** à l'entrée.
    
2. **Le Tunnel VXLAN :** C'est l'**ascenseur**.
    
3. **Le VNI :** C'est la **clé de la chambre**.
    

### Le scénario :

Deux clients arrivent à l'hôtel : le **Client Banque** et le **Client Blog**.

- Le réceptionniste (VTEP) donne la **clé 100** (VNI 100) à la Banque.
    
- Il donne la **clé 200** (VNI 200) au Blog.
    

Quand un employé de la Banque veut monter voir son collègue, il prend l'ascenseur (le tunnel). Le réceptionniste vérifie sa clé : **"Ah, vous avez la clé 100, vous allez dans le réseau virtuel 100"**.

### À quoi sert le VNI concrètement ?

Sans le VNI, tout le monde serait mélangé dans l'ascenseur et pourrait entrer dans n'importe quelle chambre.

**Le VNI, c'est l'étiquette qui dit au routeur : "Ce paquet appartient à CE réseau virtuel précis et pas à un autre".**

### Pourquoi on ne peut pas utiliser juste l'adresse IP ?

Parce que la Banque et le Blog peuvent tous les deux décider d'appeler leur serveur `192.168.1.1`.

- Si le routeur voit arriver un paquet pour `192.168.1.1`, il est perdu.
    
- Mais s'il voit **VNI 100 + IP 192.168.1.1**, il sait que c'est pour la Banque.
    
- S'il voit **VNI 200 + IP 192.168.1.1**, il sait que c'est pour le Blog.
    

---

**En résumé :** Le **VNI** est le numéro qui permet au routeur de séparer les différents réseaux virtuels qui voyagent dans le même tunnel. C'est l'identifiant de la "bulle" dont on parlait tout à l'heure.