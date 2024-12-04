DELIMITER $$

CREATE TRIGGER `prevent_delete_legal_entity_with_bank_rekviz`
BEFORE DELETE ON `mydb`.`Legal_entity`
FOR EACH ROW
BEGIN
    DECLARE bank_count INT;

    -- Проверяем, есть ли записи о банковских реквизитах для этого юридического лица
    SELECT COUNT(*) INTO bank_count
    FROM `mydb`.`Bank_rekviz`
    WHERE `Legal_entity_idLegal_entity` = OLD.idLegal_entity;

    -- Если такие записи есть, удаление юридического лица не будет выполнено
    IF bank_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Невозможно удалить юридическое лицо, связанное с банковскими реквизитами!';
    END IF;
END$$

DELIMITER ;



попробуем удалить DELETE FROM `mydb`.`Legal_entity` WHERE `idLegal_entity` = 1;