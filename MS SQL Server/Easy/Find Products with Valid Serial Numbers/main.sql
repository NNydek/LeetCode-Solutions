/* Write your T-SQL query statement below */
SELECT *
FROM products
WHERE description LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
    OR description LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9] %'
ORDER BY product_id