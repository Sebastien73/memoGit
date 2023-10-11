***
DOCKER
***

***
LISTES DES DIFFERENTES ETAPES REALISEES 
***

    - Installation de docker (https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-
04)
    - Installation de docker-desktop (https://www.linuxtechi.com/how-to-install-docker-desktop-on-ubuntu/)
    
    - Mise en place d'un container apache

        - docker search apache
        - docker pull httpd
        - docker run -d -p 80:80 --name <NAME_YOU_WANT> httpd
        - docker exec -it <NAME_OF_CONTAINER> /bin/bash
        - cd htdocs
        - install vim ou nano
        - ouvrir le fichier -> indexhtml
        - modifié le h1
        - regarder le localhost

    - Mise en place d'un container apache avec des données persistente
      (https://www.ionos.fr/digitalguide/serveur/know-how/volumes-de-conteneurs-docker/)
        - docker stop <NAME_OF_CONTAINER>
        - docker rm <NAME_OF_CONTAINER>

    - Création d'un répertoire dans la session utilisateur
    - cd ~
    - mkdir <NAME_YOU_WANT>
    - echo "Coucou data persistent" > index.html (va créer un fichier index.html avec le echo à l'intérieure)
    - docker run -d -p 80:80 --name <NAME_YOU_WANT> -v $HOME/<NMAE_OF_DIRECTORY_VOLUMES>:<PATH_OF_SAME_FILE> <NAME_OF_IMAGE>

        - Exemple pour un container apache
            - docker run -d -p 80:80 --name seb -v $HOME/volumeDocker:/usr/local/apache2/htdocs httpd
            
            - Attention -> Par défaut le bind fonctionne dans les deux sens, c'est-à-dire que si l'on supprime le fichier index.html dans le répertoire htdocs du container apache, cela supprimera aussi le fichier dans le volume qui est bind au container.
            - Pour remédier à sa, il faudrais rajouter aprés le chemin de destination sur le container -> :ro (ro = read-only)

    - Si l'on stop et supprime le container. Il suffit de relancer la commande ci-dessus avec le volume bindé et le fichier index.html utilisé sera celui du volume.        
