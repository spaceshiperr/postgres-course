REFRESH MATERIALIZED VIEW routes;

-- 0.231 ms
EXPLAIN ANALYZE
SELECT * FROM routes;

-- 58.409 ms
EXPLAIN ANALYZE
WITH f3 AS (SELECT f2.flight_no,
                   f2.departure_airport,
                   f2.arrival_airport,
                   f2.aircraft_code,
                   f2.duration,
                   array_agg(f2.days_of_week) AS days_of_week
            FROM (SELECT f1.flight_no,
                         f1.departure_airport,
                         f1.arrival_airport,
                         f1.aircraft_code,
                         f1.duration,
                         f1.days_of_week
                  FROM (SELECT flights.flight_no,
                               flights.departure_airport,
                               flights.arrival_airport,
                               flights.aircraft_code,
                               flights.scheduled_arrival - flights.scheduled_departure   AS duration,
                               to_char(flights.scheduled_departure, 'ID'::text)::integer AS days_of_week
                        FROM flights) f1
                  GROUP BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration,
                           f1.days_of_week
                  ORDER BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration,
                           f1.days_of_week) f2
            GROUP BY f2.flight_no, f2.departure_airport, f2.arrival_airport, f2.aircraft_code, f2.duration)
SELECT f3.flight_no,
       f3.departure_airport,
       dep.airport_name AS departure_airport_name,
       dep.city         AS departure_city,
       f3.arrival_airport,
       arr.airport_name AS arrival_airport_name,
       arr.city         AS arrival_city,
       f3.aircraft_code,
       f3.duration,
       f3.days_of_week
FROM f3,
     airports dep,
     airports arr
WHERE f3.departure_airport = dep.airport_code
  AND f3.arrival_airport = arr.airport_code;
