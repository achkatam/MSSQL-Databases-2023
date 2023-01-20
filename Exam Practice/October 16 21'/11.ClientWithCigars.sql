--delete ALTER before submitting in judge
CREATE OR ALTER FUNCTION udf_ClientWithCigars (@name NVARCHAR(30))
RETURNS INT
AS
BEGIN
		DECLARE @Result INT

		BEGIN
			SET @Result = (
				SELECT	
						COUNT(*)
				FROM Clients AS c
				JOIN ClientsCigars AS cc ON c.Id = cc.ClientId
				JOIN Cigars AS cig ON cc.CigarId = cig.Id
				WHERE c.FirstName = @name
				)
		END

		RETURN @Result
END

SELECT dbo.udf_ClientWithCigars('Betty')
	AS [Output]