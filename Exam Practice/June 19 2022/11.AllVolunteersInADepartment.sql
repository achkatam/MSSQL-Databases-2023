CREATE OR ALTER FUNCTION udf_GetVolunteersCountFromADepartment (@Department VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	BEGIN
		SET @Result = 
		(
			SELECT COUNT(*)
			FROM Volunteers AS v
			JOIN VolunteersDepartments AS vd ON vd.Id = v.DepartmentId
			WHERE vd.[DepartmentName] = @Department
		)

	END
		RETURN @Result
END

GO

SELECT dbo.udf_GetVolunteersCountFromADepartment('Education program assistant')
	AS [Output]
SELECT dbo.udf_GetVolunteersCountFromADepartment('Guest engagement')
	AS [Output]
SELECT dbo.udf_GetVolunteersCountFromADepartment('Zoo events')
	AS [Output]