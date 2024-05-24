-- Добавление данных для сериала "Game of Thrones"
INSERT INTO Shows (Title, Year, Budget, Synopsis) 
VALUES ('Game of Thrones', 2011, 10000000, 'A fantasy drama set in the fictional continents of Westeros and Essos.');

-- Добавление данных для сериала "Friends"
INSERT INTO Shows (Title, Year, Budget, Synopsis) 
VALUES ('Friends', 1994, 5000000, 'A sitcom about a group of friends living in New York City.');

-- Добавление данных для сериала "Breaking Bad"
INSERT INTO Shows (Title, Year, Budget, Synopsis) 
VALUES ('Breaking Bad', 2008, 3000000, 'A high school chemistry teacher turned methamphetamine manufacturer.');

-- Добавление данных об актерах
INSERT INTO Actors (Name, DateOfBirth, Biography) 
VALUES ('Kit Harington', '1986-12-26', 'Christopher Catesby Harington is an English actor.');

INSERT INTO Actors (Name, DateOfBirth, Biography) 
VALUES ('Jennifer Aniston', '1969-02-11', 'Jennifer Joanna Aniston is an American actress.');

INSERT INTO Actors (Name, DateOfBirth, Biography) 
VALUES ('Bryan Cranston', '1956-03-07', 'Bryan Lee Cranston is an American actor.');

-- Добавление данных об эпизодах
INSERT INTO Episodes (Title, SeasonNumber, EpisodeNumber, AirDate, ShowID) 
VALUES ('Winter Is Coming', 1, 1, '2011-04-17', 1);

INSERT INTO Episodes (Title, SeasonNumber, EpisodeNumber, AirDate, ShowID) 
VALUES ('The One Where Monica Gets a Roommate', 1, 1, '1994-09-22', 2);

INSERT INTO Episodes (Title, SeasonNumber, EpisodeNumber, AirDate, ShowID) 
VALUES ('Pilot', 1, 1, '2008-01-20', 3);

-- Добавление данных об отзывах
INSERT INTO Reviews (ShowID, Reviewer, ReviewText, Rating) 
VALUES (1, 'John Doe', 'One of the greatest shows ever!', 5);

INSERT INTO Reviews (ShowID, Reviewer, ReviewText, Rating) 
VALUES (3, 'Jane Smith', 'Amazing series with incredible acting!', 5);

-- Добавление данных об актерском составе
INSERT INTO Cast (ActorID, ShowID, Role) 
VALUES (1, 1, 'Jon Snow');

INSERT INTO Cast (ActorID, ShowID, Role) 
VALUES (2, 2, 'Rachel Green');

INSERT INTO Cast (ActorID, ShowID, Role) 
VALUES (3, 3, 'Walter White');