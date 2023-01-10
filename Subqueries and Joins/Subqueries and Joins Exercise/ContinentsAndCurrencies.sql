--15.	*Continents and Currencies
WITH CTE AS
(
 SELECT 
 	c.ContinentCode
 	,c.CurrencyCode
 	,COUNT(c.CurrencyCode) AS CurrencyUsage
 	,DENSE_RANK() OVER(PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) AS RK
 FROM [Countries] AS c
 GROUP BY c.CurrencyCode, c.ContinentCode
 )
 SELECT		
	cte.ContinentCode
	,cte.CurrencyCode
	,cte.CurrencyUsage
 FROM CTE AS cte
 WHERE RK = 1 AND cte.CurrencyUsage != 1
 ORDER BY cte.ContinentCode