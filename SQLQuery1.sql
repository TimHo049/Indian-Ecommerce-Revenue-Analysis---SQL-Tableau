SELECT  
  FORMAT(lod.Order_Date, 'MMM-yy') AS month,
  SUM(od.Amount) AS total_amount,
  SUM(od.Profit) AS total_profit,
  (SUM(od.Profit) * 100.0 / NULLIF(SUM(od.Amount), 0)) AS profit_margin
FROM 
  [Order Details] od
JOIN [List of Orders] lod
  ON od.Order_ID = lod.Order_ID
GROUP BY 
  FORMAT(lod.Order_Date, 'MMM-yy')
ORDER BY 
  MIN(lod.Order_Date);