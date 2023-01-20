SELECT 
	C.Id,
	CONCAT(c.FirstName,' ', c.LastName) AS ClientName,
	c.Email
FROM Clients AS c
LEFT JOIN ClientsCigars AS cc ON c.Id = cc.ClientId
LEFT JOIN Cigars AS cig ON cig.Id = cc.CigarId
WHERE cig.Id IS NULL
ORDER BY ClientName 