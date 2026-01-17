Lancer le Dockerfile du host:  
- docker build -t gns3-host .
- docker run -it gns3-host

Lancer le Dockerfile du routeur:
- Builder l’image Docker
- docker build -t gns3-router .

Supprimer tous les conteneurs gns3 

docker ps -a | grep GNS3 | awk '{print $1}' | xargs -r docker rm -f

Tester la p2

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
Pour le router dans gns3 

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