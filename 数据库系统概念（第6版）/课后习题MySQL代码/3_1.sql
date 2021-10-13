-- 3.1(a)
SELECT title
FROM course
WHERE dept_name =  'Comp. Sci.'
and credits = 4;
-- 3.1(b)
SELECT *
FROM 
(student join takes using(ID))
join
(instructor join teaches using(ID))
using (course_id,sec_id,semester,year);
-- 3.1(c)
SELECT max(salary)
FROM instructor;
-- 3.1(d):使用标量子查询
SELECT name
FROM instructor
WHERE salary = (SELECT max(salary)
				FROM instructor);
-- 3.1(e)
SELECT course_id,sec_id,count(ID)
FROM takes
WHERE year = 2009 and semester = 'Fall'
GROUP BY course_id,sec_id;
-- 3.1(f)
SELECT max(cnt)
FROM (SELECT count(ID) as cnt
FROM takes
WHERE year = 2009 and semester = 'Fall'
GROUP BY sec_id) as f;
-- 3.1(g)
WITH sec_enrollment as(
SELECT course_id,sec_id,count(ID) as enrollment 
FROM section natural join takes
WHERE year = 2009 and semester = 'Fall'
GROUP BY course_id,sec_id)
SELECT enrollment
FROM sec_enrollment
WHERE enrollment = (SELECT max(enrollment)
					FROM sec_enrollment);
 