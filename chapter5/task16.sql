DELETE FROM seats WHERE aircraft_code = '319' AND seat_no = '6A';

SELECT * FROM e_seats;

REFRESH MATERIALIZED VIEW e_seats;

SELECT * FROM e_seats;
