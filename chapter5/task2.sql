DROP TABLE progress;

CREATE TABLE progress
( record_book numeric( 5 ) NOT NULL,
  subject text NOT NULL,
  acad_year text NOT NULL,
  term numeric( 1 ) NOT NULL CHECK ( term = 1 OR term = 2 ),
  mark numeric( 1 ) NOT NULL CHECK ( mark >= 3 AND mark <= 5 )
      DEFAULT 5,
  FOREIGN KEY ( record_book )
      REFERENCES students ( record_book )
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

ALTER TABLE progress
    ADD COLUMN test_form CHAR(10) NOT NULL DEFAULT 'экзамен',
    ADD CONSTRAINT check_test_form CHECK ( test_form IN ('экзамен', 'зачет'));

ALTER TABLE progress
    ADD CHECK (
            (test_form = 'экзамен' AND mark IN (2, 3, 4, 5))
            OR
            (test_form = 'зачет' AND mark IN (0, 1))
        );

ALTER TABLE progress
    DROP CONSTRAINT progress_mark_check;

INSERT INTO progress(record_book, subject, acad_year, term, mark, test_form)
VALUES (1232, 'Math', '2', 1, 2, 'экзамен');

SELECT * FROM progress;
