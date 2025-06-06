/* Write your T-SQL query statement below */
WITH reqFriends AS(
    SELECT 
        requester_id AS id,
        COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY requester_id
),
accFriends AS(
    SELECT
        accepter_id AS id,
        COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT TOP 1
    id,
    SUM(num) AS num
FROM (
    SELECT * FROM reqFriends
    UNION ALL
    SELECT * FROM accFriends
) AS f
GROUP BY id
ORDER BY num DESC
