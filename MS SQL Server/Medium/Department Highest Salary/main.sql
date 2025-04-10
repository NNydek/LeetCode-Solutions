/* Write your T-SQL query statement below */
WITH CTE AS(
    SELECT
        departmentId,
        MAX(salary) as Salary
    FROM Employee
    GROUP BY departmentId
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM CTE cte
    LEFT JOIN Department d
        ON cte.departmentId = d.id
    LEFT JOIN Employee e
        ON cte.departmentId = e.departmentId
            AND cte.Salary = e.salary
            