-- 1. Создание таблицы "seasons"
CREATE TABLE "seasons" (
    "id" SERIAL PRIMARY KEY,
    "title" TEXT,
    "season" INTEGER,
    "date" DATE,
    "show_id" INTEGER REFERENCES "shows"("id")
);

-- 2. Добавление данных в таблицу "seasons" на основе данных из таблицы "episodes"
INSERT INTO "seasons" ("title", "season", "date", "show_id")
SELECT DISTINCT NULL AS "title", "season", MIN("date") AS "date", "show_id"
FROM "episodes"
GROUP BY "season", "show_id";

-- 3. Изменение структуры таблицы "episodes"
ALTER TABLE "episodes"
DROP COLUMN "season",
DROP COLUMN "show_id",
ADD COLUMN "season_id" INTEGER REFERENCES "seasons"("id");
