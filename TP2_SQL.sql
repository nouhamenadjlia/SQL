CREATE DATABASE TP2;
use TP2;
-- creation de la table order:
CREATE TABLE orders(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    typePresta VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    clientId INTEGER,
    FOREIGN KEY(clientId) REFERENCES clients(id) ON DELETE CASCADE ,
    nbDays INTEGER,
    unitPrice INTEGER,
    state VARCHAR(1)
);
--=> Remplire la base de données à travers des insertions
INSERT INTO orders(typePresta, designation, clientId, nbDays, unitPrice, state) VALUES("Formation", "Angular init", 2, 3, 1200, "0"), 
("Formation", "React avancé", 2, 3, 1000, "2"), ("Coaching", "React Techle", 1, 20, 900, "2"), ("Coaching", "Nest.js Techlead", 1, 50, 800, "1"), 
("Coaching", "Angular Techlead", 4, 1200, "0"), ("Coaching", "Nest.js Techlead",2, 600, "1"),
("Coaching", "React Teachead", 4, 1200, "1");

INSERT INTO orders(typePresta, designation) VALUES("Coaching", "React Teachead"), ("Coaching", "Jakarta EE"), ("Coaching", "Angular Techlead");


CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(100) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(70), 
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255),
    zipCode VARCHAR(50),
    city VARCHAR(100), 
    country VARCHAR(100),
    state VARCHAR(1) NOT NULL
);
-- Insertion des clients:
INSERT INTO clients(companyName, firstName, lastName, email, phone, address, zipCode, city, country, state)VALUES("Capgemini", "Fabrice", "Martin",
"martin@mail.com" ,"06 5685 8433", "abc", "xyz", "Nantes", "France", "0"),
("M2I Formation", "Julien", "Lamard","lamard@mail.com", "06 1122 3344", "abc", "xyz", "Paris", " France", "1"),
("ATOS", "David", "zouzou", "david@mail.com","06 05 8 92","abc", "xyz", "Toulouse", "France","1" ),
("OPRA STERIA", "camille", "zdx", "camille@mail.com","06 07 85 23","abc", "xyz", "Bordeaux",  "France", "0" );

--=> Afficher toutes les formations sollicités par le client M2i formation
SELECT * FROM orders WHERE clientId = "2";


SELECT Orders.id, Clients.companyName
FROM Orders
INNER JOIN Clients ON Orders.clientId=clients.id;


--=> Afficher les noms et contacts de tous les clients qui ont sollicité un coaching
SELECT Orders.id, Clients.companyName, Clients.firstName, Clients.lastName, Clients.email, Clients.phone, Clients.address, Clients.zipCode, Clients.city, Clients.country 
FROM orders 
INNER JOIN Clients ON Orders.clientId=clients.id
WHERE orders.typePresta ="Coaching";

--*=> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching pour les accompagnements React.js
SELECT Orders.id, Clients.companyName, Clients.firstName, Clients.lastName, Clients.email, Clients.phone, Clients.address, Clients.zipCode, Clients.city, Clients.country 
FROM orders 
INNER JOIN Clients ON Orders.clientId=clients.id
WHERE orders.designation =" React.js";

--*=> Pour chacune des demandes de formation, afficher le prix UHT et prix TTC en se basant sur le unité Price(TJM) et le nombre
-- de jours de prestation tout en sachant que la TVA est de 20%.
CREATE VIEW v_total AS SELECT ( orders.unitPrice*orders.nbDays) AS "totalTaxeExcluded",
((orders.nbDays*orders.unitPrice) + (orders.nbDays*orders.unitPrice*0.2)) as "totalWithTaxe" , orders.id FROM orders;

--=> Lister toutes les prestations qui sont confirmés et qui vont rapporter plus 30.000€
SELECT orders.typePresta, orders.designation, v_total.totalTaxeExcluded, v_total.totalWithTaxe, state FROM  v_total
INNER JOIN orders ON v_total.id=orders.id
WHERE orders.state = "2" and v_total.totalWithTaxe >=30000;





