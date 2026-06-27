WITH basket AS (
    SELECT
        customer_id,
        invoice,
        SUM(revenue) AS total_revenue,
        COUNT(DISTINCT description) AS distinct_products
    FROM orders_with_segments
    GROUP BY customer_id, invoice
)
SELECT
    s.segment,
    ROUND(AVG(b.total_revenue)::numeric, 2) AS avg_order_value,
    ROUND(AVG(b.distinct_products)::numeric, 1) AS avg_items_per_order
FROM basket b
JOIN scores s ON s.cust_id = b.customer_id
GROUP BY s.segment
ORDER BY avg_order_value DESC;

