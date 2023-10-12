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


***
SET ALL CONTAINER IN ONE CONTAINER UBUNTU SERVER
***

    - docker search ubuntu
    - docker pull ubuntu
    - docker run -it -d -p 8080:8080 --name WEB ubuntu (mettre -it sinon le container et kill automatiquement)
    - docker exec -it WEB bash
    - install AMP (apache / mysql / php / composer / phpmyadmin / wordpress )
    - Pour wordpress ( https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-22-04-with-a-lamp-stack )

***
SET IN BOTH CONTAINERS
***
    - user = seb // password wp = gprSOC8@fFHP6pf71G
    - First container for wordpress
        - docker pull wordpress
    - Second container for Mysql
        - docker pull mysql
    - Third container for phpmyadmin
        - docker pull phpmyadmin

    - source : https://nouslesdevs.com/docker/lier-deux-conteneurs/ 

    - Lancer un conteneur mysql avec variable d'environnement, port spécific, bind volume mysql avec /var/lib/mysql
    - docker run -e MYSQL_ROOT_PASSWORD=123 -e MYSQL_DATABASE=wordpress_db -v mysql:/var/lib/mysql --name wordpressdb -d -p 33060:3306 mysql

    - Lancer un conteneur wordpress avec des variable d'environnement, port spécific, bind volume site avec /var/www/html, 
    lié le conteneur wordpress au conteneur mysql
    - source : ( https://docs.phpmyadmin.net/en/latest/setup.html#installing-using-docker )
    - docker run -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=123 -e WORDPRESS_DB_NAME=wordpress_db -p 8080:80 -v site:/var/www/html --link wordpressdb:mysql --name wordpress -d wordpress

    - Lancer un conteneur phpmyadmin lié au conteneur mysql 
    - docker run -e PMA_HOST=wordpressdb -e MYSQL_ROOT_PASSWORD=123 -p 8081:80 --link wordpressdb:db --name myphpmyadmin -d phpmyadmin

    (- ip yan -> 172.22.114.77)
