--CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan @minBalance DECIMAL(18,2)
--AS
--BEGIN
--	SELECT 
--		ah.FirstName,
--		ah.LastName
--		--ah.Id AS ID, SUM(CAST(a.Balance AS DECIMAL (18, 2))) AS TotalBalance
--	FROM Accounts AS a
--	LEFT JOIN AccountHolders AS ah ON ah.Id = a.AccountHolderId
--	WHERE a.Balance > @minBalance
--	GROUP BY ah.Id, ah.FirstName, ah.LastName
--	ORDER BY ah.FirstName, ah.LastName
--END
--80/100 IN judge

CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan @minBalance DECIMAL(18,2)
AS
BEGIN
	WITH CTE AS
	(
		SELECT 
			ah.Id AS ID,
			SUM(CAST(a.Balance AS DECIMAL (18,2))) AS TotalBalance
		FROM AccountHolders AS ah
		JOIN Accounts AS a ON a.AccountHolderId = ah.Id
		GROUP BY ah.Id
	)
  SELECT 
	ah.FirstName AS [Full Name],
	ah.LastName AS [Last Name]
  FROM CTE AS cte
  JOIN AccountHolders AS ah ON ah.Id = cte.ID
  WHERE cte.TotalBalance > @minBalance
  ORDER BY ah.FirstName, ah.LastName
END

GO

EXEC usp_GetHoldersWithBalanceHigherThan 4000.00
EXEC usp_GetHoldersWithBalanceHigherThan 10000.00
EXEC usp_GetHoldersWithBalanceHigherThan 34000.00