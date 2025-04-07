/* Write your T-SQL query statement below */
SELECT
    astart.machine_id,
    CAST(
        AVG(aend.timestamp - astart.timestamp) AS DECIMAL(10,3)
    ) AS processing_time
FROM Activity astart
    INNER JOIN Activity aend
        ON astart.machine_id = aend.machine_id
            AND astart.activity_type = 'start'
            AND aend.activity_type = 'end'
GROUP BY astart.machine_id
