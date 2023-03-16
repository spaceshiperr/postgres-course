SELECT departure_city, count( * ) AS count
FROM routes
GROUP BY departure_city
ORDER BY count DESC;

SELECT departure_city, count(DISTINCT arrival_city) AS count
FROM routes
GROUP BY departure_city
ORDER BY count DESC;

