DROP VIEW IF EXISTS orders_with_segments;

CREATE VIEW orders_with_segments AS
SELECT 
    o.customer_id,
    o.country,
    o.invoice,
    o.description,
    o.invoicedate,
    o.quantity,
    o.price,
    o.revenue,
    s.segment,
    s.r_score,
    s.f_score,
    s.m_score
FROM orders o
JOIN scores s ON o.customer_id = s.cust_id;

SELECT * FROM orders_with_segments;