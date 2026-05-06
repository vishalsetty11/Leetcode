-- Write your PostgreSQL query statement below
SELECT DISTINCT email
FROM (
    SELECT email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rnum
    FROM Person
)
WHERE rnum > 1