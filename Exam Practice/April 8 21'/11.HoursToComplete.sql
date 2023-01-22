CREATE OR ALTER FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT
		BEGIN
			SET @Result = DATEDIFF(HOUR, @StartDate, @EndDate)
		END
		IF @StartDate IS NULL
		 BEGIN
			SET @Result = 0
		 END
		ELSE IF @EndDate IS NULL 
		 BEGIN 
			SET @Result = 0
		 END
		RETURN @Result
END

GO

SELECT dbo.udf_HoursToComplete(14, 24) AS TotalHours
SELECT dbo.udf_HoursToComplete(14, NULL) AS TotalHours
SELECT dbo.udf_HoursToComplete(NULL, 24) AS TotalHours