WITH cons_nums AS (
    SELECT num,
        LEAD(num, 1) OVER (ORDER BY id ASC) AS next_num,
        LEAD(num, 2) OVER (ORDER BY id ASC) AS next_to_num
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM cons_nums
WHERE num = next_num AND next_num = next_to_num