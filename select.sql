# 1.Query the existence of 1 course
SELECT case when (select count(id) from course where id = 1)then 'Y' else 'N' end;

# 2.Query the presence of both 1 and 2 courses
SELECT case when (select count(id) from course where id = 1) > 0 and (select count(id) from course where id = 2) > 0 then 'Y' else 'N' end;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT studentId, 'name', avg(score) as average FROM student_course LEFT JOIN student on student_course.studentId = student.id GROUP BY studentId HAVING avg(score) >=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT id, name, age, sex FROM student LEFT JOIN student_course ON (student_course.studentId = student.id) WHERE score IS NULL;

# 5.Query all SQL with grades
SELECT * FROM student_course LEFT JOIN student ON student_course.studentId = student.id;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT id, name, age, sex FROM student JOIN student_course ON (student_course.studentId = student.id AND courseId < 3) GROUP BY id HAVING count(id) > 1;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT id, name, age, sex FROM student JOIN student_course on (student_course.studentId = student.id AND courseId = 1 AND score < 60) ORDER BY score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId, avg(score) AS average FROM student_course GROUP BY courseId ORDER BY average DESC, courseId ASC;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT student.`name` FROM student JOIN student_course JOIN course ON (student_course.studentId = student.id AND student_course.courseId = course.id AND course.`name` = 'Math' AND score < 60);
