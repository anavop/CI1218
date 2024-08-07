EXPLAIN ANALYZE
SELECT
    l.l_shipmode,
    SUM(CASE
        WHEN o.o_orderpriority = '1-URGENT'
             OR o.o_orderpriority = '2-HIGH'
        THEN 1
        ELSE 0
    END) AS high_line_count,
    SUM(CASE
        WHEN o.o_orderpriority <> '1-URGENT'
             AND o.o_orderpriority <> '2-HIGH'
        THEN 1
        ELSE 0
    END) AS low_line_count
FROM
    orders o
JOIN
    lineitem l ON o.o_orderkey = l.l_orderkey
WHERE
    l.l_shipmode IN ('MAIL', 'SHIP') -- Substitua pelos valores desejados
    AND l.l_commitdate < l.l_receiptdate
    AND l.l_shipdate < l.l_commitdate
    AND l.l_receiptdate >= DATE '1996-01-01' -- Substitua pela data desejada
    AND l.l_receiptdate < DATE '1996-01-01' + INTERVAL '1 year'
GROUP BY
    l.l_shipmode
ORDER BY
    l.l_shipmode;
