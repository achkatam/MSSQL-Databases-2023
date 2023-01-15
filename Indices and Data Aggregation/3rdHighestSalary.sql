SELECT DISTINCT
	DepartmentID,
	Salary
FROM
(
 SELECT 
	e.DepartmentID,
	e.Salary AS Salary,
	DENSE_RANK() OVER(PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) 
	AS SalaryRank
 FROM Employees AS e)
AS SalaryRankingQuery
WHERE SalaryRank = 3