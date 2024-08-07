EXPLAIN ANALYZE
SELECT
    SUM(l.l_extendedprice) / 7.0 AS avg_yearly
FROM
    lineitem l
JOIN
    part p ON p.p_partkey = l.l_partkey
WHERE
    p.p_brand = 'BrandA' -- Substitua pelo valor desejado
    AND p.p_container = 'MED BOX' -- Substitua pelo valor desejado
    AND l.l_quantity < (
        SELECT
            0.2 * AVG(l2.l_quantity)
        FROM
            lineitem l2
        WHERE
            l2.l_partkey = p.p_partkey
    );
