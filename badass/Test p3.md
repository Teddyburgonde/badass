# Tests finaux – P3 VXLAN EVPN

Ce fichier décrit **exactement** quoi faire pour valider la P3.

---
/usr/lib/frr/frrinit.sh start
vtysh
configure terminal
source rr.conf
end
write



## 1️⃣ Préparation dans GNS3

- Ouvrir le projet **P3**
- Vérifier que les nœuds suivants sont présents :
  - `RR`
  - `VTEP1`
  - `VTEP2`
  - `VTEP3`
- Relier les VTEP au RR selon la topologie
- Cliquer sur **Play** (▶️) pour démarrer tous les nœuds
- Ouvrir **une console par nœud**

---

## 2️⃣ Charger les configurations FRR

Sur chaque nœud, lancer FRR et charger le bon fichier.

### RR
```sh
vtysh
configure terminal
source rr.conf
end
write
```

### VTEP1
```sh
vtysh
configure terminal
source vtep1.conf
end
write
```

### VTEP2
```sh
vtysh
configure terminal
source vtep2.conf
end
write
```

### VTEP3
```sh
vtysh
configure terminal
source vtep3.conf
end
write
```

---

## 3️⃣ Lancer les scripts VXLAN (plan de données)

Sur **chaque VTEP**, exécuter son script VXLAN.

### VTEP1
```sh
./vxlan_vtep1.sh
```

### VTEP2
```sh
./vxlan_vtep2.sh
```

### VTEP3
```sh
./vxlan_vtep3.sh
```

---

## 4️⃣ Vérifications locales

Sur chaque VTEP :

### Vérifier les interfaces
```sh
ip link
```
Résultat attendu :
- `vxlan0` UP
- `br0` UP
- `eth0` MASTER br0
- `vxlan0` MASTER br0

### Vérifier l’IP du bridge
```sh
ip addr show br0
```
Résultat attendu :
- VTEP1 → `172.16.1.2/24`
- VTEP2 → `172.16.1.3/24`
- VTEP3 → `172.16.1.4/24`

---

## 5️⃣ Tests de connectivité (OBLIGATOIRE)

### Depuis VTEP1
```sh
ping 172.16.1.3
ping 172.16.1.4
```

### Depuis VTEP2
```sh
ping 172.16.1.2
ping 172.16.1.4
```

### Depuis VTEP3
```sh
ping 172.16.1.2
ping 172.16.1.3
```

✅ Tous les pings doivent répondre.

---

## 6️⃣ Vérification BGP EVPN (optionnel mais recommandé)

Sur le RR :
```sh
vtysh
show bgp l2vpn evpn summary
```
Résultat attendu :
- Tous les VTEP en **Established**

---

## 7️⃣ Capture réseau GNS3 (optionnel)

- Clic droit sur un lien entre deux nœuds
- **Start capture**
- Vérifier la présence de trafic VXLAN (UDP 4789)

---

## ✅ Validation finale

Si :
- BGP EVPN est établi
- VXLAN fonctionne
- Tous les pings passent

👉 **La P3 est VALIDÉE à 100 %.**
