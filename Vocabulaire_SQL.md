I - Pour ajouter une clé étrangère :
    1 - On ajoute idClient dans la table commandes
    2 - et dans le SQL de commandes, on tape :

ALTER TABLE commandes
ADD FOREIGN KEY (idClient) REFERENCES clients(idClient);

    3 - pour ajouter la clé étrangère



II - Pour insérér les informations :
    1 - dans le SQL, ont tape :

INSERT INTO table(idArticle, nomArticle, etc.) VALUE (123, 'bouteille', etc.)

-> on peut mettre sur plusieurs lignes avec ; à la fin



III - SQL SELECT : sélection dans une table dune BDD

SELECT nom_de_colonne FROM nom_de_table.

SELECT * (létoile permet de sélectionner (dobtenir) toutes les colonnes...) FROM nom_de_table (... de la table concernée)


IV - PDO : outil complet qui permet daccéder à nimporte quel type de BDD. On peut lutiliser pour se connecter aussi bien à MySQL, qua PostgreSQL ou Oracle.  


X - Divers :
dateCommande =  ANNEE/MOIS/JOUR (car mis en Américain)
auto-incrémentation : créait un id INT à la suite 

Dans la TABLE articles ; onglet structure , les valeurs par défaut doivent être mises en NULL pour pouvoir ajouter un nouvel article avec juste les colonnes demandées (ex : quantiteDispo, catégoires)

Pour filtrer les résultats et obtenir uniquement les enregistrements qui ne sont pas null, il convient d’utiliser la syntaxe suivante:

SELECT * FROM `table` WHERE nom_colonne IS NOT NULL



ETAPE : 

- 1 : SELECT nomArticle FROM `articles` : sélect nom de la table articles


- 2 : SELECT idArticles FROM `articles` WHERE quantiteDispo = 0 : sélectionne dans idArticle, depuis la table articles où la quantitéDispo = 0


- 3 : SELECT idCommandes, nomArticle, quantiteDispo, prixArticle FROM `commandes_articles` INNER JOIN articles ON commandes_articles.idArticles = articles.idArticles WHERE idCommandes = 147
Sélectionner lidcommandes, le nom, la qté et le prix de la table commandes_articles en joignant la table articles lorsque lidArticle de commandes_articles est égal à lidArticle de articles OU
lidCommandes = 147 (la première)

    SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.fk_id
    -> sélectionner les enregistrements des tables table1 et table2 lorsque les données de la colonne “id” de table1 est égal aux données de la colonne fk_id de table2.


- 4 : SELECT idCommandes, SUM(prixArticle*quantite) AS prixTotal FROM commandes_articles INNER JOIN articles ON commandes_articles.idArticles=articles.idArticles GROUP BY idCommandes
    -> AS est un alias : renomme temporairement une colonne ou une table dans une requête
    -> ON = WHERE
    -> GROUP BY : groupe par chaque idCommandes


- 5 : SELECT dateCmd, SUM(prixProduits) AS prixTotal FROM commandes_produits INNER JOIN produits ON commandes_produits.idProduits = produits.idProduits INNER JOIN commandes ON commandes_produits.idCOMMANDES = commandes.idCOMMANDES WHERE dateCmd = '2021-08-06'


- 6 : SELECT * FROM commandes WHERE dateCommandes BETWEEN CURRENT_DATE - INTERVAL 10 day AND CURRENT_DATE : sélect les colonnes de la table commandes ou la date commande est compris entre une date avec lintervale de 10 jours et la date du jour


- 7 : SELECT dateCommandes, SUM(prixArticle*quantite) AS prixTotal FROM commandes_articles INNER JOIN articles on commandes_articles.idArticles=articles.idArticles INNER JOIN commandes ON commandes_articles.idCommandes=commandes.idCommandes WHERE dateCommandes = CURRENT_DATE - INTERVAL 1 day : 
sélect la date de commande, la somme en prixTotal de commandes_articles (table de laison) en joignant la table articles ou lidArticles de la commandes_articles est égal à lidArticles de larticles en joignant la table commandes OU lidcommandes de la commandes_articles est égal à lidcommandes de la commande ou la date de commande = date du jour interval - 1


- 7 bis : SELECT dateCommandes, SUM(prixArticle*quantite) AS prixTotal FROM commandes_articles INNER JOIN articles on commandes_articles.idArticles=articles.idArticles INNER JOIN commandes on commandes_articles.idCommandes=commandes.idCommandes WHERE dateCommandes = CURRENT_DATE - INTERVAL 1 day GROUP by commandes_articles.idCommandes : idem sauf groupement par idcommandes de la commandes_articles


- 8 : SELECT idCommandes, SUM(prixArticle*quantite) as prixTOTAL FROM commandes_articles INNER JOIN articles ON commandes_articles.idArticles=articles.idArticles GROUP BY idCommandes HAVING prixTotal >= 100 && prixTotal <= 550 : sélect (ce quon veut) lidCommandes, la somme totale provenant de commandes_articles(table de laison) en joignant la table articles [...]
- HAVING : permet de filtrer en utilisant des fonctions SUM(), OOUNT(), AVG(), etc.


- 8 bis : SELECT idCommandes, SUM(prixArticle*quantite) as prixTOTAL FROM commandes_articles INNER JOIN articles ON commandes_articles.idArticles=articles.idArticles GROUP BY idCommandes HAVING SUM(prixArticle*quantite) >= 100 && SUM(prixArticle*quantite) <= 550


