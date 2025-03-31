/* Write your T-SQL query statement below */
SELECT e2.employee_id
FROM Employees e1
    RIGHT JOIN Employees e2 ON e1.employee_id = e2.manager_id
WHERE e2.salary < 30000
    AND e1.employee_id IS NULL
    AND e2.manager_id IS NOT NULL
ORDER BY e2.employee_id