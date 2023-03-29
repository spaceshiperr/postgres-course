begin;

explain
insert into aircrafts_tmp
values ('82H', 'New Model 777', 5000);

explain
update aircrafts_tmp
set range = 5000
where aircraft_code = '320';

rollback;
