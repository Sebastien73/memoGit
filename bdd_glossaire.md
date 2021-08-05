*** GLOSSAIRE ***

*** Qu'est-ce qu'une BDD ? ***

- Un ensemble qui contient deux composantes :

- Les données stockées.
- SGBD = Systeme de Gestion de BDD. (= manipulation des données.)


*** Données structurées : ***
Plusieurs granularité : (a > b)

- BANQUE DE DONNEES : Un ensemble de BDD (comme un stockage fichier qui aurait un dossier avec des dossiers et énormément de fichier)
- BASE DE DONNEES : Un dossier composé de fichiers.
- TABLES : table = tableau car composé de lignes et de colonnes. (ex: un fichier excel a des lignes et des colonnes et la table = à la feuille du classeur)
- LIGNES D'ENREGISTREMENT : Ce qui est à l'intérieure d'une table (ex: une table nommé "client", contiendras plusieurs colonnes comme "nom", "prénom", "adresse", "e-mail", "téléphone",etc... Puis pour chaque client on ajoutera une ligne a laquelle on renseignera les différentes colonnes.

*** Où sont les données ? ***

- Dans une base de données (équivaut à un dossier), on retrouvera nos tables qui seront découpés en deux fichiers :

    - Un fichier contenant le schéma, (qui sera la sructure de la table)
    - Un fichier contenant les lignes d'enregistrement, sous un format encodé (la ou les données seront stockées)

Les lignes d'enregistrement pourront être lu par le SGBD.

*** SGBD c'est quoi ? *** 

- Moteur SQL : 

