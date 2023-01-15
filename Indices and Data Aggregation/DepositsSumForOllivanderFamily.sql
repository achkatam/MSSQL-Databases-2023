SELECT 
	wz.DepositGroup AS DepositGroup,
	SUM(wz.DepositAmount) AS TotalSum
FROM WizzardDeposits AS wz
WHERE wz.MagicWandCreator = 'Ollivander family'
GROUP BY wz.DepositGroup