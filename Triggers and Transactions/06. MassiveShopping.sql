DECLARE @UserId INT = (
	SELECT 
		u.Id
	FROM Users AS u
	WHERE u.Username = 'Stamat'
)

DECLARE @GameId INT = (
	SELECT 
		g.Id
	FROM Games AS g
	WHERE g.Name = 'Safflower'
)

DECLARE @UserGameId INT = (
	SELECT 
		ug.Id
	FROM UsersGames AS ug
	WHERE ug.GameId = @GameId 
			AND
		ug.UserId = @UserId
)
DECLARE @UserBudget DECIMAL(18,2) = (
	SELECT 
		ug.Cash
	FROM UsersGames AS ug
	WHERE ug.UserId = @UserId 
			AND
			ug.GameId = @GameId
)

BEGIN TRANSACTION

DECLARE @ItemPrice DECIMAL (18,2) = (
	SELECT 
		i.Price
	FROM Items AS i
	WHERE i.MinLevel BETWEEN 11 AND 12
)

IF (@UserBudget - @ItemPrice >= 0)
BEGIN
INSERT INTO UserGameItems
	SELECT 
		i.Id, 
		@UserGameId
	FROM Items AS i
	WHERE i.Id IN (
		SELECT 
			i.Id
		FROM Items AS i
		WHERE i.MinLevel BETWEEN 11 AND 12)

UPDATE UsersGames
	SET Cash -= @ItemPrice
	WHERE GameId = @GameId AND UserId = @UserId
	COMMIT END
ELSE
	BEGIN ROLLBACK
END

SET @UserBudget = (SELECT ug.Cash 
		FROM UsersGames AS ug
	WHERE GameId = @GameId AND UserId = @UserId)
BEGIN TRANSACTION
SET @ItemPrice = (SELECT
		SUM(i.Price)
	FROM Items AS i
	WHERE i.MinLevel BETWEEN 19 AND 21
)

IF (@UserBudget - @ItemPrice >= 0)
BEGIN
INSERT INTO UserGameItems
	SELECT 
		i.Id, 
		@UserGameId
	FROM Items AS i
	WHERE i.Id IN (
		SELECT 
			i.Id
		FROM Items AS i
		WHERE i.MinLevel BETWEEN 19 AND 21)

UPDATE UsersGames
	SET Cash -= @ItemPrice
	WHERE GameId = @GameId AND UserId = @UserId
	COMMIT END
ELSE
	BEGIN ROLLBACK
END

SELECT *
FROM Items AS i
WHERE i.Id IN (
		SELECT 
			i.[Name] AS [Item Name]
		FROM UserGameItems AS ugi
		WHERE ugi.UserGameId = @UserGameId)
ORDER BY i.[Name]