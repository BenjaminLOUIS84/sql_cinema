--REQUETES SQL EXERCICE CINEMA--

--a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 

SELECT f.id_film, f.titre, f.annee_sortie, SEC_TO_TIME(f.duree*60) AS Durée, p.prenom, p.nom    --La fonction SEC_TO_TIME() permet d’afficher des secondes dans un format : “HH:MM:SS” (heures, minutes et secondes).
FROM film f                                                                                     --FROM permet de cibler une table --AS est un alias utile pour renomer une colonne
INNER JOIN realisateur r                                                                        --NNER JOIN est un type de jointures très communes pour lier plusieurs tables entre-elles.
ON r.id_realisateur = f.id_realisateur                                                          --ON Remplace WHERE et représente une condition pour filtrer l'affichage des données
INNER JOIN personne p                                                                           --AND Permet d'ajouter une 2ème condition mais il suffit de réutiliser un second INNER JOIN ON
ON p.id_personne = r.id_personne 
LIMIT 1                                                                                         --LIMIT permet d'afficher la première référence

--b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

SELECT f.titre, SEC_TO_TIME(f.duree*60) AS Durée                                                --SELECT Permet de retourner des enregistrements dans un tableau de résultat. Cette commande peut sélectionner une ou plusieurs colonnes d’une table.
FROM film f                                                                                     
WHERE f.duree > 135
ORDER BY Durée DESC                                                                             --ORDER BY Pour afficher par ordre décroissant        

--c. Liste des films d’un réalisateur (en précisant l’année de sortie) 

SELECT f.titre, f.annee_sortie, p.nom, p.prenom
FROM film f
INNER JOIN realisateur r
ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p
ON r.id_realisateur = p.id_personne
AND r.id_realisateur = 1

--d. Nombre de films par genre (classés dans l’ordre décroissant)

SELECT g.type, COUNT(c.id_film) AS Nombre_film                                                  --La fonction COUNT() permet de compter le nombre de films, il est d'usage de compter les id plutôt que les noms
FROM genre_film g
INNER JOIN classer c
ON g.genre_film = c.genre_film
GROUP BY g.type                                                                                 --Lorsqu'il y a une fonction dans la commande SELECT et deux tables il faut faire une jointure avec INNER JOIN 
ORDER BY Nombre_film DESC                                                                       --et il faut également utiliser un GROUP BY, il est d'usage de grouper les id plutôt que les noms                                

--e. Nombre de films par réalisateur (classés dans l’ordre décroissant)

SELECT p.nom, p.prenom, COUNT(f.id_film) AS Nombre_film
FROM realisateur r
INNER JOIN film f
ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p
ON r.id_personne = p.id_personne
GROUP BY r.id_realisateur
ORDER BY Nombre_film DESC

--f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

SELECT c.id_film, p.nom, p.prenom, p.sexe
FROM casting c
INNER JOIN acteur a
ON a.id_acteur = c.id_acteur
INNER JOIN personne p
ON p.id_personne = a.id_personne
AND c.id_film = 1

--g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

SELECT c.id_acteur, r.nom, r.prenom, r.pseudo, f.titre, f.annee_sortie
FROM casting c
INNER JOIN role_acteur r
ON r.role_acteur = c.role_acteur
INNER JOIN film f
ON f.id_film = c.id_film
AND c.id_acteur = 2
ORDER BY f.annee_sortie DESC

--h. Liste des personnes qui sont à la fois acteurs et réalisateurs

SELECT p.prenom, p.nom
FROM personne p
INNER JOIN acteur a
ON a.id_personne = p.id_personne
INNER JOIN realisateur r
ON r.id_personne = p.id_personne

--i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

--j. Nombre d’hommes et de femmes parmi les acteurs

--k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

--l. Acteurs ayant joué dans 3 films ou plus


--INFORMATIONS--(--Pour Peupler la Base de données--)

