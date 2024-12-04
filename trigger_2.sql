/*
3. Триггер для поддержания целостности данных при удалении клиента
Допустим, у нас есть правило, что при удалении клиента все его заказы должны быть удалены, чтобы не нарушить целостность данных. Мы можем создать триггер, который будет удалять все заказы, связанные с клиентом, при его удалении.
*/



DELIMITER $$

CREATE TRIGGER `delete_orders_on_client_delete`
AFTER DELETE ON `mydb`.`Client`
FOR EACH ROW
BEGIN
    -- Удаляем все заказы, связанные с клиентом
    DELETE FROM `mydb`.`Order` WHERE `Client_ID_Client` = OLD.ID_Client;
END$$

DELIMITER ;



/*
удалим клиента

DELETE FROM `mydb`.`Client` WHERE `ID_Client` = 1;


проверка

SELECT * FROM `mydb`.`Order` WHERE `Client_ID_Client` = 1;
*/