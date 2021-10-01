# Memo Machine Virtuelle.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com) 

Ce fichier est un mémo pour l'utilisation d'une machine virtuelle.

## Commandes :

*** Commandes de base : ***

- ls : lister tous les fichiers présent dans un dossier
- ls -a : lister tous les fichiers présent dans un dossier + les fichiers cachés
- cd <PATH_TO_FILE> : se déplacer à l'endroit indiquer
- cat <NOM_DU_FICHIER> : renvoi les infos d'un fichier (sans l'ouvrir)
- mv <NOM_DU_FICHIER> <DESTINATION> : changer un fichier de place
- touch <NOM_DU_FICHIER> : créer un fichier
- rm <NOM_DU_FICHIER> : supprimer un fichier
- mkdir <NOM_DU_DOSSIER> : création d'un dossier
- rmdir <NOM_DU_DOSSIER> : suppression d'un dossier
- nano <NOM_DU_FICHIER> : ouvrir un fichier avec l'editeur de texte nano
- history : afficher l'historique des commandes déjà entrées
- pwd : trouve le chemin du repertoire de travail où l'on se trouve actuellement
- cp <NOM_DU_FICHIER> <DESTINATION>: copier un fichier vers un autre endroit
- scp [autres options] [nom d'utilisateur source@IP]:/[dossier et nom de fichier] [nom d'utilisateur de destination@IP]:/[dossier de destination] = transfert de fichier en connexion SSH
- find <NOM_DU_FICHIER/DIRECTORY> = trouver un fichier ou un dossier
- locate <MOTS> = fait une recherche des fichier contenant un mot par exemple test, affichera tous les fichiers ayant test dans son nom
- grep <MOTS> <NOM_DI_FICHIER> = fera une recherche dans le nom du fichier et trouvera le mots rechercher en affichant la ligne
- sudo = permet d'effectuer des commandes qui nécessite des autorisations administrative
- wall = permet l'envoi d'un message à tous les utilisateur connecté
- write <NOM_UTILISATEUR> = envoyez un message à un utilisateur en particulier
- help = afficher une liste de toutes les commandes intégrées.
- help <COMMANDES> =  afficher une courte description de la commande correspondante.


*** RACCOURCIS BASH : *** 

- TAB = commençant à taper un nom de fichier, si celui-ci est présent dans le dossier où l'on se trouve, en appuyant sur TAB, le nom du fichier se completera tout seul.
- fleche du haut = reviens sur la dernière commande entrée
- CTRL-A = retour au début de la ligne
- CTRL-C = stoppper la commande en cour
- CTRL-E = retour au fin de la ligne
- CTRL-R = recherche dans l'historique des commandes
- exit = CTRL-D = termine la session en cours et ferme le terminal
- clear = CTRL-L = fais un clear de la console sans rien supprimer (la dernière ligne se met tout en haut)
- !! = répéter la dernière commande


*** COMMANDES : *** 

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

- adduser <NOM_UTILISATEUR> = ajout d'un utilisateur.
- adduser --force-badname <NOM_UTILISATEUR> = forcer le nom que l'on veux mettre pour un utilisateur
- usermod -aG sudo <NOM_UTILISATEUR> = ajout des droits sudo à l'utilisateur.
- usermod -aG docker <NOM_UTILISATEUR> = ajout des droits docker à l'utilisateur.

- nano start.sh = créer un fichier dans lequel on peux indiquer une commande comme le docker run
- ./start.sh = va executer le fichier avec la commande qui aura été indiqué à l'intérieure
- passwd <NOM_UTILISATEUR> = changer le mot de passe d'un utilisateur
- sudo groupadd <NOM_GROUPE> = création d'un groupe
- groups <NOM_UTILISATEUR> = voir les groupes assignés à un utilisateur
- getent group = voir la liste de tous les groupes
- sudo groupdel groupname = supprimer un groupe
- sudo chown <NOM_UTILISATEUR>:<NOM_UTILISATEUR> <PATH_TO_FILE> = donner les droits a un utilisateur sur un fichier (propiétaire etc...)
- Include /etc/phpmyadmin/apache.conf ajouter cette ligne dans le fichier apache2.conf (fin du fichier) puis restart apache2 (si pas de docker)
- nslookup <DOMAINE_NAME> = commande pour vérifier où pointe le nom de domaine (vérifier qu'il pointe sur l'ip de la machine virtuelle)
- tail -f /var/log/syslog = voir en temps réel les derniers événements d'un fichier de log

*** COMMANDES AUTORISATIONS DE FICHIERS : ***

- chmod 644 <NOM_FICHIER> = Lecture, écriture pour le propriétaire / Lecture pour les autres
- chmod 666 <NOM_FICHIER> = Lecture, écriture pour tout le monde (DECONSEILLER !!!!)
- chmod 700 <NOM_FICHIER> = Lecture, écriture, execution juste pour le propriétaire
- chmod 705 <NOM_FICHIER> = Le propriétaire à tous les droits / Le groupe aucun / Les autres lire et executer
- chmod 755 <NOM_FICHIER> = Le propriétaire à tous les droits / Les autres lire et executer
- chmod 764 <NOM_FICHIER> = Tous droits pour le propriétaire / Lecture, écriture pour le groupe / Lecture seule pour les autres
- chmod 774 <NOM_FICHIER> = Tous les droits pour le propriétaire et le groupe / Lecture seule pour les autres
- chmod 775 <NOM_FICHIER> = Tous les droits pour le propriétaire et le groupe / Lecture et exécution pour les autres
- chmod 777 <NOM_FICHIER> = Tous les droits pour tous (FORTEMENT DECONSEILLER !!!!)

