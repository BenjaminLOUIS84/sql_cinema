--REQUETES SQL EXERCICE CINEMA--

--a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 

--b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

--c. Liste des films d’un réalisateur (en précisant l’année de sortie) 

--d. Nombre de films par genre (classés dans l’ordre décroissant)

--e. Nombre de films par réalisateur (classés dans l’ordre décroissant)

--f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

--g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

--h. Liste des personnes qui sont à la fois acteurs et réalisateurs

--i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

--j. Nombre d’hommes et de femmes parmi les acteurs

--k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

--l. Acteurs ayant joué dans 3 films ou plus


--INFORMATIONS--(--Pour Peupler la Base de données--)

INSERT INTO 'film' ('id_film', 'titre', 'annee_sortie', 'duree','synopsis', 'note','affiche', 'id_realisateur') VALUES
(1, 'Star Wars Vol1', 1999, 133, NULL, NULL, '/images/film1.jpg', 1),
(2, 'Indiana Jones Vol1', 1981, 116, NULL, NULL, '/images/film2.jpg', 2),
(3, 'Batman Vol1', 1981, 206, NULL, NULL, '/images/film3.jpg', 3),
(4, 'X-Men Vol1', 2000, 105, NULL, NULL, '/images/film4.jpg', 4),
(5, 'Grand Torino', 2008, 156, NULL, NULL, '/images/film5.jpg', 5),
(6, 'Mad Max', 1979, 133, NULL, NULL, '/images/film6.jpg', 6),
(7, 'Légende dautomne', 1994, 220, NULL, NULL, '/images/film7.jpg', 7),
(8, 'Braveheart', 1995, 257, NULL, NULL, '/images/film8.jpg', 8),
(9, 'Star Wars Vol4', 1977, 201, NULL, NULL, '/images/film9.jpg', 1),
(10, 'La liste de Schindler', 1933, 315, NULL, NULL, '/images/film10.jpg', 2),
(11, 'Dumbo', 2019, 112, NULL, NULL, '/images/film11.jpg', 3),
(12, 'Bullet Train', 2022, 206, NULL, NULL, '/images/film12.jpg', 9),
(13, 'Once Upon a time...', 2019, 241, NULL, NULL, '/images/film13.jpg', 10),
(14, 'Inglourious Basterds', 2009, 233, NULL, NULL, '/images/film14.jpg', 10);

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
