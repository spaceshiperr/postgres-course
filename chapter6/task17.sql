select * from boarding_passes;

select a.aircraft_code, a.model, s.fare_conditions, count(*)
from seats s
join aircrafts a on s.aircraft_code = a.aircraft_code
group by a.aircraft_code, s.fare_conditions
order by a.aircraft_code;
