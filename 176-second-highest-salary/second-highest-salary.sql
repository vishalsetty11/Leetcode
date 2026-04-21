SELECT (
    SELECT DISTINCT salary
    FROM (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS sal_rank
        FROM Employee
    )
    WHERE sal_rank = 2
) AS SecondHighestSalary