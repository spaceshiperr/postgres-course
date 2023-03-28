-- terminal 1
begin;

select * from aircrafts_tmp where model ~ '^B' for update;

commit;


-- terminal 2
begin;

-- subset of locked rows, cannot execute, waiting
select * from aircrafts_tmp where model ~ '^Boe' for update;

-- contains the locked rows and others, cannot execute, waiting
select * from aircrafts_tmp for update;

-- intersects the locked rows, cannot execute, waiting
select * from aircrafts_tmp where range between 2000 and 6000 for update ;

-- doesnt intersect the locked rows, successfully executed
select * from aircrafts_tmp where model ~ '^A' for update ;

-- conclusion: locks on row level

commit;
