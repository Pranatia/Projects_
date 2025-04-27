-- Average number of orders placed by churned users
SELECT s.churn , AVG(OrderCount) AS avg_orders
FROM orders o
JOIN subscriptions s
ON o.CustomerID = s.CustomerID
GROUP BY s.churn

-- Customers who complain tend to churn more
SELECT s.churn,SUM(t.complain) AS Complaints
FROM subscriptions s 
JOIN support_tickets t
ON s.CustomerID = t.CustomerID
GROUP BY churn

-- Churn by Cashback amount
SELECT s.churn, ROUND(sum(o.CashbackAmount),2) as Sum, count(o.CashbackAmount) as Count,
ROUND((Sum(o.CashbackAmount)/Count(o.CashbackAmount)),2) as AverageofCashback
FROM subscriptions s
JOIN orders o 
ON s.CustomerID = o.CustomerID
GROUP BY churn
