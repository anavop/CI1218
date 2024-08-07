EXPLAIN ANALYZE
SELECT
    nation,
    o_year,
    SUM(amount) AS sum_profit
FROM
    (
        SELECT
            n2.n_name AS nation,
            EXTRACT(YEAR FROM o.o_orderdate) AS o_year,
            l.l_extendedprice * (1 - l.l_discount) - ps.ps_supplycost * l.l_quantity AS amount
        FROM
            part p
        JOIN
            lineitem l ON p.p_partkey = l.l_partkey
        JOIN
            partsupp ps ON l.l_partkey = ps.ps_partkey AND l.l_suppkey = ps.ps_suppkey
        JOIN
            orders o ON l.l_orderkey = o.o_orderkey
        JOIN
            supplier s ON l.l_suppkey = s.s_suppkey
        JOIN
            nation n1 ON s.s_nationkey = n1.n_nationkey
        JOIN
            nation n2 ON n1.n_regionkey = n2.n_nationkey
        WHERE
            p.p_name LIKE '%BRASS%' -- Substitua pelo valor desejado
    ) AS profit
GROUP BY
    nation,
    o_year
ORDER BY
    nation,
    o_year DESC;
