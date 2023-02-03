CREATE OR ALTER PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(18,2))
AS
BEGIN
		BEGIN TRANSACTION
			BEGIN TRY 
				EXEC usp_DepositMoney @ReceiverId, @Amount
				EXEC usp_WithdrawMoney @SenderId, @Amount
			END TRY
			BEGIN CATCH
				ROLLBACK TRANSACTION
			END CATCH
		COMMIT TRANSACTION
END