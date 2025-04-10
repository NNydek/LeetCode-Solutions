/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        managerId,
        COUNT(managerId) AS cnt
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)
SELECT
    e.name
FROM CTE cte
    LEFT JOIN Employee e
        ON cte.managerId = e.id
WHERE e.id IS NOT NULL
