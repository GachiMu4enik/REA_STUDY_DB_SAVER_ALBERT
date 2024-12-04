-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Legal_entity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Legal_entity` (
  `idLegal_entity` INT NOT NULL,
  `Legal_entity_name` VARCHAR(45) NOT NULL,
  `Legal_entity_INN` VARCHAR(10) NOT NULL,
  `Legal_entity_OGRN` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idLegal_entity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bank_rekviz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bank_rekviz` (
  `idBank_rekviz` INT NOT NULL,
  `Bank_INN` VARCHAR(10) NOT NULL,
  `Bank_BIK` VARCHAR(9) NOT NULL,
  `Bank_current_account` VARCHAR(20) NOT NULL,
  `Bank_corr_schet` VARCHAR(25) NOT NULL,
  `Legal_entity_idLegal_entity` INT NULL,
  PRIMARY KEY (`idBank_rekviz`),
  INDEX `fk_Bank_rekviz_Legal_entity_idx` (`Legal_entity_idLegal_entity` ASC) VISIBLE,
  CONSTRAINT `fk_Bank_rekviz_Legal_entity`
    FOREIGN KEY (`Legal_entity_idLegal_entity`)
    REFERENCES `mydb`.`Legal_entity` (`idLegal_entity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `ID_Client` INT NOT NULL,
  `Client_Surname` VARCHAR(45) NOT NULL,
  `Client_Name` VARCHAR(45) NOT NULL,
  `Client_Lastname` VARCHAR(45) NULL,
  `Client_Birth` DATE NOT NULL,
  `Client_Sex` VARCHAR(7) NOT NULL,
  `Client_TelefNumber` VARCHAR(13) NOT NULL,
  `Client_Email` VARCHAR(45) NOT NULL,
  `Client_BonusCard` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`ID_Client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `id_Position` INT NOT NULL,
  `Position_Name` VARCHAR(45) NOT NULL,
  `Position_Salary` INT NOT NULL,
  PRIMARY KEY (`id_Position`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `id_Employee` INT NOT NULL,
  `Employee_Surname` VARCHAR(45) NOT NULL,
  `Employee_Name` VARCHAR(45) NOT NULL,
  `Employee_LastName` VARCHAR(45) NULL,
  `Employee_Birth` DATE NOT NULL,
  `Employee_Sex` VARCHAR(7) NOT NULL,
  `Employee_Email` VARCHAR(45) NOT NULL,
  `Employee_TelefNumber` VARCHAR(13) NOT NULL,
  `Employee_Passport` VARCHAR(11) NOT NULL,
  `Employee_INN` VARCHAR(10) NOT NULL,
  `Employee_Snils` VARCHAR(45) NOT NULL,
  `Employee_DateEmployment` DATE NOT NULL,
  `Employee_DateDismissal` DATE NULL,
  `Position_id_Position` INT NOT NULL,
  PRIMARY KEY (`id_Employee`),
  INDEX `fk_Employee_Position1_idx` (`Position_id_Position` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Position1`
    FOREIGN KEY (`Position_id_Position`)
    REFERENCES `mydb`.`Position` (`id_Position`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cashbox`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cashbox` (
  `idCashbox` INT NOT NULL,
  `Cashbox_date_time` VARCHAR(45) NOT NULL,
  `Cashbox_Sum` INT NOT NULL,
  `Cashbox_operation_type` VARCHAR(45) NOT NULL,
  `Cashbox_operation_base` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCashbox`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Check`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Check` (
  `id_Check` INT NOT NULL,
  `Client_ID_Client` INT NOT NULL,
  `Employee_id_Employee` INT NOT NULL,
  `Cashbox_idCashbox` INT NOT NULL,
  PRIMARY KEY (`id_Check`),
  INDEX `fk_Bill_Client1_idx` (`Client_ID_Client` ASC) VISIBLE,
  INDEX `fk_Check_Employee1_idx` (`Employee_id_Employee` ASC) VISIBLE,
  INDEX `fk_Check_Cashbox1_idx` (`Cashbox_idCashbox` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_Client1`
    FOREIGN KEY (`Client_ID_Client`)
    REFERENCES `mydb`.`Client` (`ID_Client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Check_Employee1`
    FOREIGN KEY (`Employee_id_Employee`)
    REFERENCES `mydb`.`Employee` (`id_Employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Check_Cashbox1`
    FOREIGN KEY (`Cashbox_idCashbox`)
    REFERENCES `mydb`.`Cashbox` (`idCashbox`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bonus_Points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bonus_Points` (
  `Points` INT NOT NULL,
  `Points_Date` DATE NOT NULL,
  `TypeOfOperation` VARCHAR(45) NOT NULL,
  `Client_ID_Client` INT NOT NULL,
  `Bill_id_Bill` INT NOT NULL,
  INDEX `fk_Bonus_Points_Client1_idx` (`Client_ID_Client` ASC) VISIBLE,
  INDEX `fk_Bonus_Points_Bill1_idx` (`Bill_id_Bill` ASC) VISIBLE,
  CONSTRAINT `fk_Bonus_Points_Client1`
    FOREIGN KEY (`Client_ID_Client`)
    REFERENCES `mydb`.`Client` (`ID_Client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bonus_Points_Bill1`
    FOREIGN KEY (`Bill_id_Bill`)
    REFERENCES `mydb`.`Check` (`id_Check`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Refund_Check`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Refund_Check` (
  `id_RefundCheck` INT NOT NULL,
  `Check_id_Check` INT NOT NULL,
  `Client_ID_Client` INT NOT NULL,
  `Employee_id_Employee` INT NOT NULL,
  PRIMARY KEY (`id_RefundCheck`),
  INDEX `fk_Refund_Check_Check1_idx` (`Check_id_Check` ASC) VISIBLE,
  INDEX `fk_Refund_Check_Client1_idx` (`Client_ID_Client` ASC) VISIBLE,
  INDEX `fk_Refund_Check_Employee1_idx` (`Employee_id_Employee` ASC) VISIBLE,
  CONSTRAINT `fk_Refund_Check_Check1`
    FOREIGN KEY (`Check_id_Check`)
    REFERENCES `mydb`.`Check` (`id_Check`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Refund_Check_Client1`
    FOREIGN KEY (`Client_ID_Client`)
    REFERENCES `mydb`.`Client` (`ID_Client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Refund_Check_Employee1`
    FOREIGN KEY (`Employee_id_Employee`)
    REFERENCES `mydb`.`Employee` (`id_Employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `id_Order` INT NOT NULL,
  `Order_Sum` INT NOT NULL,
  `Order_Date` DATE NOT NULL,
  `Client_ID_Client` INT NOT NULL,
  PRIMARY KEY (`id_Order`),
  INDEX `fk_Order_Client1_idx` (`Client_ID_Client` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Client1`
    FOREIGN KEY (`Client_ID_Client`)
    REFERENCES `mydb`.`Client` (`ID_Client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Waybill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Waybill` (
  `idWaybill` INT NOT NULL,
  `Incoming_sum` INT NULL,
  `Legal_entity_idLegal_entity` INT NOT NULL,
  PRIMARY KEY (`idWaybill`),
  INDEX `fk_Waybill_Legal_entity1_idx` (`Legal_entity_idLegal_entity` ASC) VISIBLE,
  CONSTRAINT `fk_Waybill_Legal_entity1`
    FOREIGN KEY (`Legal_entity_idLegal_entity`)
    REFERENCES `mydb`.`Legal_entity` (`idLegal_entity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nomenclature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nomenclature` (
  `idNomenclature` INT NOT NULL,
  `Nomenclature_name` VARCHAR(45) NOT NULL,
  `Nomenclature_measure` VARCHAR(45) NOT NULL,
  `Nomenclature_description` VARCHAR(3000) NOT NULL,
  `Nomenclature_article` VARCHAR(45) NOT NULL,
  `Nomenclature_year` YEAR(4) NOT NULL,
  `Nomenclature_country` VARCHAR(45) NOT NULL,
  `Nomenclature_brand` VARCHAR(45) NOT NULL,
  `Nomenclature_colour` VARCHAR(45) NOT NULL,
  `Nomenclature_height` VARCHAR(45) NOT NULL,
  `Nomenclature_length` FLOAT NOT NULL,
  `Nomenclature_width` FLOAT NOT NULL,
  `Nomenclature_weight` FLOAT NOT NULL,
  `Nomenclature_configuration` VARCHAR(1000) NOT NULL,
  `Nomenclature_model` VARCHAR(45) NOT NULL,
  `Nomenclature_power` FLOAT NOT NULL,
  `Nomenclature_power_type` VARCHAR(45) NOT NULL,
  `Nomenclature_guarantee` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNomenclature`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Goods List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Goods List` (
  `Number_GoodsList` INT NOT NULL,
  `Price_GoodsList` INT NOT NULL,
  `Order_id_Order` INT NOT NULL,
  `Check_id_Check` INT NULL,
  `Waybill_idWaybill` INT NULL,
  `Nomenclature_idNomenclature` INT NOT NULL,
  INDEX `fk_Goods List_Order1_idx` (`Order_id_Order` ASC) VISIBLE,
  INDEX `fk_Goods List_Check1_idx` (`Check_id_Check` ASC) VISIBLE,
  INDEX `fk_Goods List_Waybill1_idx` (`Waybill_idWaybill` ASC) VISIBLE,
  INDEX `fk_Goods List_Nomenclature1_idx` (`Nomenclature_idNomenclature` ASC) VISIBLE,
  CONSTRAINT `fk_Goods List_Order1`
    FOREIGN KEY (`Order_id_Order`)
    REFERENCES `mydb`.`Order` (`id_Order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goods List_Check1`
    FOREIGN KEY (`Check_id_Check`)
    REFERENCES `mydb`.`Check` (`id_Check`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goods List_Waybill1`
    FOREIGN KEY (`Waybill_idWaybill`)
    REFERENCES `mydb`.`Waybill` (`idWaybill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goods List_Nomenclature1`
    FOREIGN KEY (`Nomenclature_idNomenclature`)
    REFERENCES `mydb`.`Nomenclature` (`idNomenclature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Price` (
  `idPrice` INT NOT NULL,
  `Price_value` INT NOT NULL,
  `Price_date` DATE NOT NULL,
  `Nomenclature_idNomenclature` INT NOT NULL,
  PRIMARY KEY (`idPrice`),
  INDEX `fk_Price_Nomenclature1_idx` (`Nomenclature_idNomenclature` ASC) VISIBLE,
  CONSTRAINT `fk_Price_Nomenclature1`
    FOREIGN KEY (`Nomenclature_idNomenclature`)
    REFERENCES `mydb`.`Nomenclature` (`idNomenclature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Warehouse` (
  `idWarehouse` INT NOT NULL,
  `Warehouse_quantity` INT NOT NULL,
  `Warehouse_date` DATE NOT NULL,
  `Warehouse_operation` VARCHAR(45) NOT NULL,
  `Nomenclature_idNomenclature` INT NOT NULL,
  PRIMARY KEY (`idWarehouse`),
  INDEX `fk_Warehouse_Nomenclature1_idx` (`Nomenclature_idNomenclature` ASC) VISIBLE,
  CONSTRAINT `fk_Warehouse_Nomenclature1`
    FOREIGN KEY (`Nomenclature_idNomenclature`)
    REFERENCES `mydb`.`Nomenclature` (`idNomenclature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Strorefront`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Strorefront` (
  `idStrorefront` INT NOT NULL,
  `Strorefront_quantity` INT NOT NULL,
  `Strorefront_date` DATE NOT NULL,
  `Strorefront_operation` VARCHAR(45) NOT NULL,
  `Nomenclature_idNomenclature` INT NOT NULL,
  PRIMARY KEY (`idStrorefront`),
  INDEX `fk_Strorefront_Nomenclature1_idx` (`Nomenclature_idNomenclature` ASC) VISIBLE,
  CONSTRAINT `fk_Strorefront_Nomenclature1`
    FOREIGN KEY (`Nomenclature_idNomenclature`)
    REFERENCES `mydb`.`Nomenclature` (`idNomenclature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;