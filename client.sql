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
-- Voir la desciption de la tabe 
-- DESC <nom_table> ou DESCRIBE <nom_table>
DESC clients;

