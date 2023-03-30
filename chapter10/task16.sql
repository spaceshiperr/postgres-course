BEGIN;

SET enable_hashjoin = off;
SET enable_mergejoin = off;
SET enable_nestloop = off;

EXPLAIN ANALYZE
SELECT a.model, count( * )
FROM aircrafts a, seats s
WHERE a.aircraft_code = s.aircraft_code
GROUP BY a.aircraft_code;

ROLLBACK;
