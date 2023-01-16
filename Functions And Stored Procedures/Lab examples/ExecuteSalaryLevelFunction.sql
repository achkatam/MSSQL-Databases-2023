SELECT 
	CONCAT(e.FirstName,' ', e.LastName) AS FullName,
	e.Salary,
	dbo.udf_GetSalaryLevel(e.Salary) as SalaryLevel
FROM Employees AS e