-- Write your PostgreSQL query statement below
SELECT name, balance
FROM (
    SELECT u.name AS name,
        sum(amount) AS balance
    FROM Users u
    LEFT JOIN Transactions t ON u.account = t.account
    GROUP BY u.name
) t
WHERE balance > 10000