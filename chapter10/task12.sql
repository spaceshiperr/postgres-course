BEGIN;

DROP INDEX IF EXISTS passenger_name_key;

-- execution time: 933, 352, 58, 40; avg: 346 ms
EXPLAIN ANALYZE
SELECT count( * )
FROM tickets
WHERE passenger_name = 'IVAN IVANOV';

CREATE INDEX passenger_name_key
ON tickets ( passenger_name );

-- execution time: 1.607, 0.153, 0.086, 0.075; avg: 0.48 ms
EXPLAIN ANALYZE
SELECT count( * )
FROM tickets
WHERE passenger_name = 'IVAN IVANOV';

ROLLBACK;
