-- economy
select fare_conditions from seats where seat_no = '14B' and aircraft_code = '733';

insert into seats values ('733', '14B', 'Business')
on conflict (aircraft_code, seat_no)
do update set fare_conditions = excluded.fare_conditions;

-- business
select fare_conditions from seats where seat_no = '14B' and aircraft_code = '733';
