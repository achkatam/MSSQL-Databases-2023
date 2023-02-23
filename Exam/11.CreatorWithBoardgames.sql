CREATE OR ALTER FUNCTION udf_CreatorWithBoardgames(@name NVARCHAR(30))
RETURNS INT 
AS
BEGIN 
	   DECLARE @Result INT

	   BEGIN
			SET @Result = ( SELECT	
					COUNT(b.Id)
			FROM Creators AS c
			JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
			JOIN Boardgames AS b ON cbg.BoardgameId = b.Id
			WHERE c.FirstName = @name
			)
		END
		RETURN @Result
END

GO

SELECT dbo.udf_CreatorWithBoardgames('Bruno')