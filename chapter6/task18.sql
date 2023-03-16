with counts as (
    select count(r.aircraft_code) as num_routes
    from routes r
    right join aircrafts a on r.aircraft_code = a.aircraft_code
    group by a.aircraft_code, a.model, r.aircraft_code
), total_sum as (
    select sum(num_routes) as sum
    from counts
)
select a.aircraft_code as a_code, a.model, r.aircraft_code as r_code,
       count(r.aircraft_code) as num_routes,
       round(count(r.aircraft_code)/t.sum, 3) as sum
from routes r
right join aircrafts a on r.aircraft_code = a.aircraft_code,
    total_sum t
group by a.aircraft_code, a.model, r.aircraft_code, t.sum
order by num_routes desc
