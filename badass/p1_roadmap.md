# Roadmap – P1 : GNS3 configuration with Docker

## 🎯 Objectif de la P1
Mettre en place un environnement fonctionnel avec **GNS3** et **Docker**, créer **deux images Docker**, et les utiliser dans un projet GNS3 exportable.

---

## Livrables attendus
À la fin de la P1, tu dois avoir :

- Une VM fonctionnelle
- GNS3 installé et utilisable
- Docker installé
- Deux images Docker personnalisées
- Un projet GNS3 utilisant ces images
- Un dossier `P1/` à la racine du dépôt
- Un export ZIP du projet GNS3 (portable project)

---

## 🛣️ Roadmap détaillée

### Étape 1 – Préparer l’environnement
**Objectif :** Avoir une base stable pour tout le projet.

- Installer Docker dans la VM |✅|
- Installer GNS3 dans la VM ✅| 
- Vérifier que GNS3 démarre correctement |✅|
- Vérifier que GNS3 peut utiliser Docker |✅|

---

# Étape 2 – Créer l’image Docker n°1 : Host

## Objectif
Créer une machine Docker minimale qui servira de host de test dans GNS3.

## 1. Créer un Dockerfile
- Crée un fichier nommé `Dockerfile`
- Mets dedans :
	- une image de base **Alpine**
	- un shell `/bin/sh`

## 2. Builder l'image
- Build l’image Docker
- Nom de l'image gns3-host

## 3. Tester l'image
- Lance le conteneur
- Vérifie que tu arrives sur un shell (`/bin/sh`)

---

### Étape 3 – Créer l’image Docker n°2 (Routeur)
**Objectif :** Une machine réseau complète.

Contraintes :
- Un moteur de routage (Quagga ou FRRouting)
- Service **BGP** actif
- Service **OSPF** actif
- Service **IS-IS** actif
- BusyBox (ou équivalent)
- Aucune adresse IP configurée par défaut

⚠️ Les services doivent être présents et activables, pas forcément interconnectés.

---

### Étape 4 – Intégration dans GNS3
**Objectif :** Vérifier que les images fonctionnent dans GNS3.

- Importer les deux images Docker dans GNS3
- Créer un nouveau projet GNS3
- Ajouter les deux machines au projet
- Relier les machines
- Ouvrir un terminal sur chaque machine

Résultat attendu :
- Les machines démarrent
- Les terminaux sont accessibles

---

### Étape 5 – Rendu final
**Objectif :** Avoir un rendu propre et conforme au sujet.

- Créer un dossier `P1/` à la racine du dépôt
- Ajouter :
  - Le fichier `.gns3project`
  - Les fichiers de configuration
- Commenter les fichiers de configuration
- Vérifier que les noms des machines contiennent ton login
- Exporter le projet GNS3 en **ZIP (portable project)**

---

##  Fin de la P1
Si toutes les étapes ci-dessus sont validées, la **P1 est terminée** et prête pour l’évaluation.

👉 Tu peux alors passer sereinement à la P2.