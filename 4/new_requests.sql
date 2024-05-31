WITH SeasonNextDate AS (
    SELECT
        s.show_id,
        s.season,
        LEAD(s.date) OVER (PARTITION BY s.show_id ORDER BY s.season) AS next_season_date
    FROM
        public.seasons s
)
SELECT
    sh.title AS show_title,
    sn.next_season_date
FROM
    public.shows sh
LEFT JOIN
    (SELECT show_id, MAX(season) AS max_season FROM public.seasons GROUP BY show_id) max_seasons
    ON sh.id = max_seasons.show_id
LEFT JOIN
    SeasonNextDate sn
    ON sh.id = sn.show_id AND max_seasons.max_season = sn.season;
