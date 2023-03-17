WITH add_row AS
         ( INSERT INTO aircrafts_tmp
             SELECT * FROM aircrafts
             RETURNING aircraft_code, model, range,
                         current_timestamp, 'INSERT'
         )
INSERT INTO aircrafts_log
SELECT add_row.*  FROM add_row;


truncate aircrafts_tmp;
truncate aircrafts_log;

select * from aircrafts_log;
