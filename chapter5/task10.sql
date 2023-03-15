ALTER TABLE progress
    DROP CONSTRAINT progress_fkey,
    ALTER COLUMN doc_ser
        SET DATA TYPE char(4) USING cast(doc_ser as char(4));

select * from progress;


ALTER TABLE students
    ALTER COLUMN doc_ser
        SET DATA TYPE char(4) USING cast(doc_ser as char(4));

SELECT * FROM students;
