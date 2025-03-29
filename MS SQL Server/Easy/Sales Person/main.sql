/* Write your T-SQL query statement below */
SELECT DISTINCT sp.name
FROM Orders o
    RIGHT JOIN SalesPerson sp
        ON o.sales_id = sp.sales_id
WHERE o.sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM Orders o
        LEFT JOIN Company c
            ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)
OR o.com_id IS NULL
