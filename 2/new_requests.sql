-- Задание 1 --------------------------------------------------

-- Шаг 1: Вычисляем среднюю оценку для каждого критика
WITH ReviewerAvg AS (
    SELECT
        Reviewer,
        AVG(Rating) AS AverageRating
    FROM
        Reviews
    GROUP BY
        Reviewer
),

-- Шаг 2: Вычисляем дисперсию для каждого критика
ReviewerVariance AS (
    SELECT
        r.Reviewer,
        AVG((r.Rating - ra.AverageRating) * (r.Rating - ra.AverageRating)) AS Variance
    FROM
        Reviews r
        JOIN ReviewerAvg ra ON r.Reviewer = ra.Reviewer
    GROUP BY
        r.Reviewer
)

-- Шаг 3: Вычисляем стандартное отклонение для каждого критика
SELECT
    ra.Reviewer,
    ra.AverageRating,
    SQRT(rv.Variance) AS RatingStdDev
FROM
    ReviewerAvg ra
    JOIN ReviewerVariance rv ON ra.Reviewer = rv.Reviewer;


-- Задание 2 --------------------------------------------------

-- Шаг 1: Вычисляем среднюю оценку для каждого критика
WITH ReviewerAvg AS (
    SELECT
        Reviewer,
        AVG(Rating) AS AverageRating
    FROM
        Reviews
    GROUP BY
        Reviewer
),

-- Шаг 2: Вычисляем дисперсию для каждого критика
ReviewerVariance AS (
    SELECT
        r.Reviewer,
        AVG((r.Rating - ra.AverageRating) * (r.Rating - ra.AverageRating)) AS Variance
    FROM
        Reviews r
        JOIN ReviewerAvg ra ON r.Reviewer = ra.Reviewer
    GROUP BY
        r.Reviewer
),

-- Шаг 3: Вычисляем стандартное отклонение для каждого критика
ReviewerStdDev AS (
    SELECT
        ra.Reviewer,
        ra.AverageRating,
        SQRT(rv.Variance) AS RatingStdDev
    FROM
        ReviewerAvg ra
        JOIN ReviewerVariance rv ON ra.Reviewer = rv.Reviewer
)

-- Шаг 4: Получаем трех критиков с наибольшим стандартным отклонением
SELECT
    Reviewer,
    AverageRating,
    RatingStdDev
FROM
    ReviewerStdDev
ORDER BY
    RatingStdDev DESC
LIMIT 3;
