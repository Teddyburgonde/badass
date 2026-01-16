### Structure

P2/
├── P2.gns3project   (ou le ZIP exporté)
├── vxlan_static.sh
└── vxlan_multicast.sh


## **Étape 1 — Créer le projet GNS3 P2 ** |❌| 

- Créer un nouveau projet **P2** dans GNS3  |❌| 
- Réutiliser les images Docker de la P1 :  |❌| 
    - `gns3-host`
    - `gns3-router`

## **Étape 2 — Construire la topologie** |❌|

- Placer **2 routeurs** (ou 2 machines selon le schéma du sujet)  |❌| 
- Relier les machines avec des liens GNS3  |❌| 
- Démarrer les machines  |❌| 

## **Étape 3 — VXLAN en mode statique** |❌|
 
- Créer un **bridge `br0`**  |❌| 
- Créer une interface **VXLAN (VNI = 10)**  |❌| 
- Configurer les **remote IPs manuellement**  |❌| 
- Attacher VXLAN et interface physique au bridge  |❌| 
- Tester :  |❌| 
    - ping
    - capture réseau
    
## **Étape 4 — VXLAN en mode multicast** |❌|

- Supprimer la configuration VXLAN statique  |❌| 
- Recréer VXLAN avec :  |❌| 
    - groupe multicast (ex: `239.1.1.1`)
- Refaire le bridge  |❌| 
- Tester :  |❌| 
    - ping
    - capture réseau

## **Étape 5 — Sauvegarde et rendu** |❌|

- Sauvegarder le projet GNS3  |❌| 
- Exporter le projet P2 (ZIP ou `.gns3project`)  |❌| 
- Mettre les scripts :  |❌| 
    - `vxlan_static.sh`
    - `vxlan_multicast.sh`  
        dans le dossier `P2/`