ALTER TABLE students
    ADD CHECK(name <> '');

INSERT INTO students(record_book, name, doc_ser, doc_num) -- error
VALUES (4324, '', 8943, 828322);

INSERT INTO students(record_book, name, doc_ser, doc_num) -- success
VALUES (4324, 'Mario', 8943, 828322);

INSERT INTO students(record_book, name, doc_ser, doc_num) -- success, should be error
VALUES (4324, '   ', 8944, 828325);

SELECT * FROM students;

DELETE FROM students WHERE doc_ser = '8944' AND doc_num = 828325;

ALTER TABLE students
    DROP CONSTRAINT students_name_check,
    ADD CHECK ( trim(name) <> '' );

INSERT INTO students(record_book, name, doc_ser, doc_num) -- error
VALUES (4324, '   ', 8944, 828325);
