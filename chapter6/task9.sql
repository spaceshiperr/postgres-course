SELECT count( * )
FROM routes
WHERE departure_city = 'Москва'
  AND arrival_city = 'Санкт-Петербург';

select departure_city, arrival_city, count(*)
from routes
where departure_city = 'Москва'
group by departure_city, arrival_city
order by count(*) desc
limit 1;
