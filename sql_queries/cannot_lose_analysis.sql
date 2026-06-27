SELECT 
	COUNT(*) AS customer_count,
	ROUND(AVG(recency), 2) AS avg_days_since_last_purchase,
	ROUND(AVG(monetary)::numeric, 2) AS avg_lifetime_spend
FROM scores
WHERE segment= 'Cannot Lose';

