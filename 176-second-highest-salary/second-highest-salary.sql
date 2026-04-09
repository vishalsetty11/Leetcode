-- Write your PostgreSQL query statement below
SELECT (
    SELECT DISTINCT salary 
    FROM (
        SELECT * ,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS SalRnk
        FROM Employee 
    )
    WHERE SalRnk = 2
)as SecondHighestSalary
