EXPLAIN ANALYZE
SELECT
    s.s_name,
    s.s_address
FROM
    supplier s
JOIN
    nation n ON s.s_nationkey = n.n_nationkey
WHERE
    s.s_suppkey IN (
        SELECT
            ps.ps_suppkey
        FROM
            partsupp ps
        WHERE
            ps.ps_partkey IN (
                SELECT
                    p.p_partkey
                FROM
                    part p
                WHERE
                    p.p_name LIKE 'PartName%' -- Substitua pelo valor desejado
            )
            AND ps.ps_availqty > (
                SELECT
                    0.5 * SUM(l.l_quantity)
                FROM
                    lineitem l
                WHERE
                    l.l_partkey = ps.ps_partkey
                    AND l.l_suppkey = ps.ps_suppkey
                    AND l.l_shipdate >= DATE '1998-01-01' -- Substitua pela data desejada
                    AND l.l_shipdate < DATE '1998-01-01' + INTERVAL '1 year'
            )
    )
    AND n.n_name = 'NationName' -- Substitua pelo valor desejado
ORDER BY
    s.s_name;
