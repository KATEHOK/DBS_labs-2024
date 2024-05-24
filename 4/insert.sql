-- Добавление данных в таблицу shows
INSERT INTO "shows" ("title", "year", "budget", "synopsis") VALUES
('Game of Thrones', 2011, 100000000, 'Fantasy drama television series'),
('Breaking Bad', 2008, 30000000, 'Crime drama television series'),
('Stranger Things', 2016, 80000000, 'Science fiction horror television series');

-- Добавление данных в таблицу actors
INSERT INTO "actors" ("name", "birth", "bio") VALUES
('Emilia Clarke', '1986-10-23', 'Emilia Isobel Euphemia Rose Clarke is an English actress.'),
('Bryan Cranston', '1956-03-07', 'Bryan Lee Cranston is an American actor, director, and producer.'),
('Millie Bobby Brown', '2004-02-19', 'Millie Bobby Brown is an English actress and producer.');

-- Добавление данных в таблицу episodes
INSERT INTO "episodes" ("title", "season", "episode", "date", "show_id") VALUES
('Winter Is Coming', 1, 1, '2011-04-17', 1),
('Pilot', 1, 1, '2008-01-20', 2),
('Chapter One: The Vanishing of Will Byers', 1, 1, '2016-07-15', 3);

-- Добавление данных в таблицу reviews
INSERT INTO "reviews" ("show_id", "reviewer", "text", "rating") VALUES
(1, 'John Doe', 'Great show!', 5),
(2, 'Jane Smith', 'Amazing series!', 5),
(3, 'Alice Johnson', 'Loved it!', 4);

-- Добавление данных в таблицу cast
INSERT INTO "cast" ("actor_id", "show_id", "role") VALUES
(1, 1, 'Daenerys Targaryen'),
(2, 2, 'Walter White'),
(3, 3, 'Eleven');