SELECT 
    c.Client_Surname, 
    c.Client_Name, 
    c.Client_Lastname, 
    o.id_Order, 
    o.Order_Sum, 
    o.Order_Date
FROM 
    `mydb`.`Client` c
JOIN 
    `mydb`.`Order` o ON c.ID_Client = o.Client_ID_Client;