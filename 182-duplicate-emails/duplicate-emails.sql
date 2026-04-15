-- Write your PostgreSQL query statement below
SELECT
    DISTINCT email
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY email) AS Rnum
    FROM Person
)
WHERE Rnum > 1