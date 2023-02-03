CREATE PROC usp_AssignProject(@EmloyeeId INT , @ProjectID INT)
AS
BEGIN TRANSACTION
	DECLARE @ProjectsCount INT = (
		SELECT 
			COUNT(ep.ProjectID)
		FROM EmployeesProjects AS ep
		WHERE ep.EmployeeID = @EmloyeeId
	)
IF (@ProjectsCount >= 3)
BEGIN
	RAISERROR('The employee has too many projects!', 16, 1)
	ROLLBACK
END

INSERT INTO EmployeesProjects
		VALUES
	(@EmloyeeId, @ProjectID)

COMMIT