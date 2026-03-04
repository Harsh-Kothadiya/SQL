--JOIN VS APPLY

-- Drop if exists
IF OBJECT_ID('tempdb..#Employees') IS NOT NULL DROP TABLE #Employees
IF OBJECT_ID('tempdb..#Orders') IS NOT NULL DROP TABLE #Orders

-- Employees table
CREATE TABLE #Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(50)
)

-- Orders table
CREATE TABLE #Orders
(
    OrderID INT,
    EmployeeID INT,
    OrderDate DATE
)

-- Insert Employees
INSERT INTO #Employees VALUES
(1, 'Rahul'),
(2, 'Amit'),
(3, 'Neha'),
(4, 'Priya')

-- Insert Orders
INSERT INTO #Orders VALUES
(101, 1, '2026-02-01'),
(102, 1, '2026-02-10'),
(103, 2, '2026-02-05'),
(104, 3, '2026-02-07')

select '#Employees' AS 'Table_Name',* from #Employees;
select '#Orders' AS 'Table_Name',* from #Orders;

SELECT 'INNER JOIN' AS 'TYPE',
e.EmployeeID, e.EmployeeName, o.OrderID
FROM #Employees e
INNER JOIN #Orders o
    ON e.EmployeeID = o.EmployeeID


SELECT 'CROSS APPLY' AS 'TYPE',
e.EmployeeID, e.EmployeeName, o.OrderID
FROM #Employees e
CROSS APPLY
(
    SELECT  
    --TOP 1
    OrderID
    FROM #Orders o
    WHERE o.EmployeeID = e.EmployeeID
    --ORDER BY OrderDate DESC
) o
 

SELECT 'LEFT JOIN' AS 'TYPE',
e.EmployeeID, e.EmployeeName, o.OrderID
FROM #Employees e
LEFT JOIN #Orders o
    ON e.EmployeeID = o.EmployeeID

SELECT 'OUTER APPLY' AS 'TYPE',
e.EmployeeID, e.EmployeeName, o.OrderID
FROM #Employees e
OUTER APPLY
(
    SELECT
    --TOP 1
    OrderID
    FROM #Orders o
    WHERE o.EmployeeID = e.EmployeeID
    --ORDER BY OrderDate DESC
) o

/*

https://chatgpt.com/share/6995b260-8814-8013-9404-7e1d2311dfda

*/