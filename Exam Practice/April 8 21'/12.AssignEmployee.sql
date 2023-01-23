CREATE OR ALTER PROC usp_AssignEmployeeToReport (@EmployeeId INT, @ReportId INT)
AS
BEGIN
	DECLARE @departmentEmployee INT = (
		SELECT 
			e.DepartmentId
		FROM Employees AS e
		WHERE e.Id = @EmployeeId
	)

	DECLARE @departmentReport INT = (
		SELECT 
			c.DepartmentId
		FROM Reports AS r
		JOIN Categories AS c ON c.Id = r.CategoryId
		WHERE r.Id = @ReportId
	)

	IF @departmentEmployee <> @departmentReport
		THROW 50001, 'Employee doesn''t belong to the appropriate department!', 1
	ELSE
		UPDATE Reports
		SET EmployeeId = @EmployeeId
		WHERE Id = @ReportId
END

GO

EXEC usp_AssignEmployeeToReport 17,2
EXEC usp_AssignEmployeeToReport 4,6