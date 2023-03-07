CREATE TABLE students
(  record_book numeric( 5 ) NOT NULL,
   name text NOT NULL,
   doc_ser numeric( 4 ),
   doc_num numeric( 6 ),
   who_adds_row text DEFAULT current_user,
   when_adds_row timestamp DEFAULT current_timestamp,
   PRIMARY KEY (record_book)
);

insert into students(record_book, name, doc_ser, doc_num) values (1232, 'name', 4233, 555322);

select * from students;

drop table students;
