-- 1. Получить список всех сериалов и их бюджеты
SELECT Title, Budget FROM Shows;

-- 2. Получить список актеров, игравших в сериале "Game of Thrones"
SELECT Name 
FROM Actors 
INNER JOIN "Cast" ON Actors.ActorID = "Cast".ActorID
INNER JOIN Shows ON "Cast".ShowID = Shows.ShowID
WHERE Shows.Title = 'Game of Thrones';

-- 3. Получить количество эпизодов для каждого сезона сериала "Friends"
SELECT SeasonNumber, COUNT(*) AS EpisodeCount
FROM Episodes
INNER JOIN Shows ON Episodes.ShowID = Shows.ShowID
WHERE Shows.Title = 'Friends'
GROUP BY SeasonNumber;

-- 4. Получить список всех отзывов для сериала "Breaking Bad" с оценкой выше 4
SELECT Reviewer, ReviewText, Rating
FROM Reviews
INNER JOIN Shows ON Reviews.ShowID = Shows.ShowID
WHERE Shows.Title = 'Breaking Bad' AND Rating > 4;

-- 5. Получить средний бюджет всех сериалов
SELECT AVG(Budget) AS AverageBudget FROM Shows;

-- 6. Получить список актеров, не родившихся в 20 веке
SELECT Name FROM Actors WHERE DateOfBirth >= '2000-01-01';

-- 7. Получить общее количество сериалов, вышедших после 2010 года
SELECT COUNT(*) AS TotalShows FROM Shows WHERE Year > 2010;

-- 8. Получить список актеров и роли, которые они сыграли, для сериала с наивысшим бюджетом
SELECT Actors.Name, "Cast".Role
FROM Actors
INNER JOIN "Cast" ON Actors.ActorID = "Cast".ActorID
INNER JOIN Shows ON "Cast".ShowID = Shows.ShowID
WHERE Shows.Budget = (SELECT MAX(Budget) FROM Shows);