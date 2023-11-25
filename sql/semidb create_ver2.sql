-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema semidb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema semidb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `semidb` DEFAULT CHARACTER SET utf8 ;
USE `semidb` ;

-- -----------------------------------------------------
-- Table `semidb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`member` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(20) NOT NULL,
  `gender` INT NULL,
  `birthDate` DATE NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semidb`.`disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`disease` (
  `cntntsSn` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`cntntsSn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semidb`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`food` (
  `num` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `effect` VARCHAR(45) NULL,
  PRIMARY KEY (`num`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semidb`.`helpfulfood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`helpfulfood` (
  `num` INT NOT NULL,
  `disease_cntntsSn` INT NOT NULL,
  `food_num` INT NOT NULL,
  PRIMARY KEY (`num`),
  INDEX `fk_helpfulfood_disease1_idx` (`disease_cntntsSn` ASC) VISIBLE,
  INDEX `fk_helpfulfood_food1_idx` (`food_num` ASC) VISIBLE,
  CONSTRAINT `fk_helpfulfood_disease1`
    FOREIGN KEY (`disease_cntntsSn`)
    REFERENCES `semidb`.`disease` (`cntntsSn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_helpfulfood_food1`
    FOREIGN KEY (`food_num`)
    REFERENCES `semidb`.`food` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semidb`.`survey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`survey` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cntMeals` INT NULL,
  `breakfast` VARCHAR(45) NULL,
  `regularMeal` VARCHAR(45) NULL,
  `speed` VARCHAR(45) NULL,
  `overEatting` VARCHAR(45) NULL,
  `cntGrain` VARCHAR(45) NULL,
  `member_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_survey_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_survey_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `semidb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semidb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semidb`.`review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` VARCHAR(45) NOT NULL,
  `disease_cntntsSn` INT NOT NULL,
  `dateWrtn` DATETIME NULL,
  `views` INT NULL,
  `title` VARCHAR(45) NULL,
  `content` VARCHAR(45) NULL,
  `attachments` VARCHAR(45) NULL,
  `tag` VARCHAR(45) NULL,
  `rcm` INT NULL,
  `nonrcm` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_disease1_idx` (`disease_cntntsSn` ASC) VISIBLE,
  INDEX `fk_review_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_disease1`
    FOREIGN KEY (`disease_cntntsSn`)
    REFERENCES `semidb`.`disease` (`cntntsSn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `semidb`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;