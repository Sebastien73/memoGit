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
- docker rmi -f <NUMERO_ID_IMAGE> = suppresion d'une image docker
- docker login = connexion avec son compte hub.docker (demandera l'id et le mot de passe de l'utilisateur)
- docker tag <NOM_IMAGE>:<TAG_IMAGE> <NOM_UTILISATEUR>/<NOM_REPOSITORY>:<TAG_NAME> = duplication de l'image sur notre "compte utilisateur" (vérifier avec un docker ps pour voir si les images correspondent bien)
- docker push <NOM_UTILISATEUR>/<NOM_REPOSITORY>:<TAG_NAME> = cela enverra l'image sur hub.docker

- chmod 744 <NOM_FICHIER> = full permissions sur le fichier (READ/WRITE/EXECUTE)
- chmod 600 <NOM_FICHIER> = permissions restreintes sur le fichier (READ/WRITE)

- nano start.sh = créer un fichier dans lequel on peux indiquer une commande comme le docker run
- ./start.sh = va executer le fichier avec la commande qui aura été indiqué à l'intérieure
- passwd <NOM_UTILISATEUR> = changer le mot de passe d'un utilisateur
- sudo groupadd <NOM_GROUPE> = création d'un groupe
- groups <NOM_UTILISATEUR> = voir les groupes assignés à un utilisateur
- getent group = voir la liste de tous les groupes
- sudo groupdel groupname = supprimer un groupe
- sudo chown :<NOM_GROUPE> <PATH_TO_FILE> = donner aux fichiers les droits pour un groupe
- Include /etc/phpmyadmin/apache.conf ajouter cette ligne dans le fichier apache2.conf (fin du fichier) puis restart apache2 (si pas de docker)
- nslookup <DOMAINE_NAME> = commande pour vérifier où pointe le nom de domaine (vérifier qu'il pointe sur l'ip de la machine virtuelle)


### Pré-requis :

- Putty
- ou WSL (system linux sous windows)

## Auteur :

* **Sebastien73** _alias_ [@Seb](https://github.com/Sebastien73)