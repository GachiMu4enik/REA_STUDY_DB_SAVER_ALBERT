SELECT 
    c.Client_Surname, 
    c.Client_Name, 
    SUM(o.Order_Sum) AS Total_Order_Sum
FROM 
    `mydb`.`Client` c
JOIN 
    `mydb`.`Order` o ON c.ID_Client = o.Client_ID_Client
GROUP BY 
    c.ID_Client;