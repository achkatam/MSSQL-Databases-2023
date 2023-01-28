--Before submitting in judge system, make sure to delete ALTER
CREATE OR ALTER PROC usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
BEGIN 
		 SELECT 
				t.[Name], 
				CASE 
					WHEN COUNT(s.Id) BETWEEN 25 AND 49 THEN 'Bronze badge'
					WHEN COUNT(s.Id) BETWEEN 50 AND 99 THEN 'Silver badge'
					WHEN COUNT(s.Id) >= 100 THEN 'Gold badge'
				END AS Reward
		FROM Tourists AS t
		JOIN SitesTourists AS st ON st.TouristId = t.Id
		JOIN Sites AS s ON s.Id = st.SiteId
		WHERE t.Name = @TouristName 
		GROUP BY t.Name
	
END

GO

EXEC usp_AnnualRewardLottery 'Gerhild Lutgard' 

EXEC usp_AnnualRewardLottery 'Teodor Petrov'

EXEC usp_AnnualRewardLottery 'Zac Walsh'

EXEC usp_AnnualRewardLottery 'Brus Brown'

EXEC usp_AnnualRewardLottery 'Stoyan Mitev'