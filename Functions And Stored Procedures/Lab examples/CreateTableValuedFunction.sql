CREATE FUNCTION udf_AverageSalaryByDepartment()
RETURNS TABLE AS
RETURN
(
	SELECT 
		d.[Name] AS Department,
		AVG(e.Salary) AS AverageSalary
	FROM Employees AS e
	JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
	GROUP BY d.DepartmentID, d.[Name]
)