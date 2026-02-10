-- Write your PostgreSQL query statement below
SELECT MAX(num) AS num
FROM
(
    SELECT *
    FROM MyNumbers
    GROUP BY num
    HAVING count(num) = 1
) AS UniqueNums