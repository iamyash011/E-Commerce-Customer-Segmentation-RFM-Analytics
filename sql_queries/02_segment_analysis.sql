SELECT
    segment,
    ROUND(AVG(monetary/freq)::numeric, 2) AS avg_order_value,
    ROUND(AVG(freq)::numeric, 2) AS avg_order_per_customer
FROM scores
GROUP BY segment;