Réalisation de toutes les manipulations des fichiers (lire les lignes d'enregistrement et nous les renvoyés dans un langage compréhensible),

- Catalogue :

Contient la description de la BDD, les informations comme les utilisateurs, leurs rôles, leurs droits d'accès, leurs autorisations.
C'est ici que l'on fera toutes les vérifications.

- Langage de requête :

Faire nos demandes dans le langage de requête que le SGBD, c'est -à-dire le langage SQL.

- Processeur de requête :

Son rôle, prendre notre requête et la transformer en commande pour le moteur SQL.
Pour lui dire de prendre un fichier en particulier, les données associées et nous retourner le résultat de notre requête.

*** Le processus d'une requête SQL *** 

-> Ecrit de la requête (ex: récuperer les 10 derniers clients) 
-> Transmission au SGBD et notamment au Processeur de requête (la prendre, la traduire, et définir un plan d'execution)
-> Vérification des droits pour faire les opérations nécessaires par le Catalogue
-> Si la vérification est ok, alors on envoie au moteur SQL (va faire les manipulations et faire les traitements nécessaire)
-> Puis le résultat nous est retourné.

*** IMPORTANT : ***

- Bien maîtriser le langage de requête (SQL)


*** Modèle conceptuel de données ***

- Modèle entité-association : 

    modèle conceptuel de données (MCD), c'est-à-dire une représentation abstraite des données.
    utilise une représentation graphique des données

- Principes :

 Regroupement des données en entités et liées par des associations.
 Repose sur 3 principe de base :
  l'entité
  l'attribut
  l'association

Une entité est un ensemble d'objets similaire pouvant être regroupés
Une occurence d'entite sont des objets discernables parmi d'autres

Ex :

Entité : 
produit -> qui contient la réf produit / le design / le prix HT

Occurence d'entité :
les différents produit eux-même -> référence R012335648 pour une IMPRIMANTE à 140 € HT.

Attribut d'une entite est une caractéristique de l'entite 
 chaque attribut porte un nom
 chaque attribut posséde une valeur dans un domaine

Identifiant (clé) d'une entité :
ensemble minimal d'attribut déterminant de manière unique une occurence dans l'entité.

Ex : 

1 entité facture -> numéro de facture (identifiant) et date (attribut)

lié à une autre entite produit -> qui aura la réf du produit / le design et le prix HT.

identifiant = a la clef primaire

Les entités (tables) sont reliées par des associations, qui servent à relier 2 ou + tables
Une association porte un nom et peux avoir des attributs.

Ce qui forme une phrase entre la table facture et la table produit.

Cardinalité d'une association B vis-à-vis d'une entité C: 
 nombre minimum et maximum de fois où une occurence de A peut apparaître dans l'association B

Cardinalité minimum : 

0 : il peut exister des occurences de A qui n'apparaissent pas dans B
1 : toutes occurence de A apparaît au moins une fois dans B

Cardinalité maximum : 

1 :  toutes occurence de A apparaît au plus une fois dans B
n : il peux exister des occurences de A apparaissant plusieurs fois dans B

*** GLOSSAIRE ***

- Base de données : système de stockage d’informations éphémères sous forme de tableau et permettant une manipulation rapide des données.

- Cardinalité d'une association B vis-à-vis d'une entité C: 
nombre minimum et maximum de fois où une occurrence de A peut apparaître dans l'association B
 
 Cardinalité minimum :
0 : il peut exister des occurrences de A qui n'apparaissent pas dans B
1 : toutes occurrence de A apparaît au moins une fois dans B
 
 Cardinalité maximum : 
1 :  toutes occurrence de A apparaît au plus une fois dans B
n : il peut exister des occurrences de A apparaissant plusieurs fois dans B

- Clé étrangère : c’est une clé primaire associée à un autre tableau permettant de lier les 2 tableaux.

- Clé primaire : identifiant unique d’une table.

- Données : valeur élémentaire et nécessaire à la constitution d’un tableau.

- Formulaire : requête SQL permettant d'afficher ou de saisir les informations contenues dans les tables.

- Identifiant : élément permettant d’identifier de manière unique une ligne d’enregistrement dans une table.

- Index :  Une structure de données utilisée et entretenue par le système de gestion de base de données (SGBD) pour lui permettre de retrouver rapidement les données. L'utilisation d'un index simplifie et accélère les opérations de recherche, de tri, de jointure ou d'agrégation effectuées par le SGBD.

- Entité: ensemble d’objets similaires pouvant être regroupés

- Null : valeur affectée à un champ lorsque rien n'a été saisi sur ce champ.

- Relation : concept de correspondance, une relation dans un ensemble est une proposition qui lie un certain nombre d'éléments, une relation dans une base de données est une table liée

- Requête : Passez une commande avec des critères pour rechercher des données via le langage SQL

- Restriction : Permet de faire une recherche plus spécifique qu’une recherche générale avec des critères précis.

- Schéma de relation : le schéma représente toutes les tables liées de manière logique dans une base de données

- SELECT : langage SQL. Ordre permettant de choisir les champs à afficher (exemple : SELECT Titre_Representation).

- SGBD : (Système de Gestion de base de données) 
Composé de 4 parties de bases :

 Moteur SQL : 
 
Réalisation de toutes les manipulations des fichiers (lire les lignes d'enregistrement et nous les renvoyés dans un langage compréhensible),
 
 Catalogue :
 
Contient la description de la BDD, les informations comme les utilisateurs, leurs rôles, leurs droits d'accès, leurs autorisations.
C'est ici que l'on fera toutes les vérifications.
 
 Langage de requête :
 
Faire nos demandes dans le langage de requête que le SGBD, c'est -à-dire le langage SQL.
 
 Processeur de requête :
 
Son rôle, prendre notre requête et la transformer en commande pour le moteur SQL.
Pour lui dire de prendre un fichier en particulier, les données associées et nous retourner le résultat de notre requête.

- SQL : Structured Query Language est un langage relativement simple permettant toutes les manipulations de données sur une base de données relationnelles et la liaison et l'agrégation dynamique de données

- Structure de données : structure logique destinée à contenir des données, les organisant afin de simplifier leur traitement par des fonctions adéquates (structures textuelles, numériques, temporelles, ...)
Plusieurs granularité : (a > b)

 BANQUE DE DONNÉES : Un ensemble de BDD (comme un stockage fichier qui aurait un dossier avec des dossiers et énormément de fichier)

 BASE DE DONNÉES : Un dossier composé de fichiers.

 TABLES : table = tableau car composé de lignes et de colonnes. (ex: un fichier excel a des lignes et des colonnes et la table = à la feuille du classeur)

 LIGNES D'ENREGISTREMENT : Ce qui est à l'intérieur d'une table (ex: une table nommée "client", contiendras plusieurs colonnes comme "nom", "prénom", "adresse", "e-mail", "téléphone",etc... Puis pour chaque client on ajoutera une ligne à laquelle on renseignera les différentes colonnes.

- Tables : table = tableau car composé de lignes et de colonnes. (ex: un fichier excel a des lignes et des colonnes et la table = à la feuille du classeur)

- Tuple : la ligne d'une table de base de donnée (également nommée enregistrement)

- INNER JOIN : Une des jointures en SQL. Permettant d’associer plusieurs tables dans une même requête SQL.

- Vue : table virtuelle dont les véritables données sont stockées dans de vraies tables relationnelles, ces vues permettent des accès complexes aux données (jointures, parties, ...)

- WHERE : langage SQL. Clause permettant de faire des recherches plus précises dans notre requête SQL.
