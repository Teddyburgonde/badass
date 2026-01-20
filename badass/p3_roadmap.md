On passe d'un VXLAN "manuel" a un VXLAN automatique piloté par BGP. 

Structure 

P3/                         ← dossier
│
├── P3.gns3project          ← fichier (projet GNS3 exporté)
│
├── _rr/                    ← dossier (Route Reflector)
│   └── rr.conf             ← fichier de configuration du RR
│
├── _vtep1/                 ← dossier (routeur VTEP 1)
│   └── vtep1.conf          ← fichier de configuration du VTEP 1
│
├── _vtep2/                 ← dossier (routeur VTEP 2)
│   └── vtep2.conf          ← fichier de configuration du VTEP 2
│
├── _vtep3/                 ← dossier (routeur VTEP 3)
│   └── vtep3.conf          ← fichier de configuration du VTEP 3
│
├── _vtep1_host/            ← dossier (host connecté au VTEP 1)
│   └── host.conf           ← fichier (optionnel, IP / notes)
│
├── _vtep2_host/            ← dossier (host connecté au VTEP 2)
│   └── host.conf           ← fichier (optionnel)
│
└── _vtep3_host/            ← dossier (host connecté au VTEP 3)
    └── host.conf           ← fichier (optionnel)



# Roadmap P3 — BGP EVPN (version simple)

## Objectif général
Mettre en place un réseau où les routeurs échangent automatiquement les informations
sur les machines connectées, grâce à **OSPF** et **BGP EVPN**.

---

## Étape 1 — Fichier `rr.conf` (Route Reflector) |✅|
But : configurer le routeur central qui relaie les informations.

- Donner un **nom** au routeur RR |✅|
- Définir un **numéro** (ASN) |✅|
- Activer **OSPF** pour que le RR puisse parler aux autres routeurs |✅|
- Activer **BGP EVPN** |✅|
- Configurer le RR pour : |✅|
  - recevoir les informations des VTEP |✅|
  - les redistribuer aux autres VTEP |✅|

---

## Étape 2 — Fichier `vtep1.conf` |❌|
But : configurer un premier routeur VTEP.

- Donner un **nom** au routeur |✅|
- Définir un **numéro** (ASN) |✅|
- Activer **OSPF** |✅|
- Activer **BGP EVPN** |✅|
- Déclarer le **RR** comme point central |✅|
- Activer le **VXLAN** piloté par BGP |✅|

---


## Étape 3 — Fichier `vtep2.conf` |❌|
But : configurer un second routeur VTEP.

- Même structure que `vtep1.conf` 
- Changer : 
  - le **nom** |❌|
  - l’**adresse IP ** |❌|
  - les identifiants nécessaires |❌|

---

## Étape 4 — Fichier `vtep3.conf` |❌|
But : configurer un troisième routeur VTEP.

- Même structure que `vtep1.conf` |❌|
- Changer :
  - le **nom** |❌|
  - l’**adresse IP** |❌|
  - les identifiants nécessaires |❌|

---

## Étape 5 — Hosts |❌|
But : tester le réseau.

- Connecter un **host** à chaque VTEP |❌|
- Donner une **adresse IP** aux hosts |❌|
- Aucun protocole de routage sur les hosts |❌|

---

## Étape 6 — Tests |❌|
But : vérifier que tout fonctionne.

- Vérifier que les routeurs se voient (OSPF) |❌|
- Vérifier que les informations EVPN sont échangées |❌|
- Tester :
  - `ping` entre hosts |❌|
- Observer que :
  - les machines se découvrent automatiquement |❌|

---

## Résumé simple
- OSPF : les routeurs se trouvent
- BGP EVPN : les routeurs partagent les infos sur les machines
- RR : simplifie les échanges