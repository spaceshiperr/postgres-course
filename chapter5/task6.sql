ALTER TABLE students
    DROP CONSTRAINT students_pkey CASCADE;

DELETE FROM students WHERE doc_num IS NULL OR doc_ser IS NULL;

ALTER TABLE students
    ADD CONSTRAINT students_pkey PRIMARY KEY (doc_ser, doc_num);

ALTER TABLE progress
    ADD COLUMN doc_ser numeric(4),
    ADD COLUMN doc_num numeric(6),
    ADD CONSTRAINT progress_fkey
        FOREIGN KEY (doc_ser, doc_num) REFERENCES students(doc_ser, doc_num)
        ON UPDATE CASCADE ON DELETE CASCADE;

SELECT * FROM progress;

INSERT INTO progress(record_book, subject, acad_year, term, mark, test_form, doc_ser, doc_num)
VALUES (1232, 'Physics', 3, 1, 5, 'экзамен', 4233, 555321),
       (2321, 'English', 4, 1, 2, 'экзамен', 4233, 555322);
