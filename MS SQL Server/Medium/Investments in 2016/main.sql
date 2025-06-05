/* Write your T-SQL query statement below */
WITH Tiv2015Duplicates AS (
    SELECT DISTINCT
        tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
UniqueCity AS(
    SELECT
        lat,
        lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)

SELECT 
    CAST(
        SUM(i.tiv_2016) 
        AS DECIMAL(10, 2)
    ) AS tiv_2016
FROM Insurance i
    INNER JOIN Tiv2015Duplicates d
        ON i.tiv_2015 = d.tiv_2015
    INNER JOIN UniqueCity uc
        ON i.lat = uc.lat AND i.lon = uc.lon
        