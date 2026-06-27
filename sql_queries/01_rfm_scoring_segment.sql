DROP VIEW IF EXISTS scores;

CREATE VIEW scores AS
WITH rfm AS (
    SELECT 
        cust_id,
        recency,
        freq,
        monetary,

        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY freq) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score

    FROM retail
)

SELECT 
    cust_id,
    recency,
    freq,
    monetary,

    r_score,
    f_score,
    m_score,

    (r_score || '-' || f_score || '-' || m_score) AS rfm_total,

    CASE
        WHEN r_score = 5 
             AND f_score >= 4 
             AND m_score >= 4 
        THEN 'Champion'

        WHEN r_score >= 4 
             AND f_score >= 4 
        THEN 'Loyal'

        WHEN r_score >= 3 
             AND f_score <= 2 
        THEN 'Promising'

        WHEN r_score <= 2 
             AND f_score >= 3 
        THEN 'At Risk'

        WHEN r_score <= 2 
             AND f_score <= 2 
        THEN 'Cannot Lose'

        WHEN r_score = 1 
        THEN 'Lost'

        ELSE 'Needs Attention'
    END AS segment

FROM rfm;

SELECT *
FROM scores;