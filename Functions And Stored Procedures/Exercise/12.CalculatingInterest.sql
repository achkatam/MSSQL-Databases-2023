CREATE OR ALTER PROC usp_CalculateFutureValueForAccount @AccId INT, @APY FLOAT
AS
BEGIN
	SELECT 
		ah.Id AS [Account Id],
		ah.FirstName AS [First Name],
		ah.LastName AS [Last Name],
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue(a.Balance, @APY, 5)
			AS [Balance in 5 Years]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	WHERE a.Id = @AccId 
END

GO

EXEC usp_CalculateFutureValueForAccount 1, 0.1