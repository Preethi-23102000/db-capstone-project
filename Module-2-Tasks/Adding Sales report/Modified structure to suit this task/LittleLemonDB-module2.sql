-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB-2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB-2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB-2` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB-2` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `EmailID` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`Bookings` (
  `BookingsID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingsID`),
  INDEX `cutomer-booking-id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `cutomer-booking-id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB-2`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`Orders` (
  `OrderId` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `cust-order_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `cust-order`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB-2`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`Menus` (
  `MenuId` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`OrderDeliveryStatus` (
  `StatusID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  PRIMARY KEY (`StatusID`),
  INDEX `order-statys-id_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order-statys-id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB-2`.`Orders` (`OrderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`OrderDetails` (
  `OrderDetailsID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `QuantityOfMenuItem` INT NOT NULL,
  `TotalForMenuItem` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderDetailsID`),
  INDEX `order-detail_idx` (`OrderID` ASC) VISIBLE,
  INDEX `menu-detail_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `order-detail`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB-2`.`Orders` (`OrderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu-detail`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB-2`.`Menus` (`MenuId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`StaffandOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`StaffandOrder` (
  `StaffandOrderID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`StaffandOrderID`),
  INDEX `order-is_idx` (`OrderID` ASC) VISIBLE,
  INDEX `staff-id_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `order-id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB-2`.`Orders` (`OrderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff-id`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB-2`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`MenuItem` (
  `MenuItemId` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuItemId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB-2`.`MenuItemRelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB-2`.`MenuItemRelation` (
  `MenuItemRelID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `MenuItemId` INT NOT NULL,
  PRIMARY KEY (`MenuItemRelID`),
  INDEX `menu-id_idx` (`MenuID` ASC) VISIBLE,
  INDEX `menu-tem-id_idx` (`MenuItemId` ASC) VISIBLE,
  CONSTRAINT `menu-id`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB-2`.`Menus` (`MenuId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu-tem-id`
    FOREIGN KEY (`MenuItemId`)
    REFERENCES `LittleLemonDB-2`.`MenuItem` (`MenuItemId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
