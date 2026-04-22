-- Write your PostgreSQL query statement below
WITH cum_weights AS (
    SELECT person_name, turn,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM Queue
)

SELECT person_name
FROM cum_weights
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1