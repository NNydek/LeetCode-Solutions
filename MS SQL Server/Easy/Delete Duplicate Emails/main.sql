/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT id, email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Person
)

DELETE Person
WHERE id IN (SELECT id FROM CTE WHERE rn > 1)