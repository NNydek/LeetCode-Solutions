/* Write your T-SQL query statement below */
SELECT
    s.user_id,
    CAST(
        ISNULL(
            SUM(
                CASE 
                    WHEN action = 'timeout'
                        THEN 0.0
                    WHEN action = 'confirmed'
                        THEN 1.0
                END
            ) / COUNT(action)
            , 0
        ) AS DECIMAL(10,2)
    ) AS confirmation_rate
FROM Signups s
    LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
GROUP BY s.user_id