-- City Performance Analysis
SELECT 
  CASE 
    WHEN lod.Order_Date < '2018-10-01' THEN 'Before Oct 2018'
    ELSE 'After Oct 2018' 
  END AS period,
  City,
  SUM(od.Amount) AS total_amount,
  SUM(od.Profit) AS total_profit
FROM 
  [Order Details] od
JOIN [List of Orders] lod
  ON od.Order_ID = lod.Order_ID
GROUP BY 
  CASE 
    WHEN lod.Order_Date < '2018-10-01' THEN 'Before Oct 2018'
    ELSE 'After Oct 2018' 
  END,
  City
ORDER BY 
  period, total_profit DESC;


