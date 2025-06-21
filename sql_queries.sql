-- creating table according to csv files so we can import them later

create table student ( student_id serial primary key, name varchar(225), email varchar(225));

CREATE TABLE Attendance ( student_id INTEGER REFERENCES Student(student_id), session_id INTEGER REFERENCES Session(session_id), PRIMAR
Y KEY (student_id, session_id) );

CREATE TABLE Session ( session_id SERIAL PRIMARY KEY, date DATE, instructor VARCHAR
(255), module VARCHAR(255) );

-- import data from csv

COPY Student(student_id, name, email) FROM 'D:/mmm/mmm/2024-2025 4SAE1/go my code project/Task 2/students.csv' DELIMITER ',' CSV HEADE
R;

COPY Session(session_id, date, instructor, module) FROM 'D:/mmm/mmm/2024-2025 4SAE1/go my code project/Task 2/sessions.csv' DELIMITER
',' CSV HEADER;

COPY Attendance(student_id, session_id) FROM 'D:/mmm/mmm/2024-2025 4SAE1/go my code project/Task 2/attendance.csv' DELIMITER ',' CSV H
EADER;


--Q1
SELECT s.*
FROM Session s
JOIN Attendance a ON s.session_id = a.session_id
JOIN Student st ON a.student_id = st.student_id
WHERE st.name = 'Alice';


--Q2
SELECT st.name, COUNT(a.session_id) AS numberOfSessionsAttended
FROM Student st
JOIN Attendance a ON st.student_id = a.student_id
GROUP BY st.name
ORDER BY numberOfSessionsAttended DESC
LIMIT 3;

--Q3
SELECT s.session_id, s.module, COUNT(a.student_id) AS numberOfStudents
FROM Session s
JOIN Attendance a ON s.session_id = a.session_id
GROUP BY s.session_id, s.module
ORDER BY s.session_id;

--Q4
SELECT s.module, COUNT(DISTINCT a.student_id) AS numberOfUniqueStudents
FROM Session s
JOIN Attendance a ON s.session_id = a.session_id
GROUP BY s.module
ORDER BY s.module;


--Q5
SELECT st.*
FROM Student st
LEFT JOIN Attendance a ON st.student_id = a.student_id
WHERE a.student_id IS NULL;
