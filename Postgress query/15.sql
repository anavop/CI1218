
EXPLAIN ANALYZE
SELECT
    l.l_suppkey AS supplier_no,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS total_revenue
FROM
    lineitem l
WHERE
    l.l_shipdate >= DATE '1996-01-01' -- Substitua pela data desejada
    AND l.l_shipdate < DATE '1996-01-01' + INTERVAL '3 months'
GROUP BY
    l.l_suppkey;

-- Seleção dos fornecedores com maior receita
SELECT
    s.s_suppkey,
    s.s_name,
    s.s_address,
    s.s_phone,
    r.total_revenue
FROM
    supplier s
JOIN
    revenue_supplier r ON s.s_suppkey = r.supplier_no
WHERE
    r.total_revenue = (
        SELECT
            MAX(total_revenue)
        FROM
            revenue_supplier
    )
ORDER BY
    s.s_suppkey;


