SELECT * FROM
(SELECT 
	e.DepartmentID,
	COUNT(*) AS Cnt
FROM Employees AS e
GROUP BY e.DepartmentID) AS dt
WHERE dt.Cnt > 10


SELECT 
	e.DepartmentID,
	COUNT(*) AS Cnt
FROM Employees AS e
GROUP BY e.DepartmentID 
HAVING COUNT(*) > 10

SELECT 
	e.DepartmentID,
	SUM(Salary) AS TotalSalary
FROM Employees AS e
GROUP BY e.DepartmentID 
HAVING SUM(e.Salary) >= 150000

SELECT 
	DepartmentID,
	COUNT(*),
	COUNT(MiddleName)
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) <> COUNT(MiddleName)

SELECT 
	DepartmentID,
	STRING_AGG(FirstName, ','),
	COUNT(*),
	COUNT(MiddleName)
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) <> COUNT(MiddleName)


SELECT 
	DepartmentID,
	STRING_AGG(CONCAT(FirstName, ' ', MiddleName, ' ', LastName), ','),
	COUNT(*),
	COUNT(MiddleName)
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) <> COUNT(MiddleName)