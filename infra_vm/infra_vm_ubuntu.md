***
CREATION MACHINE VIRTUELLE -> Ubuntu
***

***
LISTES DES DIFFERENTES ETAPES REALISEES 
***

    - Activation et utilisation de KVM
    ( https://www.tecmint.com/install-kvm-on-ubuntu/https://www.tecmint.com/install-kvm-on-ubuntu/ )

    - Dans un terminal, taper :
        - sudo wirt-manager
    - Télécharger l'iso de l'OS/ distribution désiré
    - Donner le répertoire ou l'iso est installer
    - Suivre les instructions dans la VM pour l'installation de l'OS

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
