/* Write your T-SQL query statement below */
DECLARE @UsersAmount INT;
SET @UsersAmount = (
    SELECT 
        COUNT(DISTINCT user_id)
    FROM Users
);

WITH CTE AS(
    SELECT
        contest_id,
        COUNT(user_id) AS users_registered
    FROM Register
    GROUP BY contest_id
)

SELECT
    contest_id,
    CAST( 
       users_registered * 100.0 / @UsersAmount AS DECIMAL(10,2)
    ) AS percentage
FROM CTE
ORDER BY percentage DESC, contest_id
