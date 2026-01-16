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

# Étape 2 – Créer l’image Docker n°1 : Host |✅|

## Objectif
Créer une machine Docker minimale qui servira de host de test dans GNS3.

## 1. Créer un Dockerfile |✅|
- Crée un fichier nommé `Dockerfile`
- Mets dedans :
	- une image de base **Alpine**
	- un shell `/bin/sh`

## 2. Builder l'image  |✅|
- Build l’image Docker 
- Nom de l'image gns3-host
- ->docker build -t gns3-host . -> docker run -it gns3-host

---

# Étape 3 – Image Docker n°2 (Routeur) |❌|

## 🎯 Objectif
Créer une image Docker **routeur** utilisable dans GNS3.

---

### 1. Choisir le logiciel de routage |✅|
- Utiliser **FRRouting (FRR)**
- C’est le plus simple et le plus moderne

---

### 2. Créer un Dockerfile |✅|
Dans ce Dockerfile, tu dois :
- Partir d’une image Linux (**Alpine** ou **Debian**)
- Installer **FRRouting**

---

### 3. Activer les services |✅|
Les services suivants doivent pouvoir démarrer :
- **BGP**
- **OSPF**
- **IS-IS**

👉 Ils doivent être **présents et lançables**, rien de plus.

---

### 4. Avoir un shell |✅|
- Le conteneur doit démarrer sur un **shell**
- Tu dois pouvoir entrer dedans avec :
```bash
docker build -t gns3-router .
docker run -it gns3-router 
```

---

### 5. Builder l’image |✅|
- Builder l’image Docker -> docker build -t gns3-router .

---

# Étape 4 – Intégration des images Docker dans GNS3

## 🎯 Objectif
Utiliser les images **gns3-host** et **gns3-router** dans GNS3 et vérifier qu’elles fonctionnent correctement.

---

### 1. Ouvrir GNS3 |✅|
- Lancer GNS3|✅|
- Créer un nouveau projet **P1** |✅|

---

### 2. Ajouter les images Docker |✅|
- Aller dans `Edit` → `Preferences`
- Aller dans `Docker` → `Docker containers`
- Cliquer sur **New**
- Ajouter l’image **gns3-host**
- Ajouter l’image **gns3-router**
- Ne rien modifier dans les options avancées

---

### 3. Ajouter les machines au projet |✅|
- Glisser **gns3-host** sur la zone de travail |✅|
- Glisser **gns3-router** sur la zone de travail |✅|

---

### 4. Relier les machines  |✅|
- Utiliser l’outil câble
- Relier **gns3-host** à **gns3-router**  |✅|

---

### 5. Démarrer les machines  |✅|
- Démarrer les deux machines  |✅|
- Attendre qu’elles soient vertes  |✅|

---

### 6. Ouvrir les terminaux |✅|
- Clic droit sur **gns3-host** → `Console`
- Clic droit sur **gns3-router** → `Console`

---

## ✅ Résultat attendu
- Les deux machines démarrent
- Les deux terminaux sont accessibles
- Un shell est disponible sur chaque machine


---

### Étape 5 – Rendu final |✅|
**Objectif :** Avoir un rendu propre et conforme au sujet.

- Créer un dossier `P1/` à la racine du dépôt
- Ajouter :
  - Le fichier `.gns3project`
  - Les fichiers de configuration
- Commenter les fichiers de configuration
- Vérifier que les noms des machines contiennent ton login
- Exporter le projet GNS3 en **ZIP (portable project)**

---