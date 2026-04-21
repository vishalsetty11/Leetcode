-- Write your PostgreSQL query statement below
SELECT t.dept_name AS Department, t.emp_name AS Employee, t.emp_sal AS Salary
FROM (
    SELECT e.name AS emp_name, e.salary AS emp_sal, d.name AS dept_name,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS sal_rnk_dept
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) AS t
WHERE sal_rnk_dept = 1