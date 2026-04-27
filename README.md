# 📞 Telco Customer Churn Prediction

## Problem
A telecom company loses ~26.5% of customers annually.
Each lost customer = avg $65/month × ~18 months = ~$1,170 in lifetime value gone.
How do you predict who's about to leave — before they do?

## Key Findings
- 📅 **Month-to-month customers churn at 43%** — 14× higher than 2-year contracts
- 🌐 **Fiber optic users churn at 42%** — paying more but satisfied less
- 🆕 **New customers (0–12 months) churn at 48%** — the onboarding window is critical
- 💳 **Electronic check payers churn most** — a proxy for disengaged, at-risk customers
- 💰 **$139K/month in revenue at risk** from currently churned customers

## Tech Stack
- Python (pandas, sklearn, seaborn)
- SQL (SQLite)
- Power BI

## Results
| Model | Precision | Recall | F1-Score |
|-------|-----------|--------|----------|
| Logistic Regression | 0.79 | 0.80 | 0.79 |
| Random Forest | 0.82 | 0.81 | 0.81 |