INSERT INTO film (id_film, titre, annee_sortie, duree, synopsis, note, affiche, id_realisateur) VALUES
(1, 'Star Wars Vol1', 1999, 136, 'Dans une galaxie une entre les Chevaliers Jedi et les Seigneurs noirs des Sith, personnes sensibles à la Force.', 6.2, 'film1.jpg', 1),
(2, 'Indiana Jones Vol1', 1981, 116, 'Pérou, 1936. Le professeur Henry Walton Jones Jr (dit « Indiana », ou « Indy »), un éminent archéologue américain et expert en occultisme, est sur le point de mettre la main sur une idole Chachapoyan.', 7.7, 'film2.jpg', 2),
(3, 'Batman Vol1', 1981, 121, 'Enfant, le milliardaire Bruce Wayne voit ses parents assassinés par un voleur des rues, qui en voulait au collier de perles de sa mère.', 7.1, 'film3.jpg', 3),
(4, 'X-Men Vol1', 2000, 104, '1944, dans un camp de concentration. Séparé par la force de ses parents, le jeune Erik Magnus Lehnsherr se découvre ses pouvoirs sous le coup de la colère : il peut contrôler les métaux.', 6.5, 'film4.jpg', 4),
(5, 'Grand Torino', 2008, 116, 'Walt Kowalski, vétéran de la guerre de Corée, raciste et irascible, vient de perdre sa femme. Une nuit, il surprend Thao, un de ses jeunes voisins Hmong, en train de voler sa Ford Gran Torino de 1972.', 7.7, 'film5.jpg', 5),
(6, 'Mad Max', 1979, 85, 'Un criminel, Montazano, membre du gang de motards « Aigles de la route » , fuit en tuant un agent de la police routière.', 6.8, 'film6.jpg', 6),
(7, 'Légende dautomne', 1994, 133, 'Dans le Montana dans les années 1960, un vieil indien raconte les secrets de la famille Ludlow.', 8.3, 'film7.jpg', 7),
(8, 'Braveheart', 1995, 178, 'Au XIIIe siècle, le roi Edouard Ier sempare du trône dEcosse et instaure un régime répressif.', 8, 'film8.jpg', 8),
(9, 'Star Wars Vol4', 1977, 121, 'Dans une galaxie une guerre entre les Chevaliers Jedi et les Seigneurs noirs des Sith, personnes sensibles à la Force.', 7.7, 'film9.jpg', 1),
(10, 'La liste de Schindler', 1933, 195, 'En 1939, les Allemands installés en Pologne, regroupent les juifs dans des ghettos dans le but de les utiliser comme des esclaves. ', 8.1, 'film10.jpg', 2),
(11, 'Dumbo', 2019, 72, '1919, dans le Missouri. Holt Farrier, ancien cavalier de cirque, mancho, revient au cirque Medici Brothers, dirigé par Max Medici, après la Première Guerre mondiale. ', 5.8, 'film11.jpg', 3),
(12, 'Bullet Train', 2022, 126, 'Coccinelle est un assassin malchanceux et particulièrement déterminé à accomplir sa nouvelle mission paisiblement après que la plupart des ses missions aient déraillé.', 6.5, 'film12.jpg', 9),
(13, 'Once Upon a time...', 2019, 181,'En 1969, la star de télévision Rick Dalton et le cascadeur Cliff Booth, sa doublure de longue date, poursuivent leurs carrières au sein d’une industrie qui a changé. ', 7.2, 'film13.jpg', 10),
(14, 'Inglourious Basterds', 2009, 153, 'Dans la France occupée de 1940, Shosanna Dreyfus assiste à la mort de sa famille tombée entre les mains du colonel nazi Hans Landa.', 7.4, 'film14.jpg', 10);

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'personne' ('id_personne', 'nom', 'prenom', 'sexe', 'date_naissance') VALUES
(1, 'Lucas', 'George', 'Masculin', '1944-05-14'),
(2, 'Spielberg', 'Steven', 'Masculin', '1946-12-18'),
(3, 'Burton', 'Tim', 'Masculin', '1958-08-25'),
(4, 'Singer', 'Bryan', 'Masculin', '1965-09-17'),
(5, 'McGregor', 'Ewan', 'Masculin', '1971-03-31' ),
(6, 'Neeson', 'Liam', 'Masculin', '1952-06-07'),
(7, 'Portmann', 'Nathalie', 'Feminin', '1981-06-09'),
(8, 'Ford', 'Harisson', 'Masculin', '1942-07-13'),
(9, 'Allen', 'Karen', 'Feminin', '1951-10-05'),
(10, 'Denholm', 'Eliott', 'Masculin', '1922-05-31'),
(11, 'Keaton', 'Mickael', 'Masculin', '1951-09-05'),
(12, 'Nicholson', 'Jack', 'Masculin', '1937-04-22'),
(13, 'Basinger', 'Kim', 'Feminin', '1953-12-08'),
(14, 'Stewart', 'Patrick', 'Masculin', '1940-07-13'),
(15, 'Jackman', 'Hugh', 'Masculin', '1968-10-12'),
(16, 'McKellen', 'Ian', 'Masculin', '1939-05-25'),
(17, 'Eastwood', 'Clint', 'Masculin', '1930-05-31'),
(18, 'Gibson', 'Mel', 'Masculin', '1956-01-03'),
(19, 'Miller', 'George', 'Masculin', '1945-03-03'),
(20, 'Zwick', 'Edward', 'Masculin', '1952-10-08'),
(21, 'Pitt', 'Brad', 'Masculin', '1963-12-18'),
(22, 'Hopkins', 'Anthony', 'Masculin', '1937-12-31'),
(23, 'Leitch', 'David', 'Maculin', '1975-11-16'),
(24, 'Tarantino', 'Qunetin', 'Masculin','1963-03-27');

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'realisateur' ('id_realisateur', 'id_personne') VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 17),
(6, 19),
(7, 20),
(8, 18),
(9, 23),
(10, 24);

