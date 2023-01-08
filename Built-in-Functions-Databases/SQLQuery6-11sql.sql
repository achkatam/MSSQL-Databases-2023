--Problem 6.	Find Towns Starting With
SELECT 
	t.TownID,
	t.Name
FROM [Towns] AS t
WHERE LEFT(t.Name,1) IN ('M','K','B','E')
--WHERE t.Name LIKE'[MKBE]%'
ORDER BY t.Name

--Problem 7.	Find Towns Not Starting With
SELECT 
	t.TownID,
	t.Name
FROM [Towns] AS t
WHERE t.Name NOT LIKE ('[DRB]%')
ORDER BY t.Name

--Problem 8.	Create View Employees Hired After 2000 Year
CREATE VIEW [V_EmployeesHiredAfter2000] AS
	SELECT 
	e.FirstName,
	e.LastName
	FROM [Employees] AS e
	WHERE DATEPART(YEAR,e.HireDate) > 2000

SELECT *
FROM V_EmployeesHiredAfter2000

--Problem 9.	Length of Last Name
SELECT 
	e.FirstName,
	e.LastName
	FROM [Employees] AS e
	WHERE LEN(e.LastName) IN (5)

--Problem 10.	 Rank Employees by Salary
SELECT 
	e.EmployeeID
	,e.FirstName
	,e.LastName
	,e.Salary
	,DENSE_RANK() OVER(PARTITION BY e.Salary ORDER BY e.EmployeeID)
FROM [Employees] AS e
WHERE e.Salary BETWEEN 10000 AND 50000
ORDER BY e.Salary DESC

--Problem 11.	Find All Employees with Rank 2 *
SELECT *
	FROM(
	SELECT	e.EmployeeID
	,e.FirstName
	,e.LastName
	,e.Salary
	,DENSE_RANK() OVER(PARTITION BY e.Salary ORDER BY e.EmployeeID)
	AS [Rank]
	FROM [Employees] AS e
	WHERE e.Salary BETWEEN 10000 AND 50000
	)
	AS [RankingSubquery]
		WHERE [Rank] = 2
ORDER BY [Salary] DESC