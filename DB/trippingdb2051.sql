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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(150) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NULL,
  `last_name` VARCHAR(150) NULL,
  `email` VARCHAR(150) NULL,
  `create_date` TIMESTAMP NULL,
  `image_url` TEXT NULL,
  `role` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `description` TEXT NULL,
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
  `latitude` DECIMAL NULL,
  `longitude` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL,
  `destination_id` INT NOT NULL,
  `name` VARCHAR(450) NOT NULL,
  `short_description` VARCHAR(450) NULL,
  `long_description` TEXT NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `event_details` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_event_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NOT NULL,
  `short_description` VARCHAR(450) NULL,
  `long_description` TEXT NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal_entry` ;

CREATE TABLE IF NOT EXISTS `journal_entry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `is_public` TINYINT NULL,
  `is_complete` TINYINT NULL,
  `title` VARCHAR(150) NULL,
  `entry_text` LONGTEXT NULL,
  `create_date` DATETIME NULL,
  `destination_id` INT NULL,
  `event_id` INT NULL,
  `activitity_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_entry_user_idx` (`user_id` ASC),
  INDEX `fk_entry_destination_idx` (`destination_id` ASC),
  INDEX `fk_entry_event_idx` (`event_id` ASC),
  INDEX `fk_entry_activity_idx` (`activitity_id` ASC),
  CONSTRAINT `fk_journal_entry_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_destination`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_activity`
    FOREIGN KEY (`activitity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity` ;

CREATE TABLE IF NOT EXISTS `amenity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `short_description` VARCHAR(450) NULL,
  `long_description` TEXT NULL,
  `icon_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_image` ;

