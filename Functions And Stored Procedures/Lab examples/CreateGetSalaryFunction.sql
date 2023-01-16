CREATE FUNCTION udf_GetSalaryLevel(@Salary DECIMAL)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @Result VARCHAR(10)
	SET @Result = 'High'
	IF(@Salary < 30000)
	BEGIN 
		SET @Result = 'Low'
	END
	ELSE IF (@Salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @Result = 'Average' 
	END
	RETURN @Result
END