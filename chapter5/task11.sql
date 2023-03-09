ALTER TABLE flights
    DROP CONSTRAINT flights_check1;

ALTER TABLE flights
    ADD CHECK ( actual_arrival IS NULL OR
                ( actual_departure IS NOT NULL AND actual_arrival > actual_departure
                    ) );

-- error, check violation
UPDATE flights
SET actual_departure = NULL
WHERE flight_id = 19;

SELECT * FROM flights WHERE flight_id = 19;
