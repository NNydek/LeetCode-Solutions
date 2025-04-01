/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT
        p.product_id,
        us.units,
        p.price,
        p.price * us.units AS total_price
    FROM Prices p
        LEFT JOIN UnitsSold us
            ON p.product_id = us.product_id
            AND us.purchase_date BETWEEN p.start_date AND p.end_date
)

SELECT 
    c.product_id,
    CASE 
        WHEN SUM(c.units) IS NULL
            THEN 0
        ELSE
            CAST(
                SUM(c.total_price * 1.0) / SUM(c.units) AS DECIMAL(10, 2)
            ) 
    END AS average_price
FROM CTE c
GROUP BY c.product_id
