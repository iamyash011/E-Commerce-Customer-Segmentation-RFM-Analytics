SELECT 
    country,
    COUNT(DISTINCT customer_id) AS customer_count,
	SUM(revenue) AS revenue_generated,
    ROUND((SUM(revenue) * 100 / SUM(SUM(revenue)) OVER())::numeric, 2) AS revenue_percentage

FROM orders_with_segments
WHERE segment ='At Risk'
GROUP BY country;