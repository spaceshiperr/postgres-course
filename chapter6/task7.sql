SELECT DISTINCT r1.departure_city, r1.arrival_city
--                 r2.departure_city, r2.arrival_city
FROM routes r1
JOIN routes r2 ON r1.departure_city = r2.arrival_city AND r1.arrival_city = r2.departure_city
JOIN aircrafts a ON r1.aircraft_code = a.aircraft_code
WHERE a.model = 'Boeing 777-300'
--   AND (r1.departure_city != r2.arrival_city AND r1.arrival_city != r2.departure_city)
ORDER BY 1;
