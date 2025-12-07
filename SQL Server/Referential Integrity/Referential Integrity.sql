--Step:1
--create data base
CREATE DATABASE [Referential Integrity];

--use data base
USE [Referential Integrity];

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Set:2 --NO ACTION

CREATE TABLE Parent(
	Parent_Id INT IDENTITY(1,1),
	Parent_Code NVARCHAR(5)
		CONSTRAINT PK_Tb_Parent_Col_Parent_Code PRIMARY KEY,
	Parent_Name NVARCHAR(15),
	Parent_Email NVARCHAR(20)
);

INSERT INTO Parent (Parent_Code,Parent_Name,Parent_Email)
VALUES 
	('P-101','P1','p1@gmail.com'),
	('P-102','P2','p2@gmail.com'),
	('P-103','P3','p3@gmail.com'),
	('P-104','P4','p4@gmail.com');
	
SELECT * FROM Parent;


CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	Parent_Code NVARCHAR(5)
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
);

INSERT INTO Child (Child_Name,Child_Email,Parent_Code)
VALUES
	('C1','c1@gmail.com','P-101'),
	('C2','c2@gmail.com','P-102'),
	('C3','c3@gmail.com','P-101'),
	('C4','c4@gmail.com','P-103'),
	('C5','c5@gmail.com','P-102'),
	('C6','c6@gmail.com','P-101'),
	('C7','c7@gmail.com','P-104');

SELECT * FROM Child;


SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;


DELETE FROM Parent WHERE Parent_id = 1;

UPDATE Parent
SET Parent_Code = 'P-501'
WHERE Parent_id = 1;

--now drop child table and changes
DROP TABLE Child;

CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	Parent_Code NVARCHAR(5)
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

INSERT INTO Child (Child_Name,Child_Email,Parent_Code)
VALUES
	('C1','c1@gmail.com','P-101'),
	('C2','c2@gmail.com','P-102'),
	('C3','c3@gmail.com','P-101'),
	('C4','c4@gmail.com','P-103'),
	('C5','c5@gmail.com','P-102'),
	('C6','c6@gmail.com','P-101'),
	('C7','c7@gmail.com','P-104');

SELECT * FROM Child;



SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;


DELETE FROM Parent WHERE Parent_id = 1;

UPDATE Parent
SET Parent_Code = 'P-501'
WHERE Parent_id = 1;

--Step: 3 SET NULL use but FK COLUMN NOT NULL
--Parent table same only child table changes 
--so child table delete and create few modification but same data 

DROP TABLE Child;

CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	Parent_Code NVARCHAR(5) NOT NULL
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
		ON DELETE SET NULL
		ON UPDATE SET NULL
);	


--Step: 4 SET NULL use but now FK COLUMN NULL
--Parent table same only child table changes 
--so child table delete and create few modification but same data 

DROP TABLE Child;

CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	Parent_Code NVARCHAR(5) NULL
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
		ON DELETE SET NULL
		ON UPDATE SET NULL
);	

INSERT INTO Child (Child_Name,Child_Email,Parent_Code)
VALUES
	('C1','c1@gmail.com','P-101'),
	('C2','c2@gmail.com','P-102'),
	('C3','c3@gmail.com','P-101'),
	('C4','c4@gmail.com','P-103'),
	('C5','c5@gmail.com','P-102'),
	('C6','c6@gmail.com','P-101'),
	('C7','c7@gmail.com','P-104');

SELECT * FROM Child;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;


DELETE  FROM Parent WHERE Parent_Id = 1;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

UPDATE Parent
SET Parent_Name = 'p500'
where Parent_Id = 2

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

UPDATE Parent
SET Parent_Code = 'P-501'
where Parent_Id = 2

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

--Step: 5 SET DEFAULT 
--now Parent table and child table both table drop and both table same data with created
--only child table modification

DROP TABLE Child;
DROP TABLE Parent;


