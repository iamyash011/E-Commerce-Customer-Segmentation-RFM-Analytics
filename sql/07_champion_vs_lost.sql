SELECT 
	segment,
	ROUND(AVG(recency), 2) AS avg_days_since_last_purchase,	
	ROUND(AVG(monetary)::numeric, 2) avg_lifetime_spend,
	ROUND(AVG(freq), 2) AS avg_frequency
FROM scores
WHERE segment = 'Champion' OR segment= 'Lost'
GROUP BY segment;

	