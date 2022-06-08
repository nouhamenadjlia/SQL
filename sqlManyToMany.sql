CREATE DATABASE IF NOT EXISTS sales_poe_many2many;

use sales_poe_many2many;

CREATE TABLE IF NOT EXISTS clients(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(20) NOT NULL,
  prenom VARCHAR(20) NOT NULL,
  adresse_email VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE IF NOT EXISTS produits(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  designation VARCHAR(50) NOT NULL,
  prixUHT FLOAT NOT NULL,
  prixTTC FLOAT GENERATED ALWAYS AS (prixUHT*1.2) STORED,
  quantite_stock INT
);


CREATE TABLE IF NOT EXISTS achats(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_client INT,
  id_produit INT NOT NULL,
  FOREIGN KEY(id_client) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY(id_produit) REFERENCES produits(id) ON UPDATE CASCADE ON DELETE RESTRICT
);
-- [client]->[achats]<-[produits]
SELECT * FROM clients JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;
SELECT CONCAT(clients.prenom," ",clients.nom) as client, produits.designation FROM clients 
JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;
