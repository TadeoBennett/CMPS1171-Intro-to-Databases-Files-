DROP TABLE album_tracks CASCADE;
DROP TABLE albums;
DROP TABLE tracks;

CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    title text NOT NULL,
    year_released text NOT NULL,
    created_on timestamp(0) with TIME ZONE NOT NULL DEFAULT NOW()
); 


CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    name text NOT NULL,
    length text NOT NULL,
    created_on timestamp(0) with TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE album_tracks(
    album_tracks_id serial PRIMARY KEY,
    album_id INT REFERENCES albums(album_id),
    track_id INT REFERENCES tracks(track_id)
);


INSERT INTO albums(title, year_released)
VALUES
('Dawn FM', '2002'),
('Bright Side', '2021'),
('Thorns', '2022'),
('Breathe', '2018'),
('Life On Earth', '2015'),
('Humble Quest', '2019'),
('Mainstream Sellout', '2017'),
('Esquemas', '2018'),
('Vinyl Days', '2010'),
('Honestly, Nevermind', '2009');

INSERT INTO tracks(name, length)
VALUES
('Gasoline', '4'),
('Lagoon', '3'),
('As the World Burns', '2'),
('Make It Right', '3'),
('Young Blood Blues', '3'),
('The Furthest Thing', '2'),
('Born With Horns', '2'),
('Buen Dia', '3'),
('In My Lifetime', '5'),
('Currents', '3');

INSERT INTO album_tracks(album_id, track_id)
VALUES
(1, 2),
(1, 1),
(2, 3),
(2, 4),
(1, 4),
(4, 2),
(5, 5),
(6, 6),
(6, 7),
(7, 8),
(8, 8),
(9, 9),
(10, 10),
(3, 8),
(4, 7);


-- //query for question 5
SELECT A.title AS "album title", A.year_released AS "release year", T.name AS "track name"
FROM albums as A
INNER JOIN album_tracks AS ALT
ON A.album_id = ALT.album_id
INNER JOIN Tracks AS T
ON ALT.track_id = T.track_id
ORDER BY A.title;


-- query for question 6
SELECT T.name as "track name", A.title AS "album title"
FROM tracks AS T
INNER JOIN album_tracks AS ALT
ON T.track_id = ALT.track_id
INNER JOIN albums AS A
ON ALT.album_id = A.album_id
GROUP BY T.name, A.title
ORDER BY T.name;


-- query for question 7 
SELECT A.title AS "album title", count(T.name) AS "track count"
FROM albums AS A
INNER JOIN album_tracks AS ALT
ON A.album_id = ALT.album_id
INNER JOIN tracks AS T
ON ALT.track_id = T.track_id
GROUP BY A.title;


-- query for question 8
SELECT T.name AS "track name", count(A.title) AS "tlbum count"
FROM albums AS A
INNER JOIN album_tracks AS ALT
ON A.album_id = ALT.album_id
INNER JOIN tracks AS T
ON ALT.track_id = T.track_id
GROUP BY T.name;




