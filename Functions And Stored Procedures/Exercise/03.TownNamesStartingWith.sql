CREATE OR ALTER PROC usp_GetTownsStartingWith @String VARCHAR(10)
AS
BEGIN
	SELECT 
		t.[Name] AS Town
	FROM Towns AS t
	WHERE SUBSTRING(t.Name,1,1) = @String
	--WHERE t.[Name] LIKE @String + '%'
END

GO

EXEC usp_GetTownsStartingWith 'b'
EXEC usp_GetTownsStartingWith 'C'
EXEC usp_GetTownsStartingWith 'v'