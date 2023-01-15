SELECT TOP(10)
	e.FirstName,
	e.LastName,
	e.DepartmentID
FROM Employees AS e
WHERE Salary > 
		(SELECT AVG(Salary) AS AvgSalary
		FROM Employees AS e2
			WHERE e.DepartmentID = e2.DepartmentID
			GROUP BY DepartmentID)
	 ORDER BY e.DepartmentID