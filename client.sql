--Authentification/ connexion
mysql -u root --utilisateur ne posséde pas de mot de passe
--mysql -u root -p --utilisateur  posséde pas de mot de passe
-- lister les bases ded onnées existante
SHOW DATABASES;
-- Creation de la BD
CREATE DATABASE Ventes;
--Utiliser de la bd
use Ventes;
---- lister les tables de la base de données
--AUTO_INCREMENT: 
--PRIMARY KEY: marque la colonne comme étant la clé primaire
SHOW TABLES;
--Creation de la table clients
CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    prenom VARCHAR (50) NOT NULL,
    email VARCHAR (70), 
    telephone VARCHAR(20) NOT NULL
);

