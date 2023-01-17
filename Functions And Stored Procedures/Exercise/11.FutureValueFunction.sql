CREATE OR ALTER FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(18,2), @APY FLOAT, @T INT)
RETURNS DECIMAL(18,4)
AS
BEGIN
	DECLARE @Result DECIMAL(20,4)
	BEGIN
		SET	@Result = @sum * (POWER((1 + @APY), @T))
	END

	RETURN @Result
END

GO

SELECT 
	dbo.ufn_CalculateFutureValue(1000, 0.1, 5)
 AS Output