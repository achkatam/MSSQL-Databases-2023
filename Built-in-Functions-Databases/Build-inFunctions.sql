SELECT c.CustomerID,
	c.FirstName,
	c.LastName,
	LEFT(PaymentNumber, 6) + '*********'
FROM [Customers] AS c

--CHARINDEX
SELECT CHARINDEX('Soft','SoftUniSoft',1)

--STUFF
SELECT STUFF('SoftUniSoft', 4, 0, 'b')

SELECT t.Id,
	(t.A*t.B)/2 AS AREA
FROM [Triangles] AS t

SELECT PI()

SELECT ABS(-214)

SELECT SQRT(4)

SELECT SQUARE(6)

SELECT 
	Id,
	SQRT(SQUARE(X1-X2) + SQUARE(Y1-Y2))
FROM Lines 

SELECT POWER(11.1,3)

SELECT ROUND(1111.123,2)

SELECT FLOOR(211.6)

SELECT CEILING(211.6)

SELECT CEILING(
	CEILING(
		CAST(Quantity AS float) / BoxCapacity) / PalletCapacity)
		AS [Number of pallets]
FROM Products

SELECT SIGN(211)

SELECT SIGN(-211)

SELECT SIGN(0)


USE [SoftUni]

SELECT DATEDIFF(YEAR, '2011', '2022')

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.LastName,
	DATEDIFF(YEAR, e.HireDate, '2023') AS [Years In Service]
FROM Employees AS e

SELECT DATENAME(YEAR, '2022-12-12')

SELECT DATENAME(WEEKDAY, '2022-12-12')

SELECT EOMONTH('2022-12-12')

--Display 'Not finished' for projects with no EndDate

SELECT 
	P.ProjectID,
	P.Name,
	ISNULL(CAST(EndDate AS VARCHAR), 'Not Finished')
FROM Projects AS p

SELECT COALESCE(NULL,'YAR')

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.LastName
FROM Employees AS e
ORDER BY e.EmployeeID
	OFFSET 10 ROWS
	FETCH NEXT 5 ROWS ONLY

SELECT TOP(20)
	ROW_NUMBER() OVER (ORDER BY Salary) AS RownNumber
	,RANK() OVER (ORDER BY Salary) AS Rank
	,DENSE_RANK() OVER (ORDER BY Salary) AS DenseRank
	,[EmployeeID]
	,[FirstName]
	,[LastName]
	,[Salary]
FROM Employees

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.LastName
FROM Employees AS e
WHERE e.FirstName LIKE 'Ro%'

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.LastName
FROM Employees AS e
WHERE e.FirstName LIKE '%an%'

SELECT 
	e.EmployeeID,
	e.FirstName,
	e.LastName
FROM Employees AS e
WHERE e.FirstName LIKE'_n%'