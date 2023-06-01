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

INSERT INTO 'film' ('id_film', 'titre', 'date_sortie', 'duree','synopsis', 'note','affiche', 'id_realisateur') VALUES
(1, 'Star Wars Vol1', '1999-10-13', 133, NULL, NULL, 'indisponible.jpg', 1),
(2, 'Indiana Jones Vol1', '1981-09-16', 116, NULL, NULL, 'indisponible.jpg', 2),
(3, 'Batman Vol1', '1981-09-13', 206, NULL, NULL, 'indisponible.jpg', 3),
(4, 'X-Men Vol1', '2000-08-16', 105, NULL, NULL, 'indisponible.jpg', 4);

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'personne' ('id_personne', 'nom', 'prenom', 'sexe', 'date_naissance') VALUES
(1, 'Lucas', 'Georges', 'Masculin', '1944-05-14'),
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
(16, 'McKellen', 'Ian', 'Masculin', '1939-05-25');

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'realisateur' ('id_realisateur', 'id_personne') VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

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
(12, 16);

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
(12, 12, 4);

INSERT INTO 'classer' ('genre_film', 'id_film') VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 1);

--//////////////////////////////////////////////////////////////////////////////////////--

INSERT INTO 'genre_film' ('genre_film', 'type') VALUES
(1, 'Science-Fiction'),
(2, 'Action'),
(3, 'Aventure'),
(4, 'Comédie'),
(5, 'Horreur');

INSERT INTO 'role_acteur' ('role_acteur', 'nom', 'prenom', 'pseudo') VALUES
(1, 'Kenobi', 'Obi-Wan'),
(2, 'Jinn', 'Qui-Gon'),
(3, 'Amidala', 'Padme'),
(4, 'Jones', 'Indy'),
(5, 'Ravenwood', 'Marion'),
(6, 'Brody', 'Marcus'),
(7, 'Wayne', 'Bruce', 'Batman'),
(8,  NULL, NULL, 'Joker'),
(9, 'Vale', 'Vicki'),
(10, 'Xavier', 'Charles'),
(11, NULL, NULL, 'Logan'),
(12, 'Lensherr', 'Eric', 'Magnetto');

--//////////////////////////////////////////////////////////////////////////////////////--
