--Part:1
CREATE DATABASE Group_Window_HK;
USE Group_Window_HK;

--Part:2
CREATE TABLE Employee(
	id INT IDENTITY(1,1) 
		CONSTRAINT PK_Employee_id PRIMARY KEY,

	fname varchar(10),
	dept varchar(10),
	salary INT
);

--Part:3
INSERT INTO Employee (fname,dept,salary) 
	VALUES 
	('AA','IT',40000),
	('BB','HR',30000),
	('CC','IT',50000),
	('DD','IT',60000),
	('EE','HR',40000),
	('FF','HR',50000),
	('GG','IT',40000),
	('HH','HR',30000),
	('II','IT',40000),
	('JJ','HR',30000),
	('KK','IT',50000);

SELECT * FROM Employee;

--Part:4

--GROUP BY

SELECT * FROM Employee
GROUP BY dept;


SELECT dept FROM Employee
GROUP BY dept;


SELECT fname,dept,salary FROM Employee ORDER BY Dept,salary

SELECT 
	  dept
	 ,MIN(salary) AS 'Min Salary'
	 ,MAX(salary) AS 'Max Salary'
	 ,AVG(salary) AS 'Avg Salary'
	 ,SUM(salary) AS 'Total Salary'
FROM Employee
GROUP BY dept

SELECT 
	  dept
	 ,MIN(salary) AS 'Min Salary'
	 ,MAX(salary) AS 'Max Salary'
	 ,AVG(salary) AS 'Avg Salary'
	 ,SUM(salary) AS 'Total Salary'
	 ,COUNT(*) AS 'Number of Employee this department'
FROM Employee
GROUP BY dept

--Having
--Part:5
SELECT 
	  dept
	 ,MIN(salary) AS 'Min Salary'
	 ,MAX(salary) AS 'Max Salary'
	 ,AVG(salary) AS 'Avg Salary'
	 ,SUM(salary) AS 'Total Salary'
	 ,COUNT(*) AS 'Number of Employee this department'
FROM Employee
GROUP BY dept
HAVING MAX(salary) > 50000

--Part: 6

--issue
--all column with max salary find
SELECT *,MAX(salary) FROM Employee 

--all column with max salary find using over function
SELECT *, 

MAX(salary) OVER() AS 'MAX Salary'

FROM Employee

--ORDER BY (SELECT NULL) using
SELECT *, 
 
MAX(salary) OVER(ORDER BY (SELECT NULL)) 'MAX Salary'

FROM Employee

--all column with running total find using over function based on employee id
SELECT *, 
 
SUM(salary) OVER(ORDER BY id) 'Running Total'

FROM Employee

--ROW_NUMBER
SELECT *,
	ROW_NUMBER()
	OVER(
		ORDER BY (SELECT NULL)
	) AS 'ROW_NUMBER'
FROM Employee;

SELECT *,
	ROW_NUMBER()
	OVER(
		ORDER BY dept ASC
	)AS 'ROW_NUMBER'
FROM Employee;

SELECT *,
	ROW_NUMBER()
	OVER(
		PARTITION BY dept
		ORDER BY fname DESC
	) AS 'ROW_NUMBER'
FROM Employee;

SELECT *,

	ROW_NUMBER()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'ROW_NUMBER'

FROM Employee;




--RANK

SELECT *,
	RANK()
	OVER(
		ORDER BY (SELECT (NULL))
	)AS 'RANK'

FROM Employee;

SELECT *,

	RANK()
	OVER(
		ORDER BY dept ASC
	)AS 'RANK'

FROM Employee;

SELECT *,

	RANK()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'RANK'

FROM Employee;


--DENSE_RANK

SELECT *,
	DENSE_RANK()
	OVER(
		ORDER BY (SELECT (NULL))
	)AS 'DENSE_RANK'

FROM Employee;

SELECT *,

	DENSE_RANK()
	OVER(
		ORDER BY dept ASC
	)AS 'DENSE_RANK'

FROM Employee;

SELECT *,

	DENSE_RANK()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'DENSE_RANK'

FROM Employee;




SELECT *,
	ROW_NUMBER()
	OVER(
		ORDER BY dept ASC
	)AS 'ROW_NUMBER',

	RANK()
	OVER(
		ORDER BY dept ASC
	)AS 'RANK',

	DENSE_RANK()
	OVER(
		ORDER BY dept ASC
	)AS 'DENSE_RANK'

FROM Employee;

--ROW_NUMBER,RANK,DENSE_RANK
SELECT *,
	ROW_NUMBER()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'ROW_NUMBER',

	RANK()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'RANK',

	DENSE_RANK()
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	)AS 'DENSE_RANK'

FROM Employee;



--LAG

SELECT 
	  
	 fname
	,dept
	,salary
	
	,LAG(salary,1)
		OVER(
			PARTITION BY dept
			ORDER BY salary DESC
		) AS 'Previous ONE row value'

	,LAG(salary,2)
		OVER(
			PARTITION BY dept
			ORDER BY salary DESC
		) AS 'Previous TWO row value'
FROM Employee;



--LEAD

SELECT 
	  
	 fname
	,dept
	,salary
	
	,LEAD(salary,1)
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	) AS 'Next ONE row value'
	
	,LEAD(salary,2)
	OVER(
		PARTITION BY dept
		ORDER BY salary DESC
	) AS 'Next TWO row value'

FROM Employee;

--FIRST_VALUE  
SELECT 
	  
	 fname
	,dept
	,salary
	
	,FIRST_VALUE(salary)
		OVER(
			PARTITION BY dept
			ORDER BY salary DESC
		) AS 'First value in partition'
 

FROM Employee;


--LAST_VALUE

SELECT 
	  
	 fname
	,dept
	,salary
	
 

	,LAST_VALUE(salary)
		OVER(
			PARTITION BY dept
			ORDER BY salary DESC
			 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS 'Last value in partition'

FROM Employee;

