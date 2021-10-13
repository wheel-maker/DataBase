-- 创建grade_points关系
CREATE TABLE grade_points
(grade	varchar(2),
points	numeric(2,1),
primary key(grade)
);
-- 添加元组
INSERT INTO grade_points
	VALUES('A' , 4.0),
		  ('A-', 3.7),
          ('B+', 3.3),
          ('B ', 3.0),
          ('B-', 2.7),
          ('C+', 2.3),
          ('C ', 2.0),
          ('C-', 1.7),
          ('F ', 1.0)
    ;
-- 3.2(a) 根据ID为12345的学生所选修的所有课程，找出该生所获得的等级分值的综合
(SELECT sum(credits*points) as score
FROM  takes natural join course natural join grade_points
WHERE ID = 12345)
union
(SELECT 0
FROM student
WHERE not exists(SELECT * FROM student natural join takes)
);

-- 3.2(b) 找出上述学生等级分值的平均值gpa，即总等级分值除以总学分
-- 注意考虑学生没有修过任何课程的情形或者使用左外连接
(SELECT sum(credits*points)/sum(credits) as gpa
FROM  takes natural join course natural join grade_points
WHERE ID = 12345)
union
(SELECT null as gpa
FROM student
WHERE not exists(SELECT * FROM student natural join takes)
);
-- 3.3(c) 找出每个学生的ID和等级分值的平均值
-- 注意未选课程的学生的表示方法
(SELECT ID, sum(credits*points)/sum(credits) as gpa
FROM takes natural join course natural join grade_points
GROUP BY ID)
union 
(SELECT ID,null as gpa
FROM student
WHERE not exists(SELECT * FROM takes WHERE takes.ID = student.ID)
);