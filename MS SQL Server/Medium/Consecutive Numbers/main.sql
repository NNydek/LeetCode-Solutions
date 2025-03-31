/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT 
        id,
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next1,
        LEAD(num, 2) OVER (ORDER BY id) AS next2
    FROM Logs
)
SELECT DISTINCT num as ConsecutiveNums
FROM CTE
WHERE num = next1 AND num = next2;
