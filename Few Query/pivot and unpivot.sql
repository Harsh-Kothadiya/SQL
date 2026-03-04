--pivot and unpivot

DROP TABLE IF EXISTS #Temp_SalesData;
DROP TABLE IF EXISTS #temp2;

CREATE TABLE #Temp_SalesData (
    EmployeeName VARCHAR(50),
    MonthName    VARCHAR(20),
    Amount       INT
);

INSERT INTO #Temp_SalesData (EmployeeName, MonthName, Amount)
VALUES
('Rahul', 'Jan', 1000),
('Rahul', 'Feb', 1500),
('Amit',  'Jan', 2000),
('Amit',  'Feb', 2500),
('Rahul', 'Mar', 1800);

--main table
SELECT 'main table' AS 'table name',* FROM #Temp_SalesData ORDER BY EmployeeName;

--pivot table use for row to column
SELECT 'pivot table' AS 'table name', EmployeeName,Jan,Feb,Mar FROM
(
SELECT EmployeeName,MonthName,Amount
FROM #Temp_SalesData
)AS sourceTable
PIVOT
(
    SUM(Amount)
    FOR MonthName IN ([Jan],[Feb],[Mar])
)AS PivotTable;


--pivot table ans store #temp2
SELECT EmployeeName,Jan,Feb,Mar INTO #temp2 FROM
(
SELECT EmployeeName,MonthName,Amount
FROM #Temp_SalesData
)AS sourceTable
PIVOT
(
    SUM(Amount)
    FOR MonthName IN ([Jan],[Feb],[Mar])
)AS PivotTable;

SELECT '#temp2' AS 'table name',* FROM #temp2;

--UNPIVOT use for column to row

SELECT 'Un-pivot table' AS 'table name',EmployeeName,MonthName,Amount FROM
(
    SELECT EmployeeName,Jan,Feb,Mar
    FROM #temp2
)AS sourceData
UNPIVOT(
    Amount
    FOR MonthName IN (Jan,Feb,Mar)
)AS UNPIVOTEDDATE




/*

https://chatgpt.com/share/69958477-fe00-8013-9738-495fcde71bc5

https://dotnettutorials.net/lesson/pivot-and-unpivot-sql-server/

*/