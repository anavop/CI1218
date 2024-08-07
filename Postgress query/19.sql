EXPLAIN ANALYZE
SELECT
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS revenue
FROM
    lineitem l
JOIN
    part p ON p.p_partkey = l.l_partkey
WHERE
    (
        p.p_brand = 'BrandA' -- Substitua pelo valor desejado
        AND p.p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
        AND l.l_quantity BETWEEN 10 AND 20 -- Substitua pelo valor desejado
        AND p.p_size BETWEEN 1 AND 5
        AND l.l_shipmode IN ('AIR', 'AIR REG')
        AND l.l_shipinstruct = 'DELIVER IN PERSON'
    )
    OR
    (
        p.p_brand = 'BrandB' -- Substitua pelo valor desejado
        AND p.p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
        AND l.l_quantity BETWEEN 20 AND 30 -- Substitua pelo valor desejado
        AND p.p_size BETWEEN 1 AND 10
        AND l.l_shipmode IN ('AIR', 'AIR REG')
        AND l.l_shipinstruct = 'DELIVER IN PERSON'
    )
    OR
    (
        p.p_brand = 'BrandC' -- Substitua pelo valor desejado
        AND p.p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
        AND l.l_quantity BETWEEN 30 AND 40 -- Substitua pelo valor desejado
        AND p.p_size BETWEEN 1 AND 15
        AND l.l_shipmode IN ('AIR', 'AIR REG')
        AND l.l_shipinstruct = 'DELIVER IN PERSON'
    );

