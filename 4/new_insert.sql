-- Добавление данных о сериалах в таблицу "shows"
INSERT INTO "shows" ("title") VALUES
    ('Game of Thrones'),
    ('Breaking Bad'),
    ('Stranger Things'),
    ('Friends'),
    ('The Mandalorian');

-- Добавление данных о сезонах сериалов в таблицу "seasons"
-- Game of Thrones
INSERT INTO "seasons" ("show_id", "season", "date") VALUES
    (1, 1, '2011-04-17'),
    (1, 2, '2012-04-01'),
    (1, 3, '2013-03-31');

-- Breaking Bad
INSERT INTO "seasons" ("show_id", "season", "date") VALUES
    (2, 1, '2008-01-20'),
    (2, 2, '2009-03-08'),
    (2, 3, '2010-03-21');

-- Stranger Things
INSERT INTO "seasons" ("show_id", "season", "date") VALUES
    (3, 1, '2016-07-15'),
    (3, 2, '2017-10-27'),
    (3, 3, '2019-07-04');

-- Friends
INSERT INTO "seasons" ("show_id", "season", "date") VALUES
    (4, 1, '1994-09-22'),
    (4, 2, '1995-09-21'),
    (4, 3, '1996-09-19');

-- The Mandalorian
INSERT INTO "seasons" ("show_id", "season", "date") VALUES
    (5, 1, '2019-11-12');
