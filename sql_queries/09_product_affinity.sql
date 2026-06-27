WITH rank_cte AS(
	SELECT
	    segment,
	    description,
	    SUM(revenue) as total_revenue,
	    DENSE_RANK() OVER (PARTITION BY segment ORDER BY SUM(revenue) DESC) as rank
	FROM orders_with_segments
	GROUP BY segment, description
) 
SELECT * FROM rank_cte
	WHERE rank<=5
	ORDER BY segment, rank;