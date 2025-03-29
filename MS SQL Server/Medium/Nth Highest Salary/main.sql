CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    IF @N < 1
        RETURN NULL;
    
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT COALESCE(
            (SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
            OFFSET @N - 1 ROWS
            FETCH NEXT 1 ROWS ONLY),
            NULL
        )
    );
END