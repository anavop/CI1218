EXPLAIN ANALYZE
SELECT
    SUM(l.l_extendedprice * l.l_discount) AS revenue
FROM
    lineitem l
WHERE
    l.l_shipdate >= DATE '1998-01-01' -- Substitua pela data desejada
    AND l.l_shipdate < DATE '1998-01-01' + INTERVAL '1 year'
    AND l.l_discount BETWEEN 0.05 - 0.01 AND 0.05 + 0.01 -- Substitua pelo valor de desconto desejado
    AND l.l_quantity < 10; -- Substitua pela quantidade desejada
