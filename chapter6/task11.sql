select * from routes;

select arrival_city
from routes
where departure_city = 'Москва' and array_length(days_of_week, 1) = 7
group by arrival_city
order by count(*) desc
limit 5;
