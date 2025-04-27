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

-- Most Preferred Order Category Among Churned Users
SELECT	COUNT(*) as Count_churn, PreferedOrderCat
FROM subscriptions
WHERE churn = 1
GROUP BY PreferedOrderCat
ORDER BY Count_churn desc

-- 2nd Highest Satisfaction Score Category with Ties
WITH category_scores AS (
  SELECT 
    PreferedOrderCat,
    AVG(SatisfactionScore) AS avg_score
  FROM subscriptions
  GROUP BY PreferedOrderCat
),
ranked_scores AS (
  SELECT 
    *,
    DENSE_RANK() OVER (ORDER BY avg_score DESC) AS rnk
  FROM category_scores
)
SELECT * 
FROM ranked_scores
WHERE rnk = 2;

-- Finding Duplicated in PreferredLoginDevice and CityTier
SELECT s.PreferredLoginDevice, c.CityTier, COUNT(*) as count
FROM customers c
JOIN subscriptions s
ON s.CustomerID = c.CustomerID
GROUP BY PreferredLoginDevice, CityTier
HAVING COUNT(*) > 1;