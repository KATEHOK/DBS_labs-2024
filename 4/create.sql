-- Создание базы данных
CREATE DATABASE shows;

-- Подключаемся к БД shows

-- Создание таблицы shows
CREATE TABLE "shows" (
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "year" INTEGER,
    "budget" REAL,
    "synopsis" TEXT
);

-- Создание таблицы actors
CREATE TABLE "actors" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "birth" DATE,
    "bio" TEXT
);

-- Создание таблицы episodes
CREATE TABLE "episodes" (
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "season" INTEGER,
    "episode" INTEGER,
    "date" DATE,
    "show_id" INTEGER REFERENCES "shows"("id")
);

-- Создание таблицы reviews
CREATE TABLE "reviews" (
    "id" SERIAL PRIMARY KEY,
    "show_id" INTEGER REFERENCES "shows"("id"),
    "reviewer" TEXT NOT NULL,
    "text" TEXT,
    "rating" INTEGER
);

-- Создание таблицы "cast"
CREATE TABLE "cast" (
    "actor_id" INTEGER REFERENCES "actors"("id"),
    "show_id" INTEGER REFERENCES "shows"("id"),
    "role" TEXT,
    PRIMARY KEY ("actor_id", "show_id")
);