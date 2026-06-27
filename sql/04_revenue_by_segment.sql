SELECT 
    segment,
	ROUND(
        (
            SUM(revenue) * 100.0 /
            SUM(SUM(revenue)) OVER()
        )::numeric,
        2
    ) AS revenue_percentage

FROM orders_with_segments
GROUP BY segment