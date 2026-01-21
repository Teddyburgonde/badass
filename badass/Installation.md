Docker:
```
sudo apt **update**
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo systemctl status docker
```

GNS3:

```
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt install -y gns3-gui gns3-server -> yes -> yes
gns3 -> choisir run appliances on my local computer
```

docker dans gns3

```
Dans le terminal -> sudo usermod -aG docker $USER
```