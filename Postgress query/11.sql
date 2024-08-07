EXPLAIN ANALYZE
SELECT
    ps.ps_partkey,
    SUM(ps.ps_supplycost * ps.ps_availqty) AS value
FROM
    partsupp ps
JOIN
    supplier s ON ps.ps_suppkey = s.s_suppkey
JOIN
    nation n ON s.s_nationkey = n.n_nationkey
WHERE
    n.n_name = 'USA' -- Substitua pelo valor desejado
GROUP BY
    ps.ps_partkey
HAVING
    SUM(ps.ps_supplycost * ps.ps_availqty) > (
        SELECT
            SUM(ps_sub.ps_supplycost * ps_sub.ps_availqty) * 0.1 -- Substitua pelo valor desejado
        FROM
            partsupp ps_sub
        JOIN
            supplier s_sub ON ps_sub.ps_suppkey = s_sub.s_suppkey
        JOIN
            nation n_sub ON s_sub.s_nationkey = n_sub.n_nationkey
        WHERE
            n_sub.n_name = 'USA' -- Substitua pelo valor desejado
    )
ORDER BY
    value DESC;
