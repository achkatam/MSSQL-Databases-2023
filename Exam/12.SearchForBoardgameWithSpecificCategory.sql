CREATE OR ALTER PROC usp_SearchByCategory(@category VARCHAR(50))
AS
BEGIN
		SELECT 
				b.Name,
				b.YearPublished,
				b.Rating,
				c.Name AS CategoryName,
				p.Name AS PublisherName,
				CONCAT(pr.PlayersMin, ' ', 'people') AS MinPlayers,
				CONCAT(pr.PlayersMax, ' ', 'people') AS MaxPlayers
			FROM Boardgames AS b
		JOIN Categories AS c ON c.Id = b.CategoryId
		JOIN PlayersRanges AS pr ON pr.Id = b.PlayersRangeId
		JOIN Publishers AS p ON p.Id = b.PublisherId
	WHERE c.Name = @category
			ORDER BY p.Name, b.YearPublished DESC
END

EXEC usp_SearchByCategory 'Wargames'