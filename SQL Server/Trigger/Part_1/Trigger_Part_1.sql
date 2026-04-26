--Trigger Part:1


--Step:1 -->Create database
CREATE DATABASE HK_Trigger;

--Step:2 -->Use database
USE HK_Trigger;

--Step:3 -->Create Table and insert data

CREATE TABLE Person(
	Person_Id INT,
	Person_Fname VARCHAR(10),
	Person_Lname VARCHAR(10),
	Person_Email VARCHAR(20)
);
INSERT INTO Person(Person_Id,Person_Fname,Person_Lname,Person_Email)
VALUES 
	(1,'F-1','L-1','FL-1.@gmail.com'),
	(2,'F-2','L-2','FL-2.@gmail.com'),
	(3,'F-3','L-3','FL-3.@gmail.com');

SELECT * FROM Person;

--Step:4 INSTEAD OF Trigger 
CREATE TRIGGER TR_Person_INSTEAD_OF_INSERT
ON Person
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Person(Person_Id,Person_Fname,Person_Lname,Person_Email)
	VALUES (500,'F-500','L-500','FL-500.@gmail.com')
END
GO

SELECT * FROM Person;

--Step:5 Normal Insert	
	INSERT INTO Person(Person_Id,Person_Fname,Person_Lname,Person_Email)
	VALUES (5,'F-5','L-5','FL-5.@gmail.com')

--here F-5 not insert because INSTEAD OF Trigger fire
SELECT * FROM Person; 

--INSTEAD OF Trigger use for UPDATE
CREATE TRIGGER TR_Person_INSTEAD_OF_UPDATE
ON Person
INSTEAD OF UPDATE
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Person
	SET Person_Fname = 'Harsh'
	WHERE Person_Id = 1;

END
GO

SELECT * FROM Person;

--normal Update

UPDATE Person
SET Person_Fname = 'hk'
WHERE Person_Id = 1;

SELECT * FROM Person;

--here hk not update because INSTEAD OF fire

--INSTEAD OF Trigger use for DELETE
CREATE TRIGGER TR_Person_INSTEAD_OF_DELETE
ON Person
INSTEAD OF DELETE
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM Person WHERE Person_Id = 3;
END
GO

SELECT * FROM Person;

--normal delete

DELETE FROM Person WHERE Person_Id = 500;

SELECT * FROM Person;

--here not delete 500 id 
--because INSTEAD OF trigger using

--Step:6 new table create

CREATE TABLE Employee(
	Emp_Id INT,
	Emp_Fname VARCHAR(10),
	Emp_Lname VARCHAR(10),
	Emp_Email VARCHAR(20)
);
INSERT INTO Employee (Emp_Id,Emp_Fname,Emp_Lname,Emp_Email)
VALUES 
	(1,'EF-1','LF-1','EF-1-@gmail.com'),
	(2,'EF-2','LF-2','EF-2-@gmail.com'),
	(3,'EF-3','LF-3','EF-3-@gmail.com'),
	(4,'EF-4','LF-4','EF-4-@gmail.com');

SELECT * FROM Employee;

--After Trigger for Insert

CREATE TRIGGER TR_Employee_After_Insert
ON Employee
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	PRINT 'You Can Not Insert Data..';
	ROLLBACK TRANSACTION;

END
GO

SELECT * FROM Employee;

INSERT INTO Employee (Emp_Id,Emp_Fname,Emp_Lname,Emp_Email)
VALUES 
	(1000,'EF-1000','LF-1000','EF-1000-@gmail.com');

SELECT * FROM Employee;

--After Trigger for Update

CREATE TRIGGER TR_Employee_After_Update
ON Employee
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	PRINT 'You Can Not Update Data..';
	ROLLBACK TRANSACTION;

END
GO

SELECT * FROM Employee;

UPDATE Employee
SET Emp_Fname = 'harsh'
WHERE Emp_Id = 4;

SELECT * FROM Employee;

--After Trigger for Delete

CREATE TRIGGER TR_Employee_After_Delete
ON Employee
AFTER Delete
AS
BEGIN
	SET NOCOUNT ON;

	PRINT 'You Can Not Delete Data..';
	ROLLBACK TRANSACTION;

END
GO

SELECT * FROM Employee;


DELETE FROM Employee WHERE Emp_Id = 1;


SELECT * FROM Employee;