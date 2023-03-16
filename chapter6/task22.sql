-- not necessary
SELECT aa.city, aa.airport_code, aa.airport_name
FROM (
         SELECT city
--               , count( * )
         FROM airports
         GROUP BY city
         HAVING count( * ) > 1
     ) AS a
JOIN airports AS aa ON a.city = aa.city
ORDER BY aa.city, aa.airport_name;
