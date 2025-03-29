/* Write your T-SQL query statement below */
SELECT DISTINCT class 
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY class ORDER BY class) AS rn
    FROM Courses 
) f
WHERE rn > 4

SELECT class
FROM Courses
GROUP BY class
HAVING count