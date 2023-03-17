with cities as (
    SELECT DISTINCT city FROM airports
)
SELECT count( * )
FROM cities AS a1
JOIN cities AS a2 ON a1.city <> a2.city;

with cities as (
    SELECT DISTINCT city FROM airports
)
SELECT count( * )
FROM cities AS a1, cities AS a2
WHERE a1.city <> a2.city;
