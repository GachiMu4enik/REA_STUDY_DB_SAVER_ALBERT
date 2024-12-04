SELECT 
    c.Client_Surname, 
    c.Client_Name, 
    SUM(b.Points) AS Total_Bonus_Points, 
    COUNT(r.id_RefundCheck) AS Total_Refunds
FROM 
    `mydb`.`Client` c
LEFT JOIN 
    `mydb`.`Bonus_Points` b ON c.ID_Client = b.Client_ID_Client
LEFT JOIN 
    `mydb`.`Refund_Check` r ON c.ID_Client = r.Client_ID_Client
GROUP BY 
    c.ID_Client
HAVING 
    Total_Bonus_Points > 0 OR Total_Refunds > 0;