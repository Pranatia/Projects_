-- How many customers are currently active vs churned?
SELECT Churn, COUNT(*) AS total_customers
FROM subscriptions
GROUP BY Churn;

-- What is the average tenure of churned vs non-churned users
SELECT Churn, ROUND(AVG(Tenure),2) AS avg_tenure
FROM subscriptions
GROUP BY Churn;