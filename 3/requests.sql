-- 1. Какие актеры снялись в сериале "Game of Thrones"?
SELECT Actors.Name 
FROM Actors 
INNER JOIN "Cast" ON Actors.ActorID = "Cast".ActorID
INNER JOIN Shows ON "Cast".ShowID = Shows.ShowID
WHERE Shows.Title = 'Game of Thrones';

-- 2. Какие сериалы были выпущены после 2010 года и их бюджеты?
SELECT Title, Budget 
FROM Shows 
WHERE Year > 2010;

-- 3. Какие отзывы получили сериалы с рейтингом выше 4?
SELECT Shows.Title, Reviews.Reviewer, Reviews.ReviewText, Reviews.Rating 
FROM Reviews 
INNER JOIN Shows ON Reviews.ShowID = Shows.ShowID 
WHERE Reviews.Rating > 4;

-- 4. Какова общая сумма бюджета всех сериалов?
SELECT SUM(Budget) AS TotalBudget 
FROM Shows;

-- 5. Какие актеры родились после 1980 года?
SELECT Name 
FROM Actors 
WHERE DateOfBirth > '1980-01-01';

-- 6. Какие сериалы имели эпизоды, вышедшие после 2015 года?
SELECT DISTINCT Shows.Title 
FROM Shows 
INNER JOIN Episodes ON Shows.ShowID = Episodes.ShowID 
WHERE Episodes.AirDate > '2015-01-01';

-- 7. Какие актеры сыграли роли в сериале с наивысшим бюджетом?
SELECT Actors.Name, "Cast".Role 
FROM Actors 
INNER JOIN "Cast" ON Actors.ActorID = "Cast".ActorID 
INNER JOIN Shows ON "Cast".ShowID = Shows.ShowID 
WHERE Shows.Budget = (SELECT MAX(Budget) FROM Shows);

-- 8. Сколько эпизодов было в каждом сериале?
SELECT Shows.Title, COUNT(Episodes.EpisodeID) AS EpisodeCount 
FROM Shows 
INNER JOIN Episodes ON Shows.ShowID = Episodes.ShowID 
GROUP BY Shows.Title;