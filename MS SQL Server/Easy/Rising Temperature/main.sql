/* Write your T-SQL query statement below */
SELECT id
FROM (
    SELECT id, recordDate, temperature,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temperature
    FROM Weather
) t
WHERE temperature > prev_temperature
AND DATEDIFF(DAY, prev_date, recordDate) = 1