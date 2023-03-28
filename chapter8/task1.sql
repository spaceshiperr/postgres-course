alter table flights
    alter column flight_no
        drop not null,
    alter column scheduled_departure
        drop not null;

-- it will be a success since null values are not unique
insert into flights values (397121, NULL, '2017-08-25 11:50:00.000000 +00:00'::timestamptz, '2017-08-25 14:35:00.000000 +00:00'::timestamptz,
                            'VKO', 'HMA', 'Scheduled', 'CR2');