CREATE TABLE IF NOT EXISTS `event_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `image_url` TEXT NOT NULL,
  PRIMARY KEY (`id`),
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
  PRIMARY KEY (`id`),
  INDEX `fk_journal_images_journal1_idx` (`journal_id` ASC),
  CONSTRAINT `fk_journal_images_journal1`
    FOREIGN KEY (`journal_id`)
    REFERENCES `journal_entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination_user_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_user_review` ;

CREATE TABLE IF NOT EXISTS `destination_user_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `destination_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `title` VARCHAR(250) NULL,
  `rating` INT NULL,
  `review_text` TEXT NULL,
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
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `title` VARCHAR(150) NULL,
  `rating` INT NULL,
  `review_text` TEXT NULL,
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
  `short_description` VARCHAR(450) NULL,
  `long_description` TEXT NULL,
  PRIMARY KEY (`id`),
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


-- -----------------------------------------------------
-- Table `point_of_interest_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest_comment` ;

CREATE TABLE IF NOT EXISTS `point_of_interest_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `poi_id` INT NOT NULL,
  `comment_text` TEXT NULL,
  `rating` INT NULL,
  `comment_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_poi_id_idx` (`user_id` ASC),
  INDEX `fk_poi_id_idx` (`poi_id` ASC),
  CONSTRAINT `fk_user_poi_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poi_id`
    FOREIGN KEY (`poi_id`)
    REFERENCES `point_of_interest` (`id`)
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

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (1, 'ryanh5', ' \"password2.0\"', ' \"ryan\"', ' \"harr\"', ' \"harr@gmail.com\"', ' 2015-07-11 11:00:00', ' \"myimage.jpg\"', ' \"notAdmin\"',  0);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (2, 'craigh', ' \"passwo3.0\"', ' \"craig\"', ' \"smith\"', ' \"smith@gmail.com\"', ' 2015-07-11 11:00:00', ' \"craigsimagage.jpg\"', ' \"Admin\"',  1);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (3, 'chana', ' \"password7.0\"', ' \"chana\"', ' \"lName\"', ' \"chana@gmail.com\"', ' 2015-07-11 11:00:00', ' \"chanaimage.jpg\"', ' \"notAdmin\"',  1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (1, 'mt elber', 'mountain mountain', 'bigmtn.jpg', 'mtn mtn');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (2, 'st mary glackier', 'crevasse rescue mountain', 'bigglacker.jpg', 'alpine mtn');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (3, 'vail', 'ski snowboard mountain mountain', 'touristsmtn.jpg', 'rich mtn');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (4, 'grand junctions', 'trains bikes mountain', 'trainsmtn.jpg', 'trainmtn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `address` (`id`, `street_1`, `street_2`, `city`, `state`, `zip`, `phone`, `latitude`, `longitude`) VALUES (1, '329 birch ct', 'market street', 'palm harbor', 'fl', '80499', '727-545-5708', 39.833, 59.543);
INSERT INTO `address` (`id`, `street_1`, `street_2`, `city`, `state`, `zip`, `phone`, `latitude`, `longitude`) VALUES (2, '3 palm ct', 'blake street', 'dener', 'AK', '80239', '727-595-5708', 39.833, 59.543);
INSERT INTO `address` (`id`, `street_1`, `street_2`, `city`, `state`, `zip`, `phone`, `latitude`, `longitude`) VALUES (3, '29 blvd ct', 'jump street', 'phoenix', 'CT', '80239', '727-515-5708', 39.833, 59.513);
INSERT INTO `address` (`id`, `street_1`, `street_2`, `city`, `state`, `zip`, `phone`, `latitude`, `longitude`) VALUES (4, '3 round st', 'ssgfa  street', 'tucson', 'az', '80299', '727-525-5708', 39.833, 49.543);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (1, 1, 'P peaches', 'tasty fruits in the mountains', 'peaches strawberries blah blach mtn food', '2017-07-11 21:00:00', '2017-09-11 21:00:00', 'starts at time ends at later time');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (2, 3, 'telluride blues n brews', 'beer n bluegrass', 'billy strings beer music food', '2017-05-11 21:00:00', '2017-09-11 21:00:00', 'starts at time ends at later time');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (1, '\"hike\"', '\"many_trails\"', '\"easy_moderate_difficult_trails\"', NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (2, '\"mointain_bike\"', '\"trails_for_all_levels\"', '\"easy_moderate_difficult_trails\"', NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (3, '\"ski\"', '\"perfect_powder\"', '\"easy_moderate_difficult_trails\"', NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (4, '\"kayak\"', '\"whitewater_or_flatwater\"', '\"rough_rapids_moderate_rapids_or_smooth_water\"', NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (5, '\"camp\"', '\"rv_or_tent\"', '\"rv_water_electric_hookup_or_car_tent_camp_backpack_tent_camp\"', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `journal_entry`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (1, 1, 0, 1, 'Mtn biking in golden', 'went riding it was sick btw it was awesome', '2017-07-11 21:00:00', NULL, NULL, NULL);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (2, 2, 0,  1, ' \"Skiing in Vail\"', ' \"I skied so fast so fast good time yay\"', ' 2017-07-11 21:00:00', NULL, NULL, NULL);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (3, 1, 1, 0, 'Dirtbiking in GJ was so dirty.', 'sick time whatever whatver', '2017-07-11 21:00:00', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (1, 'ADA', 'wheel chair accessible stuff', 'lots of safety stuff stuff stufgf', 'image.url');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (2, 'Pet Friendly', 'things are awesome with dogs dogs', 'dog bowls dog parks dog bones dogs all over', 'dog.url');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (3, 'Pet Friendly', 'things are awesome with dogs dogs', 'dog bowls dog parks dog bones dogs all over', 'cat.url');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (4, 'hotel', 'wgasgsg heel chair accessible stuff', 'lots of safety stfds suff stuff stufgf', 'hotel.url');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `event_image` (`id`, `event_id`, `image_url`) VALUES (1, 2, 'fakeimage.url');
INSERT INTO `event_image` (`id`, `event_id`, `image_url`) VALUES (2, 2, 'fakeimage2.url');
INSERT INTO `event_image` (`id`, `event_id`, `image_url`) VALUES (3, 1, 'fakeimage3.url');

COMMIT;


-- -----------------------------------------------------
-- Data for table `journal_entry_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `journal_entry_image` (`id`, `journal_id`, `image_url`) VALUES (1, 1, 'image whatever.jpg');
INSERT INTO `journal_entry_image` (`id`, `journal_id`, `image_url`) VALUES (2, 2, 'some image.jpg');
INSERT INTO `journal_entry_image` (`id`, `journal_id`, `image_url`) VALUES (3, 3, 'another image.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination_user_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `destination_user_review` (`id`, `user_id`, `destination_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (1, 1, 2, '2017-07-11 21:00:00', 'golden biking review', 4, 'it was so awesome i broke my arm');
INSERT INTO `destination_user_review` (`id`, `user_id`, `destination_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (2, 2, 3, '2017-07-11 21:00:00', 'grand junction biking review', 1, 'it was so awesome i broke my arm');
INSERT INTO `destination_user_review` (`id`, `user_id`, `destination_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (3, 1, 2, '2017-07-11 21:00:00', 'vail skiing review', 2, 'it was so awesome i broke my arm');
INSERT INTO `destination_user_review` (`id`, `user_id`, `destination_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (4, 1, 2, '2017-07-11 21:00:00', 'colorado springss climbing review', 5, 'it was so awesome i broke my arm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_user_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `event_user_review` (`id`, `user_id`, `event_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (1, 1, 1, NULL, 'tasty fruits in the mountains', NULL, NULL);
INSERT INTO `event_user_review` (`id`, `user_id`, `event_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (2, 2, 1, NULL, 'tasty fruits in the mountains', NULL, NULL);
INSERT INTO `event_user_review` (`id`, `user_id`, `event_id`, `create_date`, `title`, `rating`, `review_text`) VALUES (3, 3, 2, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `point_of_interest` (`id`, `name`, `address_id`, `destination_id`, `short_description`, `long_description`) VALUES (1, 'Specific Trailhead', 1, 1, NULL, NULL);
INSERT INTO `point_of_interest` (`id`, `name`, `address_id`, `destination_id`, `short_description`, `long_description`) VALUES (2, 'Specific Trailhead', 1, 1, NULL, NULL);
INSERT INTO `point_of_interest` (`id`, `name`, `address_id`, `destination_id`, `short_description`, `long_description`) VALUES (3, 'Fishing Hole', 1, 1, NULL, NULL);
INSERT INTO `point_of_interest` (`id`, `name`, `address_id`, `destination_id`, `short_description`, `long_description`) VALUES (4, 'Kayak Drop-In Site', 1, 1, NULL, NULL);
INSERT INTO `point_of_interest` (`id`, `name`, `address_id`, `destination_id`, `short_description`, `long_description`) VALUES (5, 'Kayak Drop-In Site', 1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `point_of_interest_comment` (`id`, `user_id`, `poi_id`, `comment_text`, `rating`, `comment_date`) VALUES (1, 1, 1, 'sometext', 5, NULL);

COMMIT;

