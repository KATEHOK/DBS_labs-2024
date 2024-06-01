-- Удаляем старую таблицу с актерами (так как она пустая - данные не теряются)
DROP TABLE Actors;

-- Создание таблицы Actors
CREATE TABLE Actors (
    ActorID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    DateOfBirth DATE,
    Biography TEXT,
    IsForeignAgent BOOLEAN,
    WasForeignAgent INTEGER
);