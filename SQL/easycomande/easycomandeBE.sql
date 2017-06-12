-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema easycomandeBE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easycomandeBE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easycomandeBE` DEFAULT CHARACTER SET utf8 ;
USE `easycomandeBE` ;

-- -----------------------------------------------------
-- Table `easycomandeBE`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`categories` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `slug` VARCHAR(45) NOT NULL,
  `count` INT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`menu` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `priceoffer` DOUBLE NULL DEFAULT 0,
  `category_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_menu_categories_idx` (`category_id` ASC),
  CONSTRAINT `fk_menu_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `easycomandeBE`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`state` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`orders` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `client` VARCHAR(200) NOT NULL,
  `totalorder` DOUBLE NOT NULL,
  `totalservice` DOUBLE NOT NULL,
  `state_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_orders_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `easycomandeBE`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`items` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL DEFAULT 1,
  `total` DOUBLE NOT NULL DEFAULT 0,
  `service` DOUBLE NOT NULL DEFAULT 0,
  `note` VARCHAR(500) NULL,
  `menu_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `menuname` VARCHAR(45) NOT NULL,
  `statename` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_menu1_idx` (`menu_id` ASC),
  INDEX `fk_items_orders1_idx` (`order_id` ASC),
  INDEX `fk_items_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_items_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `easycomandeBE`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `easycomandeBE`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `easycomandeBE`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`notes` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `note` VARCHAR(500) NOT NULL,
  `order_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_notes_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `easycomandeBE`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`specials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`specials` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`specials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `special` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `order_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_specials_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_specials_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `easycomandeBE`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`extra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`extra` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`extra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `priceoffer` DOUBLE NULL DEFAULT 0,
  `hasextra` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `easycomandeBE`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easycomandeBE`.`users` ;

CREATE TABLE IF NOT EXISTS `easycomandeBE`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(255) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
