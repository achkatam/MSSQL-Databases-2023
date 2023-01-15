SELECT 
	SUBSTRING(wz.FirstName,1,1) AS FirstLetter
FROM WizzardDeposits AS wz
WHERE wz.DepositGroup = 'Troll Chest'
GROUP BY SUBSTRING(wz.FirstName,1,1)