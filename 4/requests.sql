-- 1. Какие актеры снялись в сериале "Game of Thrones"?
SELECT "actors"."name"
FROM "actors"
INNER JOIN "cast" ON "actors"."id" = "cast"."actor_id"
INNER JOIN "shows" ON "cast"."show_id" = "shows"."id"
WHERE "shows"."title" = 'Game of Thrones';

-- 2. Какие сериалы были выпущены после 2010 года и их бюджеты?
SELECT "title", "budget"
FROM "shows"
WHERE "year" > 2010;

-- 3. Какие отзывы получили сериалы с рейтингом выше 4?
SELECT "shows"."title", "reviews"."reviewer", "reviews"."text", "reviews"."rating"
FROM "reviews"
INNER JOIN "shows" ON "reviews"."show_id" = "shows"."id"
WHERE "reviews"."rating" > 4;

-- 4. Какова общая сумма бюджета всех сериалов?
SELECT SUM("budget") AS "totalbudget"
FROM "shows";

-- 5. Какие актеры родились после 1980 года?
SELECT "name"
FROM "actors"
WHERE "birth" > '1980-01-01';

-- 6. Какие сериалы имели эпизоды, вышедшие после 2015 года?
SELECT DISTINCT "shows"."title"
FROM "shows"
INNER JOIN "episodes" ON "shows"."id" = "episodes"."show_id"
WHERE "episodes"."date" > '2015-01-01';

-- 7. Какие актеры сыграли роли в сериале с наивысшим бюджетом?
SELECT "actors"."name", "cast"."role"
FROM "actors"
INNER JOIN "cast" ON "actors"."id" = "cast"."actor_id"
INNER JOIN "shows" ON "cast"."show_id" = "shows"."id"
WHERE "shows"."budget" = (SELECT MAX("budget") FROM "shows");

-- 8. Сколько эпизодов было в каждом сериале?
SELECT "shows"."title", COUNT("episodes"."id") AS "episodecount"
FROM "shows"
INNER JOIN "episodes" ON "shows"."id" = "episodes"."show_id"
GROUP BY "shows"."title";