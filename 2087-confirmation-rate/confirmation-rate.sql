-- Write your PostgreSQL query statement below
SELECT s.user_id,
    ROUND(
        COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1.0 ELSE 0.0 END)::numeric / NULLIF(Count(c.action),0)
        ,0.0)
    ,2) AS confirmation_rate
FROM signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id