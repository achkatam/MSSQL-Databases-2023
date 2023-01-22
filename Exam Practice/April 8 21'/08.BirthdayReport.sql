SELECT 
	u.Username,
	c.[Name]
FROM Users AS u
JOIN Reports AS r ON u.Id = r.UserId
JOIN Categories AS c ON r.CategoryId = c.Id
WHERE 
	FORMAT(CAST(u.Birthdate AS DATE), 'MM-dd') = 
	FORMAT(CAST(r.OpenDate AS DATE), 'MM-dd')
ORDER BY u.Username, c.[Name]