# ALLER dans son dossier de code ou le creer :

- aller dans son dossier /var/www/html/<NOM_DU_DOSSIER_CONTENANT_LE_CODE> (freak_shop ou autre)

Si le dossier n'est pas present : 

- creer son dossier avec "sudo mkdir -p /var/www/html/<NOM_DU_DOSSIER_CONTENANT_LE_CODE>"

## CREATION VIRTUALHOST : 

- aller dans /etc/apache2/sites-available

- creer <NOM_DU_DOSSIER_CONTENANT_LE_CODE>.conf qui contient:


### CONTENU DU FICHIER <NOM_DU_DOSSIER_CONTENANT_LE_CODE>.conf :

<VirtualHost *:80>  (Port 80 pour protocole HTTP)
    ServerName exemple.com (CE QUI EST INDIQUER ICI, SERA L'URL DANS LE NAVIGATEUR)
    ServerAlias www.exemple.com (facultatif pour l'instant, utile plus tard pour https)
    ServerAdmin webmaster@exemple.com (facultatif pour l'instant, utile plus tard pour https)
    DocumentRoot /var/www/html/<NOM_DU_DOSSIER_CONTENANT_LE_CODE>

    <Directory /var/www/html/<NOM_DU_DOSSIER_CONTENANT_LE_CODE>>
        Options -Indexes +FollowSymLinks
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/<NOM_DU_DOSSIER_CONTENANT_LE_CODE>-error.log
    CustomLog ${APACHE_LOG_DIR}/<NOM_DU_DOSSIER_CONTENANT_LE_CODE>-access.log combined
</VirtualHost>

#### APRES LA CREATION DU VIRTUAL HOST : 

- Avec la commande : sudo a2ensite <NOM_DU_DOSSIER_CONTENANT_LE_CODE>
Cela va creer une copie de votre fichier <NOM_DU_DOSSIER_CONTENANT_LE_CODE>.conf de sites-available à sites-enabled.
Si par la suite, une modification est faite dans un des deux fichiers, le fichier se trouvant dans l'autre dossier sera modifié automatiquement
	
- Tester la configuration avec : sudo apachectl configtest
	si l'ouput est "Syntax OK", c'est que tout est bon.

- Redemarrer votre service apache2 alors avec : sudo systemctl restart apache2.

##### FINALITE : 

- Taper dans votre navigateur http://exemple.com/, vous devriez avoir votre landingpage(index.php/index.html) s'afficher dans votre navigateur.
