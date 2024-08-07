EXPLAIN ANALYZE
SELECT
    cntrycode,
    COUNT(*) AS numcust,
    SUM(c_acctbal) AS totacctbal
FROM
    (
        SELECT
            SUBSTRING(c_phone FROM 1 FOR 2) AS cntrycode,
            c_acctbal
        FROM
            customer
        WHERE
            SUBSTRING(c_phone FROM 1 FOR 2) IN ('CountryCode1', 'CountryCode2', 'CountryCode3', 'CountryCode4', 'CountryCode5', 'CountryCode6', 'CountryCode7')
            AND c_acctbal > (
                SELECT
                    AVG(c_acctbal)
                FROM
                    customer
                WHERE
                    c_acctbal > 0.00
                    AND SUBSTRING(c_phone FROM 1 FOR 2) IN ('CountryCode1', 'CountryCode2', 'CountryCode3', 'CountryCode4', 'CountryCode5', 'CountryCode6', 'CountryCode7')
            )
            AND NOT EXISTS (
                SELECT
                    1
                FROM
                    orders
                WHERE
                    o_custkey = c_custkey
            )
    ) AS custsale
GROUP BY
    cntrycode
ORDER BY
    cntrycode;
