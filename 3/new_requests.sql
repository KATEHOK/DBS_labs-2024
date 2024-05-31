-- Актеры-товарищи по шоу
SELECT
    DISTINCT c1.ActorID AS Actor1_ID,
    c2.ActorID AS Actor2_ID,
    GROUP_CONCAT(s.Title, ', ') AS MoviesTogether
FROM
    Cast c1
    INNER JOIN Cast c2 ON c1.ShowID = c2.ShowID AND c1.ActorID < c2.ActorID
    INNER JOIN Shows s ON c1.ShowID = s.ShowID
GROUP BY
    c1.ActorID, c2.ActorID;
