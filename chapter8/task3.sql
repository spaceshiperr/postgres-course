-- without an index

-- count = 17291, time: 281 ms, 141 ms, 157 ms, 135 ms, avg: 178.5 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Comfort';

-- count = 107642, time: 130 ms, 132 ms, 136 ms, 147 ms, avg: 136.25 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Business';

-- count = 920793, time: 157 ms, 157 ms, 165 ms, 154 ms, avg: 158.25 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Economy';

-- with an index
create index on ticket_flights (fare_conditions);

-- time: 40 ms, 23 ms, 28 ms, 24 ms, avg: 28.75 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Comfort';

-- time: 37 ms, 29 ms, 29 ms, 40 ms, avg: 33.75 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Business';

-- time: 94ms, 93 ms, 93 ms, 84 ms, avg: 91 ms
SELECT count( * )
FROM ticket_flights
WHERE fare_conditions = 'Economy';
