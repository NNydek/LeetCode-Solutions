/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        turn,
        weight,
        SUM(weight) OVER (ORDER BY turn ROWS UNBOUNDED PRECEDING) AS TotalWeight
    FROM Queue
)
SELECT TOP 1
    q.person_name
FROM CTE cte
    INNER JOIN Queue q
        ON cte.turn = q.turn
WHERE TotalWeight <= 1000
ORDER BY TotalWeight DESC
