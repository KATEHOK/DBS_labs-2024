WITH "big_shows" AS (
	SELECT 
		"show_id"
	FROM 
		"seasons"
	GROUP BY
		"show_id"
	HAVING
		COUNT("show_id") >= 2
),
"linear_regression" AS (
    SELECT 
        "seasons"."show_id",
        "season" * 1.0 AS "x",  -- Приведение к типу float для точности вычислений
        date_part('epoch', "date") AS "y"
    FROM
        "seasons"
	JOIN
		"big_shows" ON "seasons"."show_id" = "big_shows"."show_id"
),
"coefficients" AS (
    SELECT
        "show_id",
        (
            (COUNT(*) * SUM("x" * "y") - SUM("x") * SUM("y")) /
            (COUNT(*) * SUM("x" * "x") - SUM("x") * SUM("x"))
        ) AS "slope",
        (
            (SUM("y") - ((COUNT(*) * SUM("x" * "y") - SUM("x") * SUM("y")) / (COUNT(*) * SUM("x" * "x") - SUM("x") * SUM("x"))) * SUM("x")) /
            COUNT(*)
        ) AS "intercept"
    FROM 
        "linear_regression"
    GROUP BY
        "show_id"
),
"real" AS (
	SELECT
		"seasons"."show_id",
		(MAX("seasons"."season") + 1) AS "next_season",
		('1970-01-01'::date + ("coefficients"."slope" * (MAX("seasons"."season") + 1) + "coefficients"."intercept") * INTERVAL '1 second') AS "predicted_date"
	FROM
		"seasons"
	JOIN
		"coefficients" ON "seasons"."show_id" = "coefficients"."show_id"
	GROUP BY
		"seasons"."show_id", "coefficients"."intercept", "coefficients"."slope"
),
"small_shows" AS (
	SELECT 
		"show_id"
	FROM 
		"seasons"
	GROUP BY
		"show_id"
	HAVING
		COUNT("show_id") < 2
),
"fake" AS (
	SELECT
		"seasons"."show_id",
		(MAX("seasons"."season") + 1) AS "next_season",
		NULL AS "predicted_date"
	FROM
		"seasons"
	INNER JOIN
		"small_shows" ON "small_shows"."show_id" = "seasons"."show_id"
	GROUP BY
		"seasons"."show_id"
)
SELECT
	"shows"."title",
	"real"."next_season",
	TO_CHAR("real"."predicted_date", 'YYYY-MM-DD HH24:MI:SS') AS "predicted_date"
FROM
	"real"
JOIN
	"shows" ON "shows"."id" = "real"."show_id"
UNION	
SELECT
	"shows"."title",
	"fake"."next_season",
	"fake"."predicted_date"
FROM
	"fake"
JOIN
	"shows" ON "shows"."id" = "fake"."show_id";