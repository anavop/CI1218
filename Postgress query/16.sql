EXPLAIN ANALYZE
SELECT
    p.p_brand,
    p.p_type,
    p.p_size,
    COUNT(DISTINCT ps.ps_suppkey) AS supplier_cnt
FROM
    partsupp ps
JOIN
    part p ON p.p_partkey = ps.ps_partkey
WHERE
    p.p_brand <> 'BrandX' -- Substitua pelo valor desejado
    AND p.p_type NOT LIKE 'TypeY%' -- Substitua pelo valor desejado
    AND p.p_size IN (10, 20, 30, 40, 50, 60, 70, 80) -- Substitua pelos tamanhos desejados
    AND ps.ps_suppkey NOT IN (
        SELECT
            s.s_suppkey
        FROM
            supplier s
        WHERE
            s.s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p.p_brand,
    p.p_type,
    p.p_size
ORDER BY
    supplier_cnt DESC,
    p.p_brand,
    p.p_type,
    p.p_size;
