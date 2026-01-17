Lancer le Dockerfile du host:  
- docker build -t gns3-host .
- docker run -it gns3-host

Lancer le Dockerfile du routeur:
- Builder l’image Docker
- docker build -t gns3-router .

Supprimer tous les conteneurs gns3 

docker ps -a | grep GNS3 | awk '{print $1}' | xargs -r docker rm -f