-- both fields and separate
create index flights_departure_airport_idx on flights(departure_airport);
create index flights_arrival_airport_dix on flights(arrival_airport);
create index flights_airports_idx on flights(departure_airport, arrival_airport);

-- separate since its gonna be more often requested
create index on tickets (passenger_name);
create index on tickets (ticket_no);

-- both fields
create index on seats (aircraft_code, seat_no);
