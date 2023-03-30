BEGIN;

CREATE TABLE nulls AS
    SELECT num::integer, 'TEXT' || num::text AS txt
    FROM generate_series( 1, 200000 ) AS gen_ser( num );

INSERT INTO nulls
VALUES ( NULL, 'TEXT' );


CREATE INDEX nulls_ind
    ON nulls ( num );

-- task1: it will use the index
EXPLAIN SELECT *
FROM nulls
ORDER BY num DESC NULLS FIRST;

-- task2: modify the index, add nulls first
DROP INDEX nulls_ind;

CREATE INDEX nulls_ind
    ON nulls ( num NULLS FIRST);

-- uses index scan
EXPLAIN SELECT *
FROM nulls
ORDER BY num NULLS FIRST;

-- uses index backward
EXPLAIN SELECT *
FROM nulls
ORDER BY num DESC NULLS LAST;

-- doesnt use the index
EXPLAIN SELECT *
FROM nulls
ORDER BY num NULLS LAST;

-- doesnt use the index
EXPLAIN SELECT *
FROM nulls
ORDER BY num DESC NULLS FIRST;

ROLLBACK;
