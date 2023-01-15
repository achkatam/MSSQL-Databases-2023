SELECT 
	wz.DepositGroup AS DepositGroup,
	SUM(wz.DepositAmount) AS TotalSum
FROM WizzardDeposits AS wz
WHERE wz.MagicWandCreator = 'Ollivander family'
GROUP BY wz.DepositGroup
HAVING SUM(wz.DepositAmount) < 150000
ORDER BY TotalSum DESC