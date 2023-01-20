SELECT TOP(5)
		C.CigarName,
		c.PriceForSingleCigar,
		c.ImageURL
FROM Cigars AS c
LEFT JOIN Sizes AS s ON s.Id = c.SizeId
WHERE 
		s.[Length] >=12 AND
		(c.CigarName LIKE '%ci%' OR c.PriceForSingleCigar > 50) AND
		s.RingRange > 2.55
ORDER BY c.CigarName, c.PriceForSingleCigar DESC