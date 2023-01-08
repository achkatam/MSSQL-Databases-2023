--Problem 1.	Find Names of All Employees by First Name
--Wildcards

SELECT 
	e.FirstName
	,e.LastName
FROM [Employees] AS e
WHERE e.FirstName LIKE 'Sa%'

GO

--Problem 2.	Find Names of All employees by Last Name 
SELECT 
	e.FirstName
	,e.LastName
FROM [Employees] AS e
WHERE e.LastName LIKE '%ei%'

--Problem 3.	Find First Names of All Employees
SELECT 
	e.FirstName
	,e.DepartmentID
FROM [Employees] AS e
WHERE e.DepartmentID IN (3,10)
AND  DATEPART(YEAR,e.HireDate) BETWEEN 1995 AND 2005

--Problem 4.	Find All Employees Except Engineers
SELECT 
	e.FirstName
	,e.LastName
FROM [Employees] AS e
WHERE e.JobTitle NOT LIKE '%engineer%'

--Problem 5.	Find Towns with Name Length
SELECT 
	t.Name
FROM [Towns] AS t
WHERE LEN(t.Name) IN (5,6)
ORDER BY t.Name 