INSERT INTO 'acteur' ('id_acteur', 'id_personne') VALUES
(1, 5),
(2, 6),
(3, 7),
(4, 8),
(5, 9),
(6, 10),
(7, 11),
(8, 12),
(9, 13),
(10, 14),
(11, 15),
(12, 16),
(13, 17),
(14, 18),
(15, 21),
(16, 22);


--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'casting' ('id_acteur', 'role_acteur', 'id_film') VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4),
(12, 12, 4),
(13, 13, 5),
(14, 14, 6),
(15, 15, 7),
(16, 16, 7),
(14, 17, 8),
(4, 18, 9),
(2, 19, 10),
(7, 20, 11),
(15, 21, 12),
(15, 22, 13),
(15, 23, 14);

INSERT INTO 'classer' ('id_film', 'genre_film') VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 1),
(5, 2),
(6, 6),
(7, 2),
(8, 2),
(9, 1),
(10, 2),
(11, 1),
(12, 4),
(13, 4),
(14, 2);

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'genre_film' ('genre_film', 'type') VALUES
(1, 'Science-Fiction'),
(2, 'Drame'),
(3, 'Aventure'),
(4, 'Comédie'),
(5, 'Horreur'),
(6, 'Action');

INSERT INTO 'role_acteur' ('role_acteur', 'nom', 'prenom', 'pseudo') VALUES
(1, 'Kenobi', 'Obi-Wan', NULL),
(2, 'Jinn', 'Qui-Gon', NULL),
(3, 'Amidala', 'Padme', NULL),
(4, 'Jones', 'Henry','Indy'),
(5, 'Ravenwood', 'Marion', NULL),
(6, 'Brody', 'Marcus', NULL),
(7, 'Wayne', 'Bruce', 'Batman'),
(8,  NULL, NULL, 'Joker'),
(9, 'Vale', 'Vicki', NULL),
(10, 'Xavier', 'Charles', 'Professeur'),
(11, NULL, NULL, 'Logan'),
(12, 'Lensherr', 'Eric', 'Magnetto'),
(13, 'Kowalski', 'Walt', NULL),
(14, 'Rockatanski', 'Max', 'Mas Max'),
(15, 'Ludlow', 'Tristan', NULL),
(16, 'Ludlow', 'William', NULL ),
(17, 'Wallace', 'William', NULL),
(18, 'Solo', 'Han' NULL),
(19, 'Schindler', 'Oskar', NULL),
(20, 'Vandevere', 'V.A.', NULL),
(21, NULL, NULL, 'Coccinelle'),
(22, 'Booth', 'Cliff', NULL),
(23, 'Raine', 'Aldo', NULL);


--//////////////////////////////////////////////////////////////////////////////////////--
