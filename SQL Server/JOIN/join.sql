USE harshDb;

CREATE TABLE T1(
	 ID_T1 INT
	,detail_T1 VARCHAR(MAX)
)

INSERT INTO T1(ID_T1,detail_T1)
VALUES
	 (1,'AA')
	,(2,'BB')
	,(3,'CC')

SELECT * FROM T1;

CREATE TABLE T2(
	 ID_T2 INT
	,detail_T2 VARCHAR(MAX)
	,ID_T1 INT
);

INSERT INTO T2(ID_T2,detail_T2,ID_T1)
VALUES
	 (101,'AAA',1)
	,(102,'BBB',2)
	,(103,'CCC',4)
	,(104,'DDD',5)
	,(105,'EEE',6);

SELECT * FROM T2;

---------------------------------------------------
SELECT * FROM T1;


SELECT * FROM T2;

--INNER JOIN

SELECT * 

FROM T1

INNER JOIN T2
ON T1.ID_T1 = T2.ID_T1;

--LEFT JOIN

SELECT * 

FROM T1

LEFT JOIN T2
ON T1.ID_T1 = T2.ID_T1


--RIGHT JOIN

SELECT * 

FROM T1

RIGHT JOIN T2
ON T1.ID_T1 = T2.ID_T1	

--FULL JOIN

SELECT * 

FROM T1

FULL JOIN T2
ON T1.ID_T1 = T2.ID_T1

--CROSS JOIN 

SELECT * 

FROM T1

CROSS JOIN T2
 
--LEFT ANTI JOIN (T1 − T2) Only T1

--method-1
SELECT T1.* 

FROM T1

LEFT JOIN T2
ON T1.ID_T1 = T2.ID_T1

WHERE T2.ID_T1 IS NULL;



--method-2
SELECT * FROM T1 
WHERE ID_T1 NOT IN (SELECT ID_T1 FROM T2)




--RIGHT ANTI JOIN (T1 − T2) Only T2

--Method--1
SELECT T2.* 

FROM T1

RIGHT JOIN T2
ON T1.ID_T1 = T2.ID_T1

WHERE T1.ID_T1 IS NULL;


--Method--2

SELECT * FROM T2
WHERE ID_T1 NOT IN (SELECT ID_T1 FROM T1)






--below table self join understanding
CREATE TABLE T3_Self(
	 ID_T3 INT,
	 detail_T3 VARCHAR(50),
	 ParentID INT
);

INSERT INTO T3_Self(ID_T3, detail_T3, ParentID)
VALUES
	(1, 'AA', NULL),
	(2, 'BB', 1),
	(3, 'CC', 1),
	(4, 'DD', 2),
	(5, 'EE', 3);

SELECT * FROM T3_Self;



--All rows
SELECT 
	child.ID_T3     AS Child_ID,
	child.detail_T3 AS Child_Name,
	parent.ID_T3    AS Parent_ID,
	parent.detail_T3 AS Parent_Name
FROM T3_Self child
LEFT JOIN T3_Self parent
	ON child.ParentID = parent.ID_T3;



-- Only rows having a parent
SELECT 
	child.ID_T3 AS Child_ID,
	child.detail_T3 AS Child_Name,
	parent.ID_T3    AS Parent_ID,
	parent.detail_T3 AS Parent_Name
FROM T3_Self child
INNER JOIN T3_Self parent
	ON child.ParentID = parent.ID_T3;


--EQUI JOIN
SELECT *
FROM T1
JOIN T2
    ON T1.ID_T1 = T2.ID_T1;

--NON-EQUI JOIN
SELECT *
FROM T1
JOIN T2
    ON T1.ID_T1 < T2.ID_T1;


------------------------------------------------------------------------------------------------------------------------
CREATE TABLE T4(
	 ID_T4 INT
	,details_T4 VARCHAR(MAX)
);

INSERT INTO T4 (ID_T4,details_T4) 
VALUES
	 (1,'AA')
	,(2,'BB')
	,(3,'CC');

SELECT * FROM T4;


CREATE TABLE T5(
	 ID_T5 INT
	,details_T5 VARCHAR(MAX)
	,ID_T4 INT
);

INSERT INTO T5 (ID_T5,details_T5,ID_T4)
VALUES
	 (101,'AAA',1)
	,(102,'BBB',2)
	,(103,'CCC',1)
	,(104,'DDD',4)
	,(105,'EEE',5)
	,(106,'FFF',2);

SELECT * FROM T5;


SELECT * FROM T4;



SELECT * FROM T5;



--INNER JOIN
SELECT * FROM T4
INNER JOIN T5
ON T4.ID_T4 = T5.ID_T4






--LEFT SEMI JOIN
SELECT * FROM T4 WHERE EXISTS(SELECT 1 FROM T5 WHERE T5.ID_T4 = T4.ID_T4)

--RIGHT SEMI JOIN
SELECT * FROM T5 WHERE EXISTS(SELECT 1 FROM T4 WHERE T4.ID_T4 = T5.ID_T4)