EXPLAIN ANALYZE
SELECT
    n.n_name,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS revenue
FROM
    customer c
JOIN
    orders o ON c.c_custkey = o.o_custkey
JOIN
    lineitem l ON o.o_orderkey = l.l_orderkey
JOIN
    supplier s ON l.l_suppkey = s.s_suppkey
JOIN
    nation n ON s.s_nationkey = n.n_nationkey
JOIN
    region r ON n.n_regionkey = r.r_regionkey
WHERE
    r.r_name = 'EUROPE' -- Substitua pelo valor desejado
    AND o.o_orderdate >= DATE '1998-01-01' -- Substitua pela data desejada
    AND o.o_orderdate < DATE '1998-01-01' + INTERVAL '1 year'
GROUP BY
    n.n_name
ORDER BY
    revenue DESC;
