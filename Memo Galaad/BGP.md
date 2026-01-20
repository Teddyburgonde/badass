(_Border Gateway Protocol_)

Imagine que tu veux envoyer un courrier (le paquet VXLAN) à un ami.

- **OSPF** (ou **IS-IS**) c'est le facteur qui connaît le plan de la ville et sait où se trouve chaque maison.
    
- **BGP [[EVPN]]** c'est le carnet d'adresses qui te dit que ton ami "Docker-B" habite à la maison "VTEP-2".
    

Si tu n'as pas OSPF, le carnet d'adresses (EVPN) te dit où est ton ami, mais tu n'as pas de route pour y aller. Si tu n'as pas BGP EVPN, tu as les routes, mais tu ne sais pas dans quelle maison se cache ton ami.



- **Sans [[EVPN]] :** BGP transporte des messages du type : _"Pour aller au réseau 8.8.8.8, passe par moi"_.
    
- **Avec [[EVPN]] :** BGP transporte des messages beaucoup plus riches : _"Hé, j'ai un Docker avec la MAC `AA:BB` et l'IP `192.168.1.1` qui est branché sur mon VNI 100"_.