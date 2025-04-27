-- What is the churn rate across city tiers
SELECT 
  ROUND(((SUM(s.Churn) / COUNT(*)) * 100), 2) AS churn_rate_percent, 
  c.CityTier
FROM subscriptions s
JOIN customers AS c ON s.CustomerID = c.CustomerID
GROUP BY c.CityTier;

-- Which preferred payment modes are linked with high churn?
SELECT PreferredPaymentMode, COUNT(PreferredPaymentMode) as Count
FROM subscriptions
WHERE churn = 1
GROUP BY PreferredPaymentMode
ORDER BY COUNT(PreferredPaymentMode) DESC;

-- Churn by Number of Devices Registered
SELECT 
  s.NumberOfDeviceRegistered,
  COUNT(*) AS total_customers,
  SUM(s.Churn) AS churned_customers,
  ROUND(SUM(s.Churn) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM subscriptions s
GROUP BY s.NumberOfDeviceRegistered
ORDER BY s.NumberOfDeviceRegistered;

-- Churn by Number of Satisfaction score
SELECT 
  s.SatisfactionScore,
  COUNT(*) AS total_customers,
  SUM(s.Churn) AS churned_customers,
  ROUND(SUM(s.Churn) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM subscriptions s
GROUP BY s.SatisfactionScore
ORDER BY s.SatisfactionScore;

-- Churn by Cashback amount
SELECT s.churn, ROUND(sum(o.CashbackAmount),2) as Sum, count(o.CashbackAmount) as Count
FROM subscriptions s
JOIN orders o 
ON s.CustomerID = o.CustomerID
GROUP BY churn

-- Churn by Preferred Order Category
SELECT 
  s.PreferedOrderCat,
  COUNT(*) AS total_customers,
  SUM(s.Churn) AS churned_customers,
  ROUND(SUM(s.Churn) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM subscriptions s
GROUP BY s.PreferedOrderCat
ORDER BY churn_rate_percent DESC;