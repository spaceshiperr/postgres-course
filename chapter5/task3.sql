ALTER TABLE progress
    ALTER COLUMN term
        DROP NOT NULL;

INSERT INTO progress(record_book, subject, acad_year, term, mark, test_form)
VALUES (1232, 'Math', '2', NULL, 2, 'экзамен');

SELECT * FROM progress;

UPDATE progress
SET term = 2
WHERE record_book = 1232;

ALTER TABLE progress
    ALTER COLUMN term
        SET NOT NULL;


