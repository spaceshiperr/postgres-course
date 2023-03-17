create temp table aircrafts_temp as
select * from aircrafts where model ~ '^B' OR model ~ '^A';

select * from aircrafts;
select * from aircrafts_temp;

copy aircrafts_temp from '/Users/dinara-tages/Documents/gitlab/postgres-course/chapter7/aircrafts.csv' with (format csv);

select * from aircrafts_temp;
