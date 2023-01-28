--Before submitting the solution in judge system, make sure to delete ALTER !!!
CREATE OR ALTER FUNCTION udf_GetTouristsCountOnATouristSite (@Site VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @Result INT

	BEGIN
		SET @Result = (
				SELECT 
					COUNT(s.Id)
				FROM Sites AS s
				JOIN SitesTourists AS st ON s.Id = st.SiteId
				JOIN Tourists AS t ON t.Id = st.TouristId
				WHERE s.[Name] = @Site
		)
			RETURN @Result
		END
END

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Regional History Museum – Vratsa')
		AS [Output]

SELECT dbo.udf_GetTouristsCountOnATouristSite('Samuil’s Fortress')
		AS [Output]

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Gorge of Erma River')
		AS [Output]