CREATE TABLE Parent(
	Parent_Id INT IDENTITY(1,1),
	Parent_Code NVARCHAR(5)
		CONSTRAINT PK_Tb_Parent_Col_Parent_Code PRIMARY KEY,
	Parent_Name NVARCHAR(15),
	Parent_Email NVARCHAR(20)
);

INSERT INTO Parent (Parent_Code,Parent_Name,Parent_Email)
VALUES 
	('P-101','P1','p1@gmail.com'),
	('P-102','P2','p2@gmail.com'),
	('P-103','P3','p3@gmail.com'),
	('P-104','P4','p4@gmail.com');
	
SELECT * FROM Parent;

CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	
	Parent_Code NVARCHAR(5)
		CONSTRAINT DF_Tb_Child_Col_Parent_Code
			DEFAULT 'DF-01',
		
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
		ON DELETE SET DEFAULT
		ON UPDATE SET DEFAULT
);	

INSERT INTO Child (Child_Name,Child_Email,Parent_Code)
VALUES
	('C1','c1@gmail.com','P-101'),
	('C2','c2@gmail.com','P-102'),
	('C3','c3@gmail.com','P-101'),
	('C4','c4@gmail.com','P-103'),
	('C5','c5@gmail.com','P-102'),
	('C6','c6@gmail.com','P-101'),
	('C7','c7@gmail.com','P-104');

SELECT * FROM Child;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

DELETE FROM Parent WHERE Parent_Id = 1;

UPDATE Parent
SET Parent_Code = 'U-501'
WHERE Parent_Id = 1;


--above delete / update error so 2 solution
--sol:1 child table only existing value set
--sol:2 insert default value in parent table

--i am going sol:2 

INSERT INTO Parent (Parent_Name,Parent_Code,Parent_Email)
VALUES ('Default','DF-01','DF@gmail.com');

SELECT * FROM Parent ORDER BY Parent_Id;

--now above delete/ update 

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

DELETE FROM Parent WHERE Parent_Id = 1;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

UPDATE Parent
SET Parent_Code = 'U-501'
WHERE Parent_Id = 2;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

--Step: 6 CASCADE 
--now Parent table and child table both table drop and both table same data with created
--only child table modification

DROP TABLE Child;

DROP TABLE Parent;

CREATE TABLE Parent(
	Parent_Id INT IDENTITY(1,1),
	Parent_Code NVARCHAR(5)
		CONSTRAINT PK_Tb_Parent_Col_Parent_Code PRIMARY KEY,
	Parent_Name NVARCHAR(15),
	Parent_Email NVARCHAR(20)
);

INSERT INTO Parent (Parent_Code,Parent_Name,Parent_Email)
VALUES 
	('P-101','P1','p1@gmail.com'),
	('P-102','P2','p2@gmail.com'),
	('P-103','P3','p3@gmail.com'),
	('P-104','P4','p4@gmail.com');
	
SELECT * FROM Parent;


CREATE TABLE Child(
	Child_Id INT IDENTITY(1,1),
	Child_Name NVARCHAR(15),
	Child_Email NVARCHAR(20),
	Parent_Code NVARCHAR(5)
		CONSTRAINT FK_Tb_Child_Col_Parent_Code_PK_Tb_Parent_Col_Parent_Code
		FOREIGN KEY (Parent_Code) REFERENCES Parent(Parent_Code)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

INSERT INTO Child (Child_Name,Child_Email,Parent_Code)
VALUES
	('C1','c1@gmail.com','P-101'),
	('C2','c2@gmail.com','P-102'),
	('C3','c3@gmail.com','P-101'),
	('C4','c4@gmail.com','P-103'),
	('C5','c5@gmail.com','P-102'),
	('C6','c6@gmail.com','P-101'),
	('C7','c7@gmail.com','P-104');

SELECT * FROM Child;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;

DELETE FROM Parent WHERE Parent_Id = 1;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;


UPDATE Parent
SET Parent_Code = 'H-501'
WHERE Parent_Id = 2;

SELECT 'Parent' AS 'Table_Name',* FROM Parent;
SELECT 'Child' AS 'Table_Name',* FROM Child;
