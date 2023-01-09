 WITH MyCTE (FirstName, LastName, DepartmentName)
 AS
 (SELECT
	e.FirstName
	,e.LastName
	,d.[Name]
 FROM Employees AS e 
 JOIN Departments AS d ON e.DepartmentID = d.DepartmentID)

SELECT *
FROM MyCTE