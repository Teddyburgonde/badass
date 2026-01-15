Je dois simuler un reseau et le configurer en utilisant GNS3 avec les images Docker. 
BGP est le protocole de routage qui fait fonctionner Internet


- Installer une vm
Vm + Docker ?

Documentation de Sacha ?

- 3 dossiers p1, p2, p3

Je dois me documenter sur le fonctionnement de BGP et des VXLAN. 
A quel point je dois me documenter dessus ? 
Serie de questions avec chatgpt ? videos dessus ? 

• **Partie 1 : Configuration de GNS3 avec Docker.**  
• **Partie 2 : Découverte d’un VXLAN.**  
• **Partie 3 : Découverte de BGP avec EVPN.**



Partie 1: 
**’installer et de configurer GNS3 ainsi que Docker dans votre machine virtuelle.**

**Une fois que tout fonctionne, vous devez utiliser deux images Docker que vous devrez créer.**

- **La première image doit être basée sur un système de votre choix et doit contenir au minimum busybox ou une solution équivalente.**  
**Alpine semble être une bonne solution.**

- **La seconde image doit utiliser un système de votre choix et respecter les contraintes suivantes :**  
• **Un logiciel de gestion du routage des paquets (zebra ou quagga).**  
• **Le service BGPD actif et configuré.**  
• **Le service OSPFD actif et configuré.**  
• **Un service de moteur de routage IS-IS.**  
• **busybox ou une solution équivalente.**


**Vous devez utiliser ces deux images Docker dans GNS3 et réaliser ce petit schéma.**  
**Vous devez avoir les deux machines fonctionnelles.**  
**Nous devons pouvoir nous connecter à celles-ci via GNS3.**


**Vous devez rendre ce projet dans un dossier P1 à la racine de votre dépôt Git.**  
**Vous devez également ajouter les fichiers de configuration avec des commentaires expliquant la mise en place de chaque équipement.**

**Vous devez exporter ce projet sous forme d’une archive ZIP incluant les images de base.**  
**Ce fichier doit être visible dans votre dépôt Git.**