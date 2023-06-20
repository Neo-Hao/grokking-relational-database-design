-- MySQL Script generated by MySQL Workbench
-- Tue Jun 20 08:00:05 2023
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `last_accessed` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `Username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_id` INT NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(1000) NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `items_available` SMALLINT NOT NULL DEFAULT 0,
  `cost` DECIMAL(5,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment_info` (
  `payment_id` BIGINT NOT NULL,
  `credit_card_number` CHAR(16) NOT NULL,
  `expiry_date` CHAR(4) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `csc` CHAR(4) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_PaymentInfo_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_PaymentInfo_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transaction` (
  `transaction_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `purchase_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` BIGINT NOT NULL,
  `total_price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_User_has_Product_User_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Purchase_PaymentInfo1_idx` (`payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Product_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_PaymentInfo1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment_info` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review` (
  `review_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `product_id` INT NOT NULL,
  `review_text` TEXT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  INDEX `fk_User_has_Product_Product2_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_User_has_Product_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Product_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Product_Product2`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`purchase` (
  `transaction_id` BIGINT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` TINYINT NOT NULL DEFAULT 1,
  `product_price` DECIMAL(5,2) NOT NULL,
  INDEX `fk_Order_Product1_idx` (`product_id` ASC) INVISIBLE,
  INDEX `fk_purchase_transaction1_idx` (`transaction_id` ASC) VISIBLE,
  PRIMARY KEY (`transaction_id`, `product_id`),
  CONSTRAINT `fk_Order_Product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `mydb`.`transaction` (`transaction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`phone` (
  `phone_number` BIGINT NOT NULL,
  `type` ENUM('Home', 'Cell') NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`phone_number`, `user_id`),
  INDEX `fk_Phone_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Phone_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
