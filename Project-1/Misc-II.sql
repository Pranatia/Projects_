-- Churn rate by city tier for customers using > 2 devices
SELECT 
  c.CityTier,
  COUNT(*) AS total_users,
  SUM(s.Churn) AS churned_users,
  ROUND(SUM(s.Churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM subscriptions s
JOIN customers c ON s.CustomerID = c.CustomerID
WHERE s.NumberOfDeviceRegistered > 2
GROUP BY c.CityTier;

-- 2nd Highest Satisfaction Score Category with Ties
WITH ranked_scores AS (
  SELECT 
    PreferedOrderCat,
    AVG(SatisfactionScore) AS avg_score,
    DENSE_RANK() OVER (ORDER BY AVG(SatisfactionScore) DESC) AS rnk
  FROM subscriptions
  GROUP BY PreferedOrderCat
)
SELECT * FROM ranked_scores WHERE rnk = 2;

-- LAG Cashback Trend by Preferred Device
WITH cashback_by_device AS (
  SELECT 
    s.PreferredLoginDevice,
    o.CashbackAmount,
    LAG(o.CashbackAmount) OVER (PARTITION BY s.PreferredLoginDevice ORDER BY o.CashbackAmount) AS prev_cashback
  FROM subscriptions s
  JOIN orders o ON s.CustomerID = o.CustomerID
)
SELECT *
FROM cashback_by_device
WHERE CashbackAmount > prev_cashback;