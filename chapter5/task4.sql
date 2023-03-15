ALTER TABLE progress
    ADD CONSTRAINT mark_check CHECK ( mark >= 2 AND mark <= 5);

ALTER TABLE progress
    ALTER COLUMN mark
        SET DEFAULT 6;

--- no error, default is set to 6

INSERT INTO progress ( record_book, subject, acad_year, term )
VALUES (1232, 'Физика', '2016/2017',1 );

--- error, new row violates mark_check constraint
