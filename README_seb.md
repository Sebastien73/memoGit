# Memo GIT.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com) 

Ce fichier est un mémo pour l'utilisation de GIT bash.

## Commandes :

- ls = liste des éléments d'un dossier.
- cd = se déplacer vers le dossier.
- mkdir = création d'un dossier (mk = make / dir = directory).
- ./ = remonter d'un dossier.
- ../ = remonter de deux dossiers.
- ls -a = montrer fichiers cachés
- git --version = affiche la version de Git.
- git config --global user.name "Sebastien" (définir un nom).
- git config --global user.email "jssebastienjacquelin@hotmail.com" (définir un e-mail).
- git init = a initialiser un dépôt (repository).
- git status = voir si le répertoire est bien un dépôt (repository).
- git add bonjour.txt = ajoute les changements du fichier bonjour.txt au dépôt avant de commit.
- git commit -m "Création du fichier bonjour" (modifications à l'historique du dépôt avec un court (m) message décrivant les mises à jour.)
- git diff = afficher les différences entre le fichier actuel et la dernière version soumise.
- git config --global user.username USerNamE = lié un nom d'utilisateur GitHub avec Git.
- git config --global user.username = affiche le nom d'utilisateur entré.
- git remote add origin <URLFROMGITHUB> = lié l'url github avec le repertoire locale.
- git push origin master = poussez toutes les données faite par nous-même.
- git clone <URLFROMGITHUB> = cloner un repository github en locale. (ne pas etre déjà dans un dossier repository git en local).
- cd <NOMDUDOSSIER> = se déplacer dans le repository cloner.
- git remote -v = voir les adresses distantes déjà configurée.
- git remote add upstream <URLD'ORIGINE> = permet de pouvoir TIRER les données si du changement se fait à la source.
- git branch <BRANCHNAME> = ajouter une branche dans un repository.
- git checkout <BRANCHNAME> = entrer dans une branche et travailler dessus.
- git branch -D <BRANCHNAME> = supprimer une branche.
- git pull <REMOTENAME> <BRANCHNAME> = tirer les modifications apportés depuis une branche distante.
- git merge <BRANCHNAME> = fusionner la branche secondaire à la branche principale. (se mettre sur la branche principale avant de faire une fusion).
- git push <REMOTENAME> --delete <BRANCHNAME> = supprimer une branche distante.
- git push origin +ID_DE_TON_COMMIT^:master = revenir a un commit antérieur.
- git reset --hard = reviens au dernier commit (penser à faire un git push)
- git tag v1.0 = attache une étiquette v1.0
- git push origin v1.0 = push l'étiquette sur GitHub.
- .gitignore = fichier caché dans le dossier local pour ignorer les fichiers que nous nous voulons pas commit ou pull etc...
- git restore --staged <file> = si erreur lors d'une commande, apres un git status, on peux avoir l'option de restaurer un fichier et de refaire ADD puis COMMIT puis PUSH
- git rm <file> = effacer le fichier selectionner.
- git reset +id du commit = annulation de tous les commit jusqu'a celui selectionner.
- git merge --abort == pour annuler le merge.
- git log --oneline --decorate --graph = toutes activités par ligne / branches.
- git commit -m "fixes #+ID_ISSUES" = fermer une issues de github (issues = ticket).

### Pré-requis :

- Visual Studio code,
- Git bash,
- GitIT,
- Github.

## Auteur :

* **Sebastien73** _alias_ [@Seb](https://github.com/Sebastien73)