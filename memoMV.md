# Memo Machine Virtuelle.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com) 

Ce fichier est un mémo pour l'utilisation d'une machine virtuelle.

## Commandes :

- apt-get update = mettre a jour les installations.
- apt-get upgrade = mettre à jour les versions d'installations.

- apt install = installations des services.
    - apt install docker.io = installation de docker
    - apt install apache2 = installation d'apache (server web)
    - apt install mysql-server = installation de mysql
    - apt install nano = installation de nano (permet la modif ou création de fichiers)
    - apt install git = installation de git (permet l'execution de commandes git)
    - apt install mlocate = installation de mlocate (permet de rechercher avec la commande locate)
    - apt install phpmyadmin = installation de phpmyadmin (permet de gérer les bases de données (lancer les services apache2 et mysql avant))

- service apache2 start = démarre apache2
- service mysql start = démarre mysql
- service <NOM_DU_SERVICE> status = voir si le service est lancé ou non
- dpkg-reconfigure phpmyadmin = permet de reconfigurer phpmyadmin

- adduser = ajout d'un utilisateur.
- usermod -aG sudo <NOM_UTILISATEUR> = ajout des droits sudo à l'utilisateur.
- usermod -aG docker <NOM_UTILISATEUR> = ajout des droits docker à l'utilisateur.

- nano Dockerfile = création d'un fichier qui servira à la construction d'une image. (FROM ubuntu:20.04 RUN apt-get update -yq \ && apt-get install curl gnupg -yq ADD . /app/ WORKDIR /app)
- nano .dockerignore = création d'un fichier (équivalent à un .gitignore)
- docker build -t <NOM_IMAGE> . (le . est important, il faut taper cette commande en étant dans le répertoire ou se trouve le dockerfile, le . indique le répertoire courant)
- docker run -it -p 80:80 -p 443:443 --name <NOM_CONTAINER> <NOM_IMAGE> bash
- docker commit <ID_CONTAINER> <NOM_IMAGE>
- docker ps = liste les dockers qui sont start
- docker images = liste les images dockers crées.

- chmod 744 <NOM_FICHIER> = full permissions sur le fichier (READ/WRITE/EXECUTE)
- chmod 600 <NOM_FICHIER> = permissions restreintes sur le fichier (READ/WRITE)

- nano start.sh = créer un fichier dans lequel on peux indiquer une commande comme le docker run
- ./start.sh = va executer le fichier avec la commande qui aura été indiqué à l'intérieure


### Pré-requis :

- Putty

## Auteur :

* **Sebastien73** _alias_ [@Seb](https://github.com/Sebastien73)