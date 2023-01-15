SELECT 
	e.DepartmentID,
	MAX(e.Salary) AS MaxSalary
FROM Employees AS e
GROUP BY e.DepartmentID
HAVING NOT MAX(e.Salary) BETWEEN 30000 AND 70000