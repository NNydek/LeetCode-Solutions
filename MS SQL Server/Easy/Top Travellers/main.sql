/* Write your T-SQL query statement below */
SELECT
    u.name,
    ISNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users u
    LEFT JOIN Rides r
        ON u.id = r.user_id
GROUP BY user_id, u.name
ORDER BY travelled_distance DESC, u.name ASC
