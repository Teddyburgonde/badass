
FROM debian:stable-slim
RUN apt update && apt install -y \
	frr \
	iproute2 \
	iputils-ping

CMD ["/bin/bash"]

### 2. Créer un Dockerfile |❌|
Dans ce Dockerfile, tu dois :
- Partir d’une image Linux (**Alpine** ou **Debian**)
- Installer **FRRouting**

---

### 3. Activer les services |❌|
Les services suivants doivent pouvoir démarrer :
- **BGPD**
- **OSPFD**
- **IS-ISD**