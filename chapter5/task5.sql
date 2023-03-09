ALTER TABLE students
    ADD CONSTRAINT students_doc_ser_unique UNIQUE (doc_ser),
    ADD CONSTRAINT students_doc_num_unique UNIQUE (doc_num);

INSERT INTO students(record_book, name, doc_ser, doc_num)
VALUES (123, 'Felicia', 9320, NULL),
       (124, 'Davide', 9321, NULL);

INSERT INTO students(record_book, name, doc_ser, doc_num)
VALUES (125, 'Marzia', NULL, NULL),
       (126, 'Jorgio', NULL, NULL);
--- both passed since null values are not counted as equals

SELECT * FROM students;

SELECT (null = null); -- returns null, not true
