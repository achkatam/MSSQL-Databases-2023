SELECT 
	e.FirstName
	,e.LastName
	,e.HireDate
	,d.[Name]
FROM Employees AS e 
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
	WHERE e.HireDate > '1999-01-01'
	AND d.[Name] IN ('Finance', 'Sales')
ORDER BY e.HireDate