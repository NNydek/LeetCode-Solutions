/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        user_id
    FROM UserActivity
    WHERE activity_type = 'paid'
    GROUP BY user_id
)
SELECT
    cte.user_id,
    CAST(
       AVG(
            CASE 
                WHEN activity_type = 'free_trial'
                    THEN activity_duration * 1.0
            END
       ) AS DECIMAL(10,2)
    ) AS trial_avg_duration,
    CAST(
        AVG(
            CASE 
                WHEN activity_type = 'paid'
                    THEN activity_duration * 1.0
            END
        ) AS DECIMAL(10,2)
    ) AS paid_avg_duration
FROM CTE cte
    LEFT JOIN UserActivity ua
        ON cte.user_id = ua.user_id
GROUP BY cte.user_id
ORDER BY cte.user_id
