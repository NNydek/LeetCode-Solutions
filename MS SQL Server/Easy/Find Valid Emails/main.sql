/* Write your T-SQL query statement below */
SELECT *
FROM Users
WHERE email like '%[A-Z0-9_]%@%[A-Z0-9]%.com'
    AND email NOT LIKE '%[^a-zA-Z0-9_]%@%'
ORDER BY user_id