*** COMMANDES DOCKER : ***

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

*** CREER CERTIFICAT SSL pour sécuriser son site : ***

- sudo a2enmod ssl = installation du module ssl pour que le protocole TLS fonctionne
- sudo systemctl restart apache2 = redémarrer le service apache2
- apache2ctl -M | grep ssl = vérification de l'activation du module
- sudo apt update = mettre à jour les paquets
- sudo apt install software-properties-common = installation de service software-properties-common
- sudo apt update = mettre à jour les paquets
- sudo apt install certbot = installation du service CERTBOT

- sudo certbot certonly --webroot -w /var/www/html/<NOM_DU_DIRECTORY> -d <NOM_SOUS_DOMAINE_+_NOM_DE_DOMAINE> -d <www.NOM_SOUS_DOMAINE_+_NOM_DE_DOMAINE>

Si la commande à bien fonctionnée, cela doit nous renvoyer un message contenant :

CONGRATULATIONS !! 

et les chemins des clefs public/priver

Ensuite il faudras modifier les virtuals hosts pour que le port 80 renvoi sur le port 443 automatiquement, modifier le chemin des clefs existant par ceux indiquer par la commande faite préalablement.

- sudo systemctl restart apache2 = redémarrer le service apache2

Retournez sur le navigateur, si cela a fonctionner le site est sécurisé.

*** Generer et se connecter par clef SSH : ***

- ssh-keygen -t ed25519
 Cela va donner : Generating public/private ed25519 key pair.
 Laisser le premier champs demandé vide = Enter file in which to save the key:
 Enter passphrase (empty for no passphrase) = ce que vous voulez (cela va securisez votre clef), laissez vide si vous ne voulez pas mettre de sécurité supplémentaire
 Enter same passphrase again = répétez si vous avez entré quelque chose précedemment

 Le message suivant devrais apparaître : 

 Your identification has been saved in C:\Users\Pierre\.ssh\id_ed25519.
Your public key has been saved in C:\Users\Pierre\.ssh\id_ed25519.pub.
The key fingerprint is:
SHA256:4Yjb63lZzyRw+ADKaZ6nwZDA7jBrtorVR4mkgXRGWN0 pierre@DESKTOP-VJATO16
The key's randomart image is:
+--[ED25519 256]--+
|..+=. .          |
|o+o  ..E         |
|o..o.o ...       |
|o.o+=o ++..      |
|oo.=o.+ S=       |
|.+ .=+.   + .    |
|o o o+o  o =     |
|.o  .. oo   o    |
|+    .+.         |
+----[SHA256]-----

Votre clef est bien générée.

- ssh-copy-id <NOM_UTILISATEUR>@<IP_SERVEUR>
- Entrez le mot de passe utilisateur 

Voilà, votre clé publique a bien été copiée dans le fichier ~/.ssh/authorized_keys de l’utilisateur sur le serveur distant.

- ssh <NOM_UTILISATEUR>@<IP_SERVEUR>

Cela vous connectera sur le serveur distant avec votre clef SSH. (Si une passphrase a été indiqué, alors le serveur distant la demandera avant de vous connecter)

Source des infos, si besoin : https://lecrabeinfo.net/se-connecter-en-ssh-par-echange-de-cles-ssh.html#se-connecter-en-ssh-par-echange-de-cles-ssh


*** Convertir fichier format windows au format unix : *** 

- sudo apt install dos2unix
- sudo apt update
- sudo dos2unix <NOM_DU_FICHIER>

*** CODES HTTP : ***

- 200 : succès de la requête 
- 301 et 302 : redirection, respectivement permanente et temporaire 
- 404 : page non trouvée 
- 500 et 503 : erreur serveur 
- 504 : le serveur n’a pas répondu 

*** DNS ? ***

DNS : Le serveur DNS (Domain Name System, ou Système de noms de domaine en français) est un service dont la principale fonction est de traduire un nom de domaine en adresse IP. Pour simplifier, le serveur DNS agit comme un annuaire que consulte un ordinateur au moment d'accéder à un autre ordinateur via un réseau. Autrement dit, le serveur DNS est ce service qui permet d'associer à site web (ou un ordinateur connecté ou un serveur) une adresse IP, comme un annuaire téléphonique permet d'associer un numéro de téléphone à un nom d'abonné. 

*** URL ? ***

URL : Sur un plan technique, l'URL indique aux navigateurs (Internet Explorer, Mozilla, Firefox, Safari, etc.) le chemin à emprunter pour accéder aux ressources contenues dans le World Wide Web.

    1. protocole : https://
    2. le sous domaine :  www.
    3. le nom de domaine principal (2eme niveau) : mondomaine
    4. le domaine de premier niveau : .com
    5. le répertoire : /contact
    6. # = ancre
    7. ? = parametres
    8. :80 || :443 = port utilisé pour accéder au ressources du serveur


### Pré-requis :

- Putty
- ou WSL (system linux sous windows)

## Auteur :

* **Sebastien73** _alias_ [@Seb](https://github.com/Sebastien73))