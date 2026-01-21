Lancer le Dockerfile du host:  
- docker build -t gns3-host .
- docker run -it gns3-host

Lancer le Dockerfile du routeur:
- Builder l’image Docker
- docker build -t gns3-router .

Supprimer tous les conteneurs gns3: 

docker ps -a | grep GNS3 | awk '{print $1}' | xargs -r docker rm -f

docker rmi -f $(docker images -q)

#### Tester la p1
```
- Ouvrir gns3
- Ouvrir la p1
- Ajouter, link les 2 machines et les demarer.  
- Ouvrir les 2 consoles
- Taper ip link dans chacune d'elle.

```

#### Tester la p2

1. Ouvrir la console du **host**
2. Ouvrir la console du **router**

Pour le host dans gns3:

```
cat > /root/vxlan_static_host.sh
(coller le script host, puis Ctrl+D)

puis 
chmod +x /root/vxlan_static_host.sh
/root/vxlan_static_host.sh
```

Pour le router dans gns3:

```
cat > /root/vxlan_static_router.sh
(coller le script router, puis Ctrl+D)

puis 
chmod +x /root/vxlan_static_router.sh
/root/vxlan_static_router.sh
```

3. Vérifications

```
Pour le host

ip addr show br0
ping 10.0.0.2
```

```
Pour le routeur
ip addr show br0
ping 10.0.0.1
```
Test p2 multicast

Host:
```
chmod +x /root/vxlan_multicast_host.sh
/root/vxlan_multicast_host.sh
ip link
```


Router:
```
chmod +x /root/vxlan_multicast_router.sh 
/root/vxlan_multicast_router.sh 
ip link


```

Commande pour lancer le script 

```
chmod +x vxlan_vtep1.sh
./vxlan_vtep1.sh
```