-- Создание таблицы Shows
CREATE TABLE Shows (
    ShowID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Year INTEGER,
    Budget REAL,
    Synopsis TEXT
);

-- Создание таблицы Actors
CREATE TABLE Actors (
    ActorID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    DateOfBirth DATE,
    Biography TEXT
);

-- Создание таблицы Episodes
CREATE TABLE Episodes (
    EpisodeID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    SeasonNumber INTEGER,
    EpisodeNumber INTEGER,
    AirDate DATE,
    ShowID INTEGER,
    FOREIGN KEY (ShowID) REFERENCES Shows (ShowID)
);

-- Создание таблицы Reviews
CREATE TABLE Reviews (
    ReviewID INTEGER PRIMARY KEY,
    ShowID INTEGER,
    Reviewer TEXT NOT NULL,
    ReviewText TEXT,
    Rating INTEGER,
    FOREIGN KEY (ShowID) REFERENCES Shows (ShowID)
);

-- Создание таблицы Cast
CREATE TABLE Cast (
    ActorID INTEGER,
    ShowID INTEGER,
    Role TEXT,
    PRIMARY KEY (ActorID, ShowID),
    FOREIGN KEY (ActorID) REFERENCES Actors (ActorID),
    FOREIGN KEY (ShowID) REFERENCES Shows (ShowID)
);