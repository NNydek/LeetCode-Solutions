/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        employee_id,
        COUNT(employee_id) AS cnt
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1
)

SELECT 
    cte.employee_id,
    e.department_id
FROM CTE cte
    LEFT JOIN Employee e
        ON cte.employee_id = e.employee_id
UNION
SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
