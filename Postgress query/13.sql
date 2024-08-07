EXPLAIN ANALYZE
SELECT
    c_count,
    COUNT(*) AS custdist
FROM
    (
        SELECT
            c.c_custkey,
            COUNT(o.o_orderkey) AS c_count
        FROM
            customer c
        LEFT JOIN
            orders o ON c.c_custkey = o.o_custkey
            AND o.o_comment NOT LIKE '%discount%special%' -- Substitua pelos valores desejados
        GROUP BY
            c.c_custkey
    ) AS c_orders
GROUP BY
    c_count
ORDER BY
    custdist DESC,
    c_count DESC;
