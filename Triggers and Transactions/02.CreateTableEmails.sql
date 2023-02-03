CREATE TABLE NotificationEmals(
	Id INT IDENTITY,
	Recipient INT,
	[Subject] VARCHAR(250),
	Body VARCHAR(250)
)

GO

CREATE TRIGGER tr_NotificationEmail
ON Logs FOR INSERT
AS
INSERT INTO NotificationEmals
		VALUES
	(
		(SELECT AccountId FROM inserted),
		(SELECT 'Balance change for account: ' + CAST(AccountId AS VARCHAR(250)) FROM inserted),
		(SELECT 'On '
					+ FORMAT(GETDATE(), 'MM dd yyyy h:mmtt')
					+ ' your balance was changed from ' +
					CAST(OldSum AS VARCHAR(250)) + ' to '
					+ CAST(NewSum AS VARCHAR(250)) + '.'
							FROM inserted)
	)