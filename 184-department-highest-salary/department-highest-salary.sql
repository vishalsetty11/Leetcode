-- Write your PostgreSQL query statement below
WITH processing AS (
    SELECT e.name AS EmpName,
        e.salary AS Salary,
        d.name AS DeptName,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salRank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) 

SELECT DeptName AS Department,EmpName AS Employee, Salary 
FROM processing
WHERE salRank = 1