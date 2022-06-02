--Authentification/ connexion
mysql -u root --utilisateur ne posséde pas de mot de passe
--mysql -u root -p --utilisateur  posséde pas de mot de passe
--1. lister les bases ded onnées existante
SHOW DATABASES;
--2. Creation de la BD
CREATE DATABASE Ventes;
--3.Utiliser de la bd
use Ventes;
--4. lister les tables de la base de données
-- INTEGER : c'est le type entier
-- NOT NULL : Cette colonne doit toujours contenir une information
-- AUTO_INCREMENT : Dire à MYSQL de fournir de valeurs en incrementant
--                  automatiquement les clés
SHOW TABLES;

--5.Creation de la table clients
CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(70), 
    telephone VARCHAR(20) NOT NULL
);
-- 6.Voir la desciption de la tabe 
-- DESC <nom_table> ou DESCRIBE <nom_table>
DESC clients;

--7. modifier la table en ajoutant une nouvelle colonne
ALTER TABLE clients ADD COLUMN postnom VARCHAR(50);
-- modifier la table en ajoutant une nouvelle colonne apres un eautre
    --ajoute postnom apres presnom
    ALTER TABLE clients MODIFY COLUMN postnom VARCHAR(50) AFTER prenom;

--8.LMD

-- Lister(SELECT) les informations de toutes(*) les colonnes
--       de la table(FROM) client
SELECT* FROM CLIENTS;

--8.1.insertion des données dans clients
INSERT INTO clients(nom, prenom, email, telephone) VALUES ("nouha","menadjlia", "nouha.menadjlia@hotmail.fr", "08659725158"),("RAULIN","Ludovic","lraulin843@gmail.com","0621461941"),
("Perez","Marion","marion.oceane.perez@gmail.com","0786842676");
--8.2.Mise à jour de donnée
UPDATE clients SET telephone="0673460986"WHERE id =2;
UPDATE clients SET postnom= "Tarzon", age=17 WHERE id= 1;