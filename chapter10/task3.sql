BEGIN;

CREATE TEMP TABLE aircrafts_tmp
( LIKE aircrafts INCLUDING CONSTRAINTS INCLUDING INDEXES);

CREATE TEMP TABLE aircrafts_log AS
SELECT * FROM aircrafts WITH NO DATA;

ALTER TABLE aircrafts_log
    ADD COLUMN when_add timestamp default current_timestamp;
ALTER TABLE aircrafts_log
    ADD COLUMN operation text;

-- adds CTE nodes into the plan tree
EXPLAIN WITH add_row AS
         ( INSERT INTO aircrafts_tmp
             SELECT * FROM aircrafts
             RETURNING * )
INSERT INTO aircrafts_log(aircraft_code, model, range, operation)
SELECT add_row.aircraft_code, add_row.model, add_row.range, 'INSERT'
FROM add_row;

ROLLBACK;
