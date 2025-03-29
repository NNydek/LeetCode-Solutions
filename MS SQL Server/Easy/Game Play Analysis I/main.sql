/* Write your T-SQL query statement below */
SELECT player_id, event_date AS 'first_login'
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) rn
    FROM Activity
) f
WHERE rn = 1
