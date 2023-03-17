select * from seats;

insert into seats values ('733', '14B', 'Business')
on conflict (aircraft_code, seat_no) do  nothing;

insert into seats values ('733', '14B', 'Business')
on conflict on constraint seats_pkey do  nothing;

-- no rows were added
