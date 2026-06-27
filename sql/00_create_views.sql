WITH scores AS(
	SELECT cust_id, recency, freq, monetary,
	NTILE(5) OVER(ORDER BY recency) AS r_score,
	NTILE(5) OVER(ORDER BY freq) AS f_score,
	NTILE(5) OVER(ORDER BY monetary) AS m_score
	FROM retail
) 
SELECT *, (r_score, f_score, m_score) AS rfm_total
FROM scores;