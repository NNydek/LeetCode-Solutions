/* Write your T-SQL query statement below */
SELECT customer_number
FROM (
    SELECT TOP 1 customer_number, COUNT(*) as 'count'
    FROM Orders
    GROUP BY customer_number
    ORDER BY count desc
) f