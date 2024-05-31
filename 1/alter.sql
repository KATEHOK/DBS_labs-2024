-- Создание таблицы Seasons
CREATE TABLE Seasons (
    SeasonID INTEGER PRIMARY KEY,
    Title TEXT,
    SeasonNumber INTEGER,
    AirDate DATE,
    ShowID INTEGER,
    FOREIGN KEY (ShowID) REFERENCES Shows (ShowID)
);

-- Удаляем старую таблицу с эпизодами (так как она пустая - данные не теряются)
DROP TABLE Episodes;

-- Создание таблицы Episodes с новой структурой
CREATE TABLE Episodes (
    EpisodeID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    EpisodeNumber INTEGER,
    AirDate DATE,
    SeasonID INTEGER,
    FOREIGN KEY (SeasonID) REFERENCES Seasons (SeasonID)
);

-- Добавить новую колонку в таблицу Actors
ALTER TABLE Actors
ADD COLUMN Addition TEXT;