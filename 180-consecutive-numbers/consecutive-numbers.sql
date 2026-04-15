WITH LeadLogs AS (
    SELECT num,
           LEAD(num,1) OVER (ORDER BY id) AS NextNUM,
           LEAD(num,2) OVER (ORDER BY id) AS NextToNextNUM
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM LeadLogs
WHERE NextNUM=num AND NextToNextNUM=num; 