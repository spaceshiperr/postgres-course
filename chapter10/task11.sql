BEGIN;

CREATE TEMP TABLE flights_tt AS
SELECT * FROM flights_v;

-- execution time: 417, 275, 283 ms; avg: 325 ms
EXPLAIN ANALYZE
SELECT * FROM flights_v;

-- execution time: 9, 9, 9 ms; avg: 9 ms
EXPLAIN ANALYZE
SELECT * FROM flights_tt;

-- execution time: 46, 47, 50 ms; avg: 47.(6) ms
EXPLAIN ANALYZE
SELECT departure_airport, arrival_airport, count(*) as count
FROM flights_v
GROUP BY departure_airport, arrival_airport
ORDER BY count DESC;

-- execution time: 25, 21, 30 ms; avg: 25.(3) ms
EXPLAIN ANALYZE
SELECT departure_airport, arrival_airport, count(*) as count
FROM flights_tt
GROUP BY departure_airport, arrival_airport
ORDER BY count DESC;

ROLLBACK;
