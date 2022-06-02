--Créer une base de données appelée sales
CREATE DATABASE sales;
use sales;
--# LDD## 
--Créer une table appeléetelephonesavec les colonnessuivantes :
--*=>name:chaîne de caractèresqui représentele modèle du téléphone*=>manufacturer:chaîne de caractèresquireprésente le fabricant
--*=>price:  unnombrequi représente le prixUHT
--*=>units_sold:nombrequi représentent laquantité vendue
CREATE TABLE telephones(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    price FLOAT, 
    unit_solds INTEGER NOT NULL
);
   
INSERT INTO telephones(name, manufacturer, price, unit_solds)
    values("N1280","Nokia",199,1925),
    ("iphone4","Apple",399,9436),
    ("GalaxyS6","Samsung",299,2359),
    ("S5620Monte","Samsung",250,2385),
    ("N8","Nokia",150,7543),
    ("Droid","Motorola",150,8395),
    ("Iphone13ProMax","Apple",1300,12849),
    ("GalaxyNote20","Samsung",1100,10353);
--=> Ecrire une requête pour liste tous les modèles de téléphones
SELECT name FROM telephones;
--=> Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphones dont le prix est supérieur à 200€
SELECT name, manufacturer FROM telephones WHERE price >200;

--=> Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphones dont le prix est varie entre 150 et 200€

SELECT name, manufacturer FROM telephones WHERE 150 < price AND price < 200
--=> Lister tous les téléphones de marque samsung et Apple
SELECT * FROM telephones WHERE manufacturer = "Apple" OR manufacturer ="samsung";

