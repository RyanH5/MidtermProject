-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trippingdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trippingdb` ;

-- -----------------------------------------------------
-- Schema trippingdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trippingdb` DEFAULT CHARACTER SET utf8 ;
USE `trippingdb` ;

-- -----------------------------------------------------
-- Table `journal_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_entry` ;

CREATE TABLE IF NOT EXISTS `journal_entry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` LONGTEXT NULL,
  `image_url` TEXT NULL,
  `is_public` TINYINT NULL,
  `is_complete` TINYINT NULL,
  `title` VARCHAR(45) NULL,
  `entry_text` LONGTEXT NULL,
  `create_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `journal_id` INT NOT NULL,
  `create_date` TIMESTAMP NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`, `journal_id`),
  INDEX `fk_user_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_user_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal_entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `image_url` TEXT NULL,
  `short_description` VARCHAR(450) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street_1` VARCHAR(150) NULL,
  `street_2` VARCHAR(150) NULL,
  `city` VARCHAR(200) NULL,
  `state` VARCHAR(250) NULL,
  `zip` VARCHAR(9) NULL,
  `phone` VARCHAR(20) NULL,
  `lat` DECIMAL NULL,
  `long` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity` ;

CREATE TABLE IF NOT EXISTS `amenity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `short_description` VARCHAR(450) NULL,
  `description` TEXT NULL,
  `icon_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NULL,
  `short_description` VARCHAR(45) NULL,
  `long_description` TEXT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `event_details` TEXT NULL,
  `description` TEXT NULL,
  `destination_id` INT NOT NULL,
  PRIMARY KEY (`id`, `destination_id`),
  INDEX `fk_event_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_event_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_image` ;

CREATE TABLE IF NOT EXISTS `event_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`, `event_id`),
  INDEX `fk_event_images_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_images_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal_entry_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_entry_image` ;

CREATE TABLE IF NOT EXISTS `journal_entry_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `journal_id` INT NOT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`, `journal_id`),
  INDEX `fk_journal_images_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_journal_images_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal_entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination_has_activitiy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_has_activitiy` ;

CREATE TABLE IF NOT EXISTS `destination_has_activitiy` (
  `activitiy_id` INT NOT NULL,
  `destination_id` INT NOT NULL,
  PRIMARY KEY (`activitiy_id`, `destination_id`),
  INDEX `fk_activities_has_destination_destination1_idx` (`destination_id` ASC),
  INDEX `fk_activities_has_destination_activities1_idx` (`activitiy_id` ASC),
  CONSTRAINT `fk_activities_has_destination_activities1`
    FOREIGN KEY (`activitiy_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_has_destination_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination_user_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_user_review` ;

CREATE TABLE IF NOT EXISTS `destination_user_review` (
  `user_id` INT NULL,
  `destination_id` INT NULL,
  `create_date` TIMESTAMP NULL,
  `title` VARCHAR(250) NULL,
  `rating` INT NULL,
  `review_text` TEXT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `destination_user_reviewcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_destination_destination1_idx` (`destination_id` ASC),
  INDEX `fk_user_has_destination_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_destination_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_destination_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_user_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_user_review` ;

CREATE TABLE IF NOT EXISTS `event_user_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `create_date` TIMESTAMP NULL,
  `title` VARCHAR(250) NULL,
  `rating` INT NULL,
  `review_text` TEXT NULL,
  `event_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_event_has_user_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_has_user_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest` ;

CREATE TABLE IF NOT EXISTS `point_of_interest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NULL,
  `address_id` INT NOT NULL,
  `destination_id` INT NOT NULL,
  PRIMARY KEY (`id`, `address_id`, `destination_id`),
  INDEX `fk_point_of_interest_address1_idx` (`address_id` ASC),
  INDEX `fk_point_of_interest_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_point_of_interest_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_of_interest_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest_has_amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest_has_amenity` ;

CREATE TABLE IF NOT EXISTS `point_of_interest_has_amenity` (
  `point_of_interest_id` INT NOT NULL,
  `amenity_id` INT NOT NULL,
  PRIMARY KEY (`point_of_interest_id`, `amenity_id`),
  INDEX `fk_point_of_interest_has_amenity_amenity1_idx` (`amenity_id` ASC),
  INDEX `fk_point_of_interest_has_amenity_point_of_interest1_idx` (`point_of_interest_id` ASC),
  CONSTRAINT `fk_point_of_interest_has_amenity_point_of_interest1`
    FOREIGN KEY (`point_of_interest_id`)
    REFERENCES `point_of_interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_of_interest_has_amenity_amenity1`
    FOREIGN KEY (`amenity_id`)
    REFERENCES `amenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest_has_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest_has_activity` ;

CREATE TABLE IF NOT EXISTS `point_of_interest_has_activity` (
  `point_of_interest_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`point_of_interest_id`, `activity_id`),
  INDEX `fk_point_of_interest_has_activity_activity1_idx` (`activity_id` ASC),
  INDEX `fk_point_of_interest_has_activity_point_of_interest1_idx` (`point_of_interest_id` ASC),
  CONSTRAINT `fk_point_of_interest_has_activity_point_of_interest1`
    FOREIGN KEY (`point_of_interest_id`)
    REFERENCES `point_of_interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_of_interest_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS tripping@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'tripping'@'localhost' IDENTIFIED BY 'tripping';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'tripping'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
