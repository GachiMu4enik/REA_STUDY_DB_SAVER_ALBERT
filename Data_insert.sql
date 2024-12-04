-- Вставляем данные в таблицу `Legal_entity`
INSERT INTO `mydb`.`Legal_entity` (idLegal_entity, Legal_entity_name, Legal_entity_INN, Legal_entity_OGRN)
VALUES 
(1, 'ООО "Ромашка"', '1234567890', '1027700000000'),
(2, 'ЗАО "Молоко"', '9876543210', '1047800000000'),
(3, 'ИП Иванов', '1112233445', '3035300000000');

-- Вставляем данные в таблицу `Bank_rekviz`
INSERT INTO `mydb`.`Bank_rekviz` (idBank_rekviz, Bank_INN, Bank_BIK, Bank_current_account, Bank_corr_schet, Legal_entity_idLegal_entity)
VALUES 
(1, '1234567890', '045765234', '40802810123456789000', '30101810100000000000', 1),
(2, '9876543210', '046214356', '40802810234567890000', '30101810200000000000', 2),
(3, '1112233445', '047663456', '40802810345678901000', '30101810300000000000', 3);

-- Вставляем данные в таблицу `Position`
INSERT INTO `mydb`.`Position` (id_Position, Position_Name, Position_Salary)
VALUES 
(1, 'Менеджер', 50000),
(2, 'Программист', 80000),
(3, 'Бухгалтер', 60000);

-- Вставляем данные в таблицу `Employee`
INSERT INTO `mydb`.`Employee` (id_Employee, Employee_Surname, Employee_Name, Employee_LastName, Employee_Birth, Employee_Sex, Employee_Email, Employee_TelefNumber, Employee_Passport, Employee_INN, Employee_Snils, Employee_DateEmployment, Employee_DateDismissal, Position_id_Position)
VALUES 
(1, 'Петров', 'Алексей', 'Сергеевич', '1985-04-10', 'М', 'alexey.petrov@example.com', '89010010010', '1234567890', '1234567890', '123-45-6789', '2015-03-01', NULL, 1),
(2, 'Смирнова', 'Екатерина', 'Игоревна', '1990-08-23', 'Ж', 'ekaterina.smirnova@example.com', '89010010011', '0987654321', '9876543210', '987-65-4321', '2018-07-15', NULL, 2),
(3, 'Иванов', 'Дмитрий', 'Олегович', '1982-12-30', 'М', 'dmitriy.ivanov@example.com', '89010010012', '1122334455', '2233445566', '223-34-4556', '2010-11-25', NULL, 3);

-- Вставляем данные в таблицу `Client`
INSERT INTO `mydb`.`Client` (ID_Client, Client_Surname, Client_Name, Client_Lastname, Client_Birth, Client_Sex, Client_TelefNumber, Client_Email, Client_BonusCard)
VALUES 
(1, 'Кузнецова', 'Марина', 'Алексеевна', '1995-02-15', 'Ж', '89010010013', 'marina.kuznetsova@example.com', '1234567890123456'),
(2, 'Новиков', 'Максим', 'Сергеевич', '1992-06-22', 'М', '89010010014', 'maksim.novikov@example.com', '2345678901234567'),
(3, 'Лебедева', 'Ирина', 'Вячеславовна', '1988-01-30', 'Ж', '89010010015', 'irina.lebedeva@example.com', '3456789012345678');

-- Вставляем данные в таблицу `Cashbox`
INSERT INTO `mydb`.`Cashbox` (idCashbox, Cashbox_date_time, Cashbox_Sum, Cashbox_operation_type, Cashbox_operation_base)
VALUES 
(1, '2024-12-01 12:30', 1500, 'Продажа', 'Товар №1'),
(2, '2024-12-01 14:45', 3500, 'Продажа', 'Товар №2'),
(3, '2024-12-02 10:00', 2000, 'Возврат', 'Возврат товара №1');

