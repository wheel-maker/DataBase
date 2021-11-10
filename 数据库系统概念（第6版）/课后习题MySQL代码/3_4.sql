-- (a)统计2009年车辆出国交通事故的人员总数
SELECT count(driver_id)
FROM participated natural join accident
WHERE date = 2009;

-- (b)向数据库中添加新的事故，每个必须的属性可以定义任意值
INSERT INTO accident(report_number)
	VALUES('1000001');