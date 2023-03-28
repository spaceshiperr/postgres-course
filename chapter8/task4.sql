-- хотим улететь с утра 16.07 и лететь максимально до полудня
-- count = 275, time: 77, 70, 74, avg: 73.(6)
select actual_departure, actual_arrival  from flights
where actual_departure > '2017-07-16 00:00:00 +00:00'::timestamptz AND actual_arrival < '2017-07-16 12:00:00 +00:00'::timestamptz
-- order by actual_departure, actual_arrival desc;

-- предположим, что нужно вылететь как можно раньше (NULL раньше тк еще не вылетел самолет)
-- и прилететь как можно позже (допустим мы любим летать на самолете)
create index flights_actual_departure_arrival_index
    on flights (actual_departure ASC NULLS FIRST, actual_arrival DESC NULLS LAST);

-- count = 275, time: 106
select actual_departure, actual_arrival from flights
where actual_departure > '2017-07-16 00:00:00 +00:00'::timestamptz AND actual_arrival < '2017-07-16 12:00:00 +00:00'::timestamptz
-- order by actual_departure, actual_arrival desc;

drop index flights_actual_departure_arrival_index;
