EXPLAIN ANALYZE
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer c
JOIN
    orders o ON c.c_custkey = o.o_custkey
JOIN
    lineitem l ON o.o_orderkey = l.l_orderkey
WHERE
    c.c_mktsegment = 'electronics' 
    AND o.o_orderdate < DATE '1998-12-01' 
    AND l.l_shipdate > DATE '1998-12-01' 
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate;
