Pour les explications, on va prendre en exemple le masque /24 
*(le masque peut être compris entre /0 et /32 (car une IPV4 est sur 4 octets (de **0.0.0.0** jusqu’à **255/255/255/255** )))*

/24 = notation CIDR
c'est ce qui indique le masque de sous-réseaux (on sait que dans l'ip par exemple 192.55.132.1, seul les 24 premier bits définisse l'adresse réseaux (l'adresse de notre box), et le reste défini l'adresse du client spécifique (ordinateur de Galaad par exemple))

**Explication imagée si le masque est /24:**
Si on imagine un System de boite au lettre, alors les 24 premiers bits sont l'adresse d'un immeuble, et le reste est le nom/prénom de la bonne boite au lettre.