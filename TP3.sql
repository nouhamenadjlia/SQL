CREATE IF NOT EXISTS DATABASE instagram;
use instagram;
CREATE IF NOT EXISTS TABLE user(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    adresse_email VARCHAR(50) NOT NULL UNIQUE,
    avatar VARCHAR(30),
    user_name VARCHAR(20) NOT NULL
);
INSERT INTO user(nom, prenom, adresse_email, avatar,user_name)VALUES("Seth","Stammler","sstammler0@craigslist.org","https://robohash.org/iddistinctiofuga.png?size=50x50&set=set1", "Lee_Orro"),
("Lee","Orro","lorro1@unesco.org","https://robohash.org/namminusrecusandae.png?size=50x50&set=set1","Cassey_Hollyland"),
("Cassey","Hollyland","chollyland2@xrea.com","https://robohash.org/voluptatemvelitqui.png?size=50x50&set=set1","Cassey_Hollyland"),
("Brigit","Matthius","bmatthius3@csmonitor.com","https://robohash.org/ipsasedvoluptate.png?size=50x50&set=set1","Brigit_Matthius"),
("Tybalt","Kornilov","tkornilov4@fema.gov","https://robohash.org/repellendusutid.png?size=50x50&set=set1", "Tybalt_Kornilov"),
("Giraldo","Duggon","gduggon5@youku.com","https://robohash.org/magnisitet.png?size=50x50&set=set1","Giraldo_Duggon"),
("Evelin","Sylvester","esylvester6@icq.com","https://robohash.org/abmolestiaererum.png?size=50x50&set=set1","Evelin_Sylvester"),
("Fonzie,Sains,fsains7@trellian.com,https://robohash.org/quamhicet.png?size=50x50&set=set1","Fonzie_Sains"),
("Sherill","Tomasino","stomasino8@meetup.com","https://robohash.org/namipsumreiciendis.png?size=50x50&set=set1","Sherill_Tomasino"),
("Nikolaus","Tigwell","ntigwell9@ocn.ne.jp","https://robohash.org/fugiatblanditiissuscipit.png?size=50x50&set=set1","Nikolaus_Tigwell");

CREATE table Photos(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   url_photo varchar(30) not null,
   nbLike INTEGER,
   user_id INTEGER NOT NULL
   Foreign key (user_id) references user(id) ON DELETE SET NULL ON UPDATE CASCADE 
);
INSERT INTO photos(url_photo, nbLike,user_id) VALUES('http://washi', 5, 1),('http://referer', 10, 2),('http://irs.gov', 0, 1),
('https://amaz', 56, 1),('https://scr', 1, 6),('https://u', 3, 3),('https://pu', 1, 4),('http://answ', 2, 5);

CREATE table Commentaires(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Commentaire VARCHAR(255),
  id_user INTEGER,
  id_photos INTEGER,
  Foreign key (id_user) references user(id) ON DELETE SET NULL ON UPDATE CASCADE,
  Foreign key (id_photos) references photos(id) ON DELETE SET NULL ON UPDATE CASCADE 
);

insert into commentaires (Commentaire, id_user , id_photos) values ('Lamprotornis nitens', 1, 3),('Propithecus verreauxi', 9, 2),
('Taxidea taxus', 9, 4),('Francolinus coqui', 10, 4),('Pycnonotus barbatus', 6, 5),('Sauromalus obesus', 10, 3);

CREATE table likes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state INTEGER(1),--0 =>dislike ,1=>like
    id_user INTEGER,
    id_photos INTEGER,
    id_commentaire INTEGER,
    Foreign key (id_user) references user(id) ON DELETE SET NULL ON UPDATE CASCADE,
    Foreign key (id_photos) references photos(id) ON DELETE SET NULL ON UPDATE CASCADE,
    Foreign key (id_commentaire) references Commentaires(id) ON DELETE SET NULL ON UPDATE CASCADE  
);

insert into likes (state, id_user,id_photos, id_commentaire) values (1,1, 1, 7),
(1,1, 2, 8),(0,10, 3, 9),(1,9, 4, 10),( 1,8, 5, 11),(0,5, 6, 12);
 
 --4.Pour tous les commentaires, montrer le contenu et le username de l'auteur/
SELECT  user_name, commentaire FROM user
    JOIN commentaires ON commentaires.id_user = user.id;
    
--5.Pour chaque commentaire, afficher son contenu et l'url de la photo à laquel le commentaire a été ajouté
SELECT commentaire, url_photo from Commentaires 
 JOIN photos ON Commentaires.id_photos=photos.id;

--6-Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur:
SELECT url_photo, user_name FROM photos
JOIN user ON  photos.user_id = user.id;

--7.Trouver tous les commentaires pour la photo d'id 3, avec le username de l'utilisateur qui a commenté
SELECT user.user_name, commentaires.Commentaire FROM commentaires 
    JOIN user ON commentaires.id_user = user.id
    JOIN photos ON commentaires.id_photos= photos.id
    WHERE photos.id = 3;

--8.Trouver tous les url des photos ainsi que tous les commentaire qui ont été posté par l'auteur de la photo
SELECT photos.url_photo,commentaires.Commentaire FROM commentaires 
    JOIN photos ON Commentaires.id_photos = photos.id
    WHERE photos.user_id = commentaires.id_user;

--9.A l'exercice précedent afficher aussi le nom de l'utilisateur qui a commenté ses propres photos
SELECT  user.user_name,photos.url_photo,commentaires.Commentaire FROM commentaires 
    JOIN photos ON Commentaires.id_photos = photos.id
    JOIN user ON commentaires.id_user = user.id
    WHERE photos.user_id = commentaires.id_user;
    
--10.Le nombre de likes pour la photo d’ID 4
SELECT COUNT(*) AS "nombreDeLike" FROM likes 
JOIN photos ON  likes.id_photos = photos.id
WHERE photos.id = 4 AND state = 1;