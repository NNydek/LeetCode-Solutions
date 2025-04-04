/* Write your T-SQL query statement below */
SELECT
    query_name,
    CAST(
        AVG(rating * 1.0 / position) AS DECIMAL(10,2)
    ) AS quality,
    CAST(
        SUM(IIF(rating < 3, 1, 0)) * 100.0 / COUNT(rating) AS DECIMAL(10,2)
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name
