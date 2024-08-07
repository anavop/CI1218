EXPLAIN ANALYZE
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders o
WHERE
    o.o_orderdate >= DATE '1998-01-01' -- Substitua pela data desejada
    AND o.o_orderdate < DATE '1998-01-01' + INTERVAL '3 months'
    AND EXISTS (
        SELECT
            1
        FROM
            lineitem l
        WHERE
            l.l_orderkey = o.o_orderkey
            AND l.l_commitdate < l.l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;
