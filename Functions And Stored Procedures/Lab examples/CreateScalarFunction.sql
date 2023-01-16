CREATE FUNCTION udf_ProjectDuration(@StartDate DATETIME2, @EndDate DATETIME2)
RETURNS INT
AS
BEGIN 
	DECLARE @Result INT
	IF(@EndDate IS NULL)
	BEGIN
		SET @EndDate = GETDATE()
	END
	SET @Result = DATEDIFF(WEEK, @StartDate, @EndDate)
	RETURN @Result
END
 