- 8 bis b : SELECT idCommandes, SUM(prixArticle*quantite) as prixTOTAL FROM commandes_articles INNER JOIN articles ON commandes_articles.idArticles=articles.idArticles GROUP BY idCommandes HAVING SUM(prixArticle*quantite) >= 100 AND SUM(prixArticle*quantite) <= 550


- 9 : SELECT idCommandes, idclient FROM commandes WHERE idclient = 23


- 9 : SELECT idCommandes, client.idclient FROM commandes INNER JOIN client ON commandes.idClient=client.idClient WHERE identifiant = 'Charlize Theron'


- 10 : SELECT idclient, count(*) as nbCommandes from commandes group by idclient : sélect lidclient, calcul le nombre denregistrement dans la table sous le nom nbCommandes provenant de la table commandes grouper par idclient 


- 11 : INSERT INTO commandes_articles(idCommandes_Articles, quantite, idCommandes, idArticles) VALUES (331, 1, 951, 369), (332, 2, 951, 123), (333, 3, 951, 266)


- 11 bis : INSERT INTO articles (quantiteDispo, categories) values (16, 3) : ajoute un article avec uniquement les colonnes et valeurs renseignées [il faut que dans la structure, les valeurs par défaut des colonnes soient en NULL sinon, elle affiche 0]


- 12 : INSERT INTO articles(idArticles, desArticles, prixArticle, poidsArticles, etc) VALUES (331, 'un joli truc', 15, 50, etc)


- 13 : UPDATE articles SET quantiteDispo = articles.quantiteDispo + 100 WHERE idArticles = 123 : apporter une modification à la table articles avec quantiteDispo = quantiteDispo de la table articles + 100 OU lidArticle = 123
- 13 bis : UPDATE articles SET quantiteDispo = quantiteDispo + 100 WHERE idArticles = 123 : idem sans le quantiteDispo de la table article


- 14 : DELETE FROM articles WHERE idArticles = 294


- 15 a : SELECT * FROM `commandes` WHERE idClient != 13 AND idClient != 23 : sélect dans les colones de la table commandes ou lidclient et différent de 13 et différent de 23
- 15 a 2 : SELECT * FROM `commandes` INNER JOIN client on commandes.idClient=client.idClient : sélect toutes les colonnes de la table commandes en joignant la table client avec lidclient de la table commande et lidclient de la table client


- 16 a : SELECT * FROM client INNER JOIN commandes on commandes.idClient=client.idClient
- 16 a 1 : SELECT * FROM client INNER JOIN commandes on commandes.idClient=client.idClient GROUP BY client.idClient : affiche toutes les colonnes de la table client en joignant la tables commandes avec lidclient de commandes = lidclient de client regroupé par lidclient de client


- 16 : SELECT idClient, identifiant FROM client WHERE idClient NOT IN ( SELECT DISTINCT idClient FROM commandes ) : afficher les clients (idclient et identifiant) de la table client ou lidclient (les clients) qui nont pas commandé (NOT IN) - le NOT IN : nont pas (ne sont pas dedans)


- 16 : SELECT idClient, identifiant FROM client WHERE idClient IN ( SELECT DISTINCT idClient FROM commandes ) : afficher les clients qui ont commandé (IN) - le IN : ont (sont dedans)


- 16 : DELETE FROM client WHERE idClient NOT IN ( SELECT DISTINCT idClient FROM commandes ) : supprime de la table client ou lidclient des clients qui nont pas commandé


- 17  : SELECT commandes.idClient, dateCommandes FROM client INNER JOIN commandes ON commandes.idClient=client.idClient where dateCommandes = CURRENT_DATE - INTERVAL 1 day : (dans exo : cela donne, au 10/08/21,les id clients qui ont passé commande le 09/08/21)


- 17 a : SELECT commandes.idClient, dateCommandes FROM client INNER JOIN commandes ON commandes.idClient=client.idClient where dateCommandes = CURRENT_DATE - INTERVAL 6 day : (dans exo : cela donne, au 10/08/21,les id clients qui ont passé commande le 04/08/21


- 18  : SELECT SUM(prixArticle*quantiteDispo) as prixTotal FROM articles : affiche la somme du prix article * quantiteDispo (en stock) comme prixTotal de la table articles


- 19 : SELECT * FROM `commandes_articles` WHERE idArticles IN (SELECT DISTINCT idArticles FROM commandes_articles WHERE idArticles = 369) : affiche toutes les colonnes de la table commandes_articles ou lidArticle DANS (affiche idArticle de la table commandes_articles ou idArticle est égal à 369) ////// TROP POUR RIEN 
 

 -  SELECT * FROM `commandes_articles` WHERE idArticles != 123 : affiche toutes les colonnes de commandes_articles ou lidArticle est différent de 123 / donc affichera toutes les commandes qui ne contiennent pas lidArticle 123


  - SELECT * FROM articles where quantiteDispo >= 1 AND en_vente = 'oui'


  - SELECT * FROM `articles` WHERE categories not in (SELECT DISTINCT categories FROM articles where en_vente = 'non') : affiche toutes les colonnes de la table articles ou les categores ne sont pas (affiche categorie de la table articles ou en_vente = non)


- 20 : SELECT commandes.idCommandes, dateCommandes, idClient, GROUP_CONCAT(nomArticle) as article, SUM(articles.prixArticle) as PrixTtcArticles, SUM(articles.prixArticle)/1.20 as PrixHtArticles, SUM(quantite) as nombreArticles FROM commandes INNER JOIN commandes_articles ON commandes.idCommandes=commandes_articles.idCommandes INNER JOIN articles ON commandes_articles.idArticles=articles.idArticles GROUP BY idCommandes

-> on peut noter de cette manière : commandes.idCommandes - cela va chercher directement la colonne dans la table voulue 