/* Write your T-SQL query statement below */
SELECT name as 'Customers' FROM Customers c
    LEFT JOIN Orders o ON c.Id = o.customerId
WHERE customerId IS NULL