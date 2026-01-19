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

