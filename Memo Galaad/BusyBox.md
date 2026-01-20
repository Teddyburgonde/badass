C'est le **"couteau suisse"** du monde Linux. Pour ton TP, retiens ces 4 points clés :

1. **Le Concept :** C'est un seul et unique fichier binaire qui contient des centaines de commandes Linux (`ls`, `cp`, `ping`, `ip`, `telnet`, etc.). Normalement, chaque commande est un programme séparé ; ici, tout est fusionné.
    
2. **L'Utilité :** Il est **hyper léger** (environ 1 Mo). C'est pour ça qu'on l'utilise dans les systèmes où l'espace est compté : routeurs, objets connectés (IoT) et surtout les **containers Docker**.
    
3. **Dans GNS3 :** C'est ton "PC de test". Au lieu de lancer une machine virtuelle lourde (Windows ou Ubuntu) qui ferait ramer ton ordinateur, tu lances un Docker BusyBox. Il démarre en 1 seconde et consomme presque 0 RAM.
    
4. **Ton rôle :** Tu vas l'utiliser uniquement pour générer du trafic. Tu lui donnes une IP, et tu fais un `ping` vers un autre BusyBox pour vérifier que ton tunnel VXLAN fonctionne.

Utilisé pour crée un mini ordinateur grâce a docker super léger.