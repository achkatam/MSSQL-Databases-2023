CREATE OR ALTER PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18,4))
AS
BEGIN
	IF (@MoneyAmount < 0) THROW 50001, 'Invalid amount. The sum must be a positive digit', 1 
	UPDATE Accounts
	SET Balance += @MoneyAmount
	WHERE Id = @AccountId
END