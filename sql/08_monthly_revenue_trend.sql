SELECT 
	TO_CHAR(DATE_TRUNC('month', invoicedate), 'YYYY-MM-01') AS month_year,
	segment,
	SUM(revenue) AS net_revenue
FROM orders_with_segments
GROUP BY month_year, segment
ORDER BY month_year;
		