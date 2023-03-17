SELECT DISTINCT a.city
FROM airports a
WHERE NOT EXISTS (
    SELECT * FROM routes r
    WHERE r.departure_city = 'Москва'
      AND r.arrival_city = a.city
)
  AND a.city <> 'Москва'
ORDER BY city;


SELECT city
FROM airports
WHERE city <> 'Москва'
EXCEPT
SELECT arrival_city
FROM routes
WHERE departure_city = 'Москва'
ORDER BY city;
