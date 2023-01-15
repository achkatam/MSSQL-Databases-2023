SELECT 
	wz.DepositGroup AS DepositGroup,
	MAX(wz.[MagicWandSize]) AS [LongestMagicWand]
FROM WizzardDeposits AS wz
GROUP BY wz.DepositGroup