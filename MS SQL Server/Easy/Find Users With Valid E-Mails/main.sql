/* Write your T-SQL query statement below */
SELECT *
FROM Users
WHERE mail LIKE '[A-Z]%@leetcode.com'
    AND mail NOT LIKE '%[!#$%^&*()=+?/\]%'
    AND mail NOT LIKE '%@%@%'
