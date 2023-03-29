-- execution time: 3.375 ms, 2.202 ms, 2.182 ms, 2.541 ms
-- avg: 2.575 ms
EXPLAIN
    ANALYZE
SELECT a.aircraft_code AS a_code,
       a.model,
       ( SELECT count( r.aircraft_code )
         FROM routes r
         WHERE r.aircraft_code = a.aircraft_code
       ) AS num_routes
FROM aircrafts a
GROUP BY 1, 2
ORDER BY 3 DESC;

-- execution time: 0.883 ms, 1.093 ms, 0.723 ms, 0.798 ms
-- avg: 0.874 ms
EXPLAIN
    ANALYZE
SELECT a.aircraft_code AS a_code,
       a.model,
       count( r.aircraft_code ) AS num_routes
FROM aircrafts a
LEFT OUTER JOIN routes r
             ON r.aircraft_code = a.aircraft_code
GROUP BY 1, 2
ORDER BY 3 DESC;
