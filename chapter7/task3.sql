truncate aircrafts_tmp;

INSERT INTO aircrafts_tmp SELECT * FROM aircrafts;

-- returns all rows from the select
INSERT INTO aircrafts_tmp SELECT * FROM aircrafts RETURNING *;
