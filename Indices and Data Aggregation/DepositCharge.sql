SELECT 
	wz.DepositGroup AS DepositGroup,
	wz.[MagicWandCreator] AS MagicWandCreator,
	MIN(wz.DepositCharge)AS MinDepositCharge
FROM WizzardDeposits AS wz
GROUP BY wz.DepositGroup, wz.MagicWandCreator
ORDER BY wz.MagicWandCreator, wz.DepositGroup