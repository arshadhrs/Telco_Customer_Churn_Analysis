
-- ================================================
--  CHURN ANAlYSIS - SQL QUERIES
-- Author: Arshad H R 
-- Date: April 2026
-- Tool: SQLite
-- ================================================

-- Query 1: Overall churn rate
SELECT Churn,
       COUNT(*) AS total_customers,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM telco
GROUP BY Churn;

-- ------------------------------------------------

-- Query 2:Churn rate by Contract Type
SELECT Contract,
       COUNT(*) AS total,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- ------------------------------------------------

-- Query 3: Churn rate by Internet Service
SELECT InternetService,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;

-- ------------------------------------------------

-- Query 4: Average monthly charge for churned vs retained
SELECT Churn,
       ROUND(AVG(MonthlyCharges), 2) AS avg_monthly,
       ROUND(AVG(TotalCharges), 2) AS avg_lifetime_value,
       ROUND(AVG(tenure), 1) AS avg_tenure_months
FROM telco
GROUP BY Churn;

-- ------------------------------------------------

-- Query 5: Churn by tenure bucket
SELECT
  CASE
    WHEN tenure <= 12 THEN 'New (0-1yr)'
    WHEN tenure <= 24 THEN 'Growing (1-2yr)'
    WHEN tenure <= 48 THEN 'Established (2-4yr)'
    ELSE 'Loyal (4+yr)'
  END AS tenure_group,
  COUNT(*) AS total,
  SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco
GROUP BY tenure_group
ORDER BY churn_rate_pct DESC;

-- ------------------------------------------------

-- Query 6: High-value customers at risk
SELECT customerID, MonthlyCharges, tenure, Contract, InternetService
FROM telco
WHERE Churn = 'Yes' AND MonthlyCharges > 70
ORDER BY MonthlyCharges DESC
LIMIT 20;
