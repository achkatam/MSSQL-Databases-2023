--2
SELECT *
FROM [Departments]

--3
SELECT Name
FROM [Departments]

--4
SELECT
	FirstName,
	LastName,
	Salary
FROM [Employees]

--5
SELECT
	FirstName,
	MiddleName,
	LastName
FROM [Employees]

--6
SELECT 
	CONCAT(FirstName,'.', LastName,'@softuni.bg') AS [Full Email Address]
FROM [Employees]

--7
SELECT DISTINCT
	Salary AS [Salary] 
FROM [Employees] 
ORDER BY Salary ASC

--8
SELECT *
FROM [Employees]
WHERE JobTitle = 'Sales Representative'

--9
SELECT 
	[FirstName],
	[LastName],
	[JobTitle]
FROM [Employees]
WHERE Salary BETWEEN 20000 AND 30000

--10
SELECT 
	CONCAT([FirstName],' ',[MiddleName],' ', LastName) AS [Full Name]
FROM [Employees]
WHERE
	Salary = 25000
	OR Salary = 14000
	OR Salary = 12500 
	OR Salary = 23600

--11
SELECT 
	[FirstName],
	[LastName]
FROM [Employees]
WHERE ManagerID IS NULL

--12
SELECT 
	[FirstName],
	[LastName],
	[Salary]
FROM [Employees]
WHERE Salary > 50000
ORDER BY Salary DESC

--13
SELECT TOP(5)
	[FirstName],
	[LastName]
FROM [Employees]
ORDER BY Salary DESC

--14
SELECT 
	[FirstName],
	[LastName]
FROM [Employees]
WHERE DepartmentID != 4

--15
SELECT
*
FROM [Employees]
ORDER BY 
	Salary DESC,
	FirstName ASC,
	LastName DESC,
	MiddleName ASC

GO
--16
CREATE VIEW v_EmployeesSalaries AS
SELECT 
	[FirstName],
	[LastName],
	[Salary]
FROM [Employees]

GO

--17
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT 
	FirstName + ' ' + COALESCE(MiddleName, '') + ' ' + LastName	AS [Full Name],
	[JobTitle] AS [Job Title]
FROM [Employees]

GO

--18
SELECT DISTINCT
	JobTitle
FROM [Employees]
ORDER BY JobTitle ASC

--19
SELECT TOP(10) *
FROM [Projects]
ORDER BY StartDate ASC, Name ASC

--20
SELECT TOP(7)
	[FirstName],
	[LastName],
	[HireDate]
FROM [Employees]
ORDER BY HireDate DESC

--21
UPDATE [Employees]
SET [Salary] = [Salary] * 1.12
WHERE DepartmentID IN (1,2,4,11)

SELECT e.Salary
  FROM Employees AS e