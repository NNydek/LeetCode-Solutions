/* Write your T-SQL query statement below */
DECLARE @Players INT;
SET @Players = (
    SELECT
        COUNT(DISTINCT player_id)
    FROM Activity
);

WITH CTE AS(
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
NextDayLogin AS(
    SELECT
        cte.player_id
    FROM CTE cte
    INNER JOIN Activity a
        ON cte.player_id = a.player_id
            AND a.event_date = DATEADD(DAY, 1, cte.first_login)
)
SELECT
    CAST(
        COUNT(DISTINCT player_id) * 1.0 / @Players AS DECIMAL(10,2)
    ) AS fraction
FROM NextDayLogin
