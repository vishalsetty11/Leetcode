-- Write your PostgreSQL query statement below
SELECT dept_name AS Department, emp_name AS Employee, emp_sal AS Salary
FROM (
    SELECT e.name AS emp_name, e.salary AS emp_sal, d.name AS dept_name,
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS sal_rank
    FROM Employee e
    LEFT JOIN Department d ON e.departmentId = d.id
) AS t
WHERE sal_rank <= 3