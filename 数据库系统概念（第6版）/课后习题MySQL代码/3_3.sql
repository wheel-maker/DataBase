-- 3.3(a) 给Comp.Sci. 系的每位教师涨10%的薪资
UPDATE instructor
SET salary = salary *1.1
WHERE dept_name = 'Comp.Sci. ';

-- 3.3(b) 删除所有未曾开设过的课程
DELETE FROM course
WHERE course_id not in(SELECT distinct course_id FROM section);

-- 3.3(c) 把每个在tot_cred属性上取值超过100的学生作为同系的教师插入，工资为10000美元
INSERT INTO instructor
	SELECT ID,name,dept_name,10000
    FROM student
    WHERE tot_cred > 100;