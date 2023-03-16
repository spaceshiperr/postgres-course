SELECT 'Понедельник' AS day_of_week, count( * ) AS num_flights
FROM routes
WHERE departure_city = 'Москва'
  AND days_of_week @> '{ 1 }'::integer[];

SELECT unnest( days_of_week ) AS day_of_week,
       count( * ) AS num_flights
FROM routes
WHERE departure_city = 'Москва'
GROUP BY day_of_week
ORDER BY day_of_week;

SELECT dw.name_of_day, count( * ) AS num_flights
FROM (
         SELECT unnest( days_of_week ) AS num_of_day
         FROM routes
         WHERE departure_city = 'Москва'
     ) AS r,
     unnest( '{ 1, 2, 3, 4, 5, 6, 7 }'::integer[],
             '{ "Пн.", "Вт.", "Ср.", "Чт.", "Пт.", "Сб.", "Вс."}'::text[]
         ) AS dw( num_of_day, name_of_day )
WHERE r.num_of_day = dw.num_of_day
GROUP BY r.num_of_day, dw.name_of_day
ORDER BY r.num_of_day;

SELECT dw.name_of_day, count( * ) AS num_flights
FROM (
            SELECT unnest( days_of_week ) AS num_of_day
            FROM routes
            WHERE departure_city = 'Москва'
     ) AS r,
    (
        values('{ "Пн.", "Вт.", "Ср.", "Чт.", "Пт.", "Сб.", "Вс."}'::text[])
    ) as names(name), unnest(names.name) with ordinality as dw( name_of_day, num_of_day )
WHERE r.num_of_day = dw.num_of_day
GROUP BY r.num_of_day, dw.name_of_day
ORDER BY r.num_of_day;

select id, numbered_names.name
from (
       values('{ "Пн.", "Вт.", "Ср.", "Чт.", "Пт.", "Сб.", "Вс."}'::text[])
) as names(name), unnest(names.name) with ordinality as numbered_names(name, id);
