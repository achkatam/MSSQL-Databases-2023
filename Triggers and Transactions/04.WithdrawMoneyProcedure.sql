CREATE OR ALTER PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18,4))
AS
BEGIN
	IF (@MoneyAmount < 0) THROW 50001, 'Invalid amount. The sum must be a positive digit', 1 
	UPDATE Accounts
	SET Balance -= @MoneyAmount
	WHERE Id = @AccountId
END

SELECT Balance 
FROM Accounts AS a
WHERE Id = 5 -- 36521.20

EXEC usp_WithdrawMoney 5, 100

SELECT Balance 
FROM Accounts AS a
WHERE Id = 5 -- 36421.20