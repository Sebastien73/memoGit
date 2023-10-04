***
CREATION MACHINE VIRTUELLE -> Windows
***

***
LISTES DES DIFFERENTES ETAPES REALISEES 
***

    - Activation et utilisation de Hyper-V
    ( https://learn.microsoft.com/fr-fr/virtualization/hyper-v-on-windows/quick-start/quick-create-virtual-machine )

    - Installation des différents services :
        
        - Apache2 ( https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-22-04 )
        - Php
        - MySQL
        - Composer ( https://www.digitalocean.com/community/tutorials/how-to-install-php-8-1-and-set-up-a-local-development-environment-on-ubuntu-22-04 )
        - git
        - nodejs ( https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04 )
        - npm
        - adminer ( https://www.makeuseof.com/how-to-install-adminer-on-ubuntu/ )

    - Génération d'une clef SSH sur la machine virtuelle et
    la liée au compte github

    - Cloner le repository dans /var/www
    (Si besoin de modifier des droits de lecture : sudo chown -R '<NAME>':'<NAME>' <PATH>)

    - Configurer un virtual host
    - Désactiver la config par défaut de apache pour ne pas surcharger par dessus celui crée précédemment
    - Pour une application laravel :
        - Ne pas oublier de faire :
            - composer install
            - npm install 
            - npm run build
            - créer un fichier .env depuis le modèle .env.example
            - générer une clef pour l'application

    - Création un réseau privé virtuel entre la machine hôte et la machine virtuelle
    ( https://www.andrewconnell.com/blog/allowing-a-host-machine-to-talk-to-guest-vms-in-hyper-v-indepth/ )
    
    - Si problème de communication de la machine virtuelle à la machine hôte (windows)
        - Le problème vient du pare-feu windows defender 
        - Deux solutions :
            - Désactiver le pare-feu
            - Activer une règle dans les paramètres avancés ( https://superuser.com/questions/1544360/cant-ping-host-from-vm )