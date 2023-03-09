CREATE TABLE subjects (
    subject_id int PRIMARY KEY,
    subject text UNIQUE
);

INSERT INTO subjects
VALUES (1, 'Mathematics'),
       (2, 'Computer Science'),
       (3, 'History'),
       (4, 'English'),
       (5, 'Physics'),
       (0, 'Unknown');

SELECT * FROM subjects;

ALTER TABLE progress
    ALTER COLUMN subject SET DATA TYPE integer
    USING (
        CASE WHEN subject = 'Math' THEN 1
             WHEN subject = 'Physics' THEN 5
             WHEN subject = 'English' THEN 4
            ELSE 0
        END
    );

SELECT * FROM progress;

ALTER TABLE progress
    RENAME COLUMN subject TO subject_id;

ALTER TABLE progress
    ADD CONSTRAINT progress_subject_id_fkey
        FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

INSERT INTO progress
VALUES (3212, 2, 3, 1, 4, 'экзамен', 4233, 555322);