-- Вставляем данные в таблицу `Check`
INSERT INTO `mydb`.`Check` (id_Check, Client_ID_Client, Employee_id_Employee, Cashbox_idCashbox)
VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Вставляем данные в таблицу `Bonus_Points`
INSERT INTO `mydb`.`Bonus_Points` (Points, Points_Date, TypeOfOperation, Client_ID_Client, Bill_id_Bill)
VALUES 
(100, '2024-12-01', 'Покупка', 1, 1),
(150, '2024-12-01', 'Покупка', 2, 2),
(50, '2024-12-02', 'Возврат', 3, 3);

-- Вставляем данные в таблицу `Refund_Check`
INSERT INTO `mydb`.`Refund_Check` (id_RefundCheck, Check_id_Check, Client_ID_Client, Employee_id_Employee)
VALUES 
(1, 3, 3, 3);

-- Вставляем данные в таблицу `Order`
INSERT INTO `mydb`.`Order` (id_Order, Order_Sum, Order_Date, Client_ID_Client)
VALUES 
(1, 5000, '2024-12-01', 1),
(2, 3000, '2024-12-01', 2),
(3, 2500, '2024-12-02', 3);

-- Вставляем данные в таблицу `Waybill`
INSERT INTO `mydb`.`Waybill` (idWaybill, Incoming_sum, Legal_entity_idLegal_entity)
VALUES 
(1, 10000, 1),
(2, 5000, 2),
(3, 7000, 3);

-- Вставляем данные в таблицу `Nomenclature`
INSERT INTO `mydb`.`Nomenclature` (idNomenclature, Nomenclature_name, Nomenclature_measure, Nomenclature_description, Nomenclature_article, Nomenclature_year, Nomenclature_country, Nomenclature_brand, Nomenclature_colour, Nomenclature_height, Nomenclature_length, Nomenclature_width, Nomenclature_weight, Nomenclature_configuration, Nomenclature_model, Nomenclature_power, Nomenclature_power_type, Nomenclature_guarantee)
VALUES 
(1, 'Телевизор', 'Шт', '55 дюймов, 4K', 'TV-1000', 2024, 'Россия', 'Samsung', 'Черный', '70 см', 1.2, 0.8, 15.0, 'LED', 'UE55KU6400', 120, 'Электрический', '1 год'),
(2, 'Микроволновка', 'Шт', '25 литров, с грилем', 'MW-2000', 2023, 'Китай', 'LG', 'Серебристый', '30 см', 0.5, 0.4, 8.0, 'Микроволновая печь', 'MS2845', 800, 'Электрический', '2 года');

-- Вставляем данные в таблицу `Goods List`
INSERT INTO `mydb`.`Goods List` (Number_GoodsList, Price_GoodsList, Order_id_Order, Check_id_Check, Waybill_idWaybill, Nomenclature_idNomenclature)
VALUES 
(1, 5000, 1, 1, 1, 1),
(2, 3000, 2, 2, 2, 2),
(3, 2500, 3, 3, 3, 1);

-- Вставляем данные в таблицу `Price`
INSERT INTO `mydb`.`Price` (idPrice, Price_value, Price_date, Nomenclature_idNomenclature)
VALUES 
(1, 5000, '2024-12-01', 1),
(2, 3000, '2024-12-01', 2);

-- Вставляем данные в таблицу `Warehouse`
INSERT INTO `mydb`.`Warehouse` (idWarehouse, Warehouse_quantity, Warehouse_date, Warehouse_operation, Nomenclature_idNomenclature)
VALUES 
(1, 50, '2024-12-01', 'Поступление', 1),
(2, 30, '2024-12-02', 'Продажа', 2);

-- Вставляем данные в таблицу `Strorefront`
INSERT INTO `mydb`.`Strorefront` (idStrorefront, Strorefront_quantity, Strorefront_date, Strorefront_operation, Nomenclature_idNomenclature)
VALUES 
(1, 20, '2024-12-01', 'Продажа', 1),
(2, 10, '2024-12-02', 'Возврат', 2);
