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
  `short_description` VARCHAR(4000) NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (1, 'ryanh5', 'pw4', 'Ryan', 'Last', ' harr@gmail.com', ' 2015-07-11 11:00:00', 'https://i.pinimg.com/originals/a9/ee/44/a9ee4406650438b8e098163b0fe070a6.jpg', 'notAdmin',  0);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (2, 'craigh', 'pw3', 'Craig', 'Last', ' smith@gmail.com', ' 2015-07-11 11:00:00', 'https://amp.businessinsider.com/images/56b518716e97c623048b55ea-1136-852.jpg', 'admin',  1);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (3, 'chana', 'pw2', 'Chana', 'Last', ' chana@gmail.com', ' 2015-07-11 11:00:00', 'https://www.ewawomen.com/wp-content/uploads/2017/06/fotonoticia_20170519143811_640.jpg', 'notAdmin', 0);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (4, 'cecilK', 'pw1', 'Cecil', 'Last', 'cecil@gmail.com', ' 2015-07-11 11:00:00', 'https://cdn3.movieweb.com/i/article/iHv27xjYnJjgAPSYuF5yhifnceZs9p/798:50/Star-Trek-4-Chris-Pine-Returning-Waiting-Paramount.jpg', 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (1, 'Estes Park', 'Estes Park lies at the entrence to Colorado\'s jewl, Rocky Mountain National Park. At an elevation of 7522\', Estes Park offers fantastic scenery and wildlife, as well as great shops, restaurants, and prime lodging.', 'https://i.pinimg.com/originals/bd/2d/1a/bd2d1a7d8983b3ee48a3fbace93b1039.jpg', 'Estes Park is a great place to escape the hustle and bustle of Denver and the summertime heat at lower elevation.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (2, 'Dinosaur', 'Located in the northwest corner of Colorado, is the town of Dinosaur. Origonaly named Baxter Springs, then Artesia, and renamed again in 1966, Dinosaur.', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/CONM_DinosaurDiamond.jpg?itok=pmSFMQen', 'Dinoaur offers great ancient history with easy access to Dinosaur National Monument with a touch of modern amenities.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (3, 'Golden', 'Golden is rich with history and activities for the whole family at an elevation of 5675\'. Golden was in the battle during the gold rush days, as a prime location for Colorado\'s state capital only to loose out to Denver. Golden is located at the base of the foothills and is home to Colorado\'s origonal brewery, Coors.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BFc6vJXsxBE-4qtIlq-aYcHZsiP8vqgBuwcGEDXZV7EAIdrFHg', 'Golden is situated at the mouth of Clear Creek and GoldenGate Canyons both offering access ino the higher elevation rocky mountains and only a short drive into Denver.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (4, 'Colorado Springs', 'Colorado Springs, at an elevation of 6,035 ft., is a city in Colorado at the eastern foot of the Rocky Mountains. It lies near glacier-carved Pikes Peak, a landmark in Pike National Forest with hiking trails and a cog railway leading to its 14,114-ft. summit. The city\'s Garden of the Gods park features iconic red-sandstone formations and mountain views.', 'https://lh4.googleusercontent.com/proxy/LWs8J1-A6iZvYtqZ9t3P8Ui2hW13B1KH0I4ZHt498R_0cftEZSR75Pc6jNckFhXXtkA257sph7dFZyzFPWfpWH2F3XbHXXekSU5H-1sD320O2GQub4x1BFDuCo7PeIZu0s5nXPMheXlQl5zqxYB0Eua6IrM=w357-h238-k-no', 'Colorado Springs, at an elevation of 6,035 ft., is a city in Colorado at the eastern foot of the Rocky Mountains. It lies near glacier-carved Pikes Peak, a landmark in Pike National Forest with hiking trails and a cog railway leading to its 14,114-ft. summit. The city\'s Garden of the Gods park features iconic red-sandstone formations');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (5, 'Boulder', 'Boulder is a city at the foothills of the Rocky Mountains, in northern Colorado. To the west, the trail-lined Flatirons are craggy rock formations overlooking the city. Downtown’s pedestrian Pearl Street Mall includes art galleries, cafes, restaurants and boutiques. The University of Colorado Boulder campus is home to the Fiske Planetarium and the Museum of Natural History, with zoology and anthropology exhibits. Vendors sell produce, flowers and prepared food at the Boulder County Farmers Markets. Outside Central Park, the Boulder Museum of Contemporary Art hosts rotating exhibits. Chautauqua Park is a grassy meadow at the foot of mountain hiking trails. Southwest of the city, Flagstaff Mountain includes the Flagstaff Nature Center and Sunrise Amphitheater, plus trails. Farther south, towering sandstone cliffs frame South Boulder Creek at Eldorado Canyon State Park.', 'https://lh6.googleusercontent.com/proxy/rsmMewRljY-3dW1h5cncG5PhX3BBAdMm-YmodhK1eKlWmWD_JRry7khUx4pVXrE12vkLdyNeF4EEKo08zVxW0xfde7K_Kf9nGxt2-1BbyjvpPMvLFnuf3UYXYZoNr7l7FnPROCBGLQeXBv28sWjQ92c2hDA=w357-h238-k-no', 'Boulder is a city at the foothills of the Rocky Mountains, in northern Colorado. To the west, the trail-lined Flatirons are craggy rock formations overlooking the city. Downtown’s pedestrian Pearl Street Mall includes art galleries, cafes, restaurants and boutiques.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (6, 'Aspen', 'While Aspen, Colorado is known as a travel destination frequented by the rich and famous, Aspen visitors and locals know this beautiful Colorado mountain town for its four ski resorts—Aspen Mountain, Snowmass Mountain, Aspen Highlands Mountain, and Buttermilk Mountain--as well as its variety of outdoor activities, arts programs, cultural events, and cosmopolitan nightlife. Aspen offers restaurants, shopping, lodging, and nightlife that cater to a range of budgets and experiences. Aspen also emphasizes preserving the environment, celebrating its silver mining heritage, and promoting the arts, culture, and local non-profits.', 'https://images.prod.meredith.com/product/2a09da9588ffe3362f4482f3bb48e509/1553872773850/l/maroon-bells-aspen-colorado-canvas-print-small-by-charitybarkley', 'Aspen is located in the Rocky Mountains at an elevation of 7,815 feet and encompasses 1.99 square miles. It is the 50th largest city in Colorado and is approximately 200 miles southwest of Denver. Aspen is located at the southern end of the lush Roaring Fork Valley, along with the neighboring cities of Glenwood Springs, Carbondale, El Jebel, and Basalt.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (7, 'Durango', 'Situated in Southwest Colorado, Durango is one of the state’s best-kept secrets. Surrounded by diverse and dramatic landscapes, from the Animas River Valley’s sandstone bluffs to the San Juan Mountains’ jagged peaks, Durango offers unparalleled access to the great outdoors, authentic Western heritage and culture, and a historic, walkable downtown full of hip shops, unique eateries and a dynamic art scene. Discover why the locals say that once you’ve been to Durango, you’ll never truly leave it behind.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTzRPOHozA4ER-72scO7z71FQcPfQVzfefSUZ5ZDxtWegy-_M', 'Durango is a small city in southwestern Colorado, near the New Mexico border. The 19th-century Durango & Silverton Narrow Gauge Railroad steam train passes mountains and canyons. In the city center, its affiliated Railroad Museum displays restored locomotives, aircraft and a baggage car converted into a movie theater. Nearby, the Powerhouse Science Center offers interactive exhibits in a former power plant.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (8, 'Gunnison', 'Gunnison is rather like a home on the range surrounded by ski areas, a national recreation area, national park, lakes, rivers and mesas and high-mountain sage that looks like it’s right out of a John Wayne Western movie. The city, which feels like a cattleman\'s town, is the kind of place where you don\'t feel like a tourist as much as somebody visiting the folks.', 'https://www.uncovercolorado.com/wp-content/uploads/2015/01/Blue-Mesa-Reservoir-Gunnison-County-Colorado-Op-650x325.jpg', 'It\'s a great base camp for exploring a treasure trove of natural and manmade attractions.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (9, 'Grand Junction', 'Grand Junction is the largest city on Colorado\'s Western Slope, and serves as a hub for transportation and shipping between Denver and Salt Lake City. The population of the Grand Junction, according to the 2010 Census, is 146,723. The name Grand Junction stems from the junction of the Colorado River (formerly known as the Grand River) and the Gunnison River. The area was first settled by Europeans in the 1880s, but the area\'s history of human civilization stretches back thousands of years including the Ute and Fremont tribes, among others. Remnants of the tribal history includes petroglyphs and cave paintings, among other items. In the late 19th century, settlers were drawn to the fertile Grand Valley for its agricultural potential, and the area remains one of Colorado\'s largest food producers, including peaches, pears, cherries and corn. In the late 1970s and early 1980s the first grape vines were planted, sparking an increase in wine production. Now home to more than 20 wineries, Grand Junction is known as Colorado\'s Wine Country. The warm days and cool nights are exceptional conditions for producing hearty grapes, and red wine varietals in particular flourish in the conditions.', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/GJ3_CONationalMonument_.jpg?itok=tgOG2x3Y', 'The area was first settled by Europeans in the 1880s, but the area\'s history of human civilization stretches back thousands of years including the Ute and Fremont tribes, among others. Remnants of the tribal history includes petroglyphs and cave paintings, among other items. In the late 19th century, settlers were drawn to the fertile Grand Valley for its agricultural potential, and the area remains one of Colorado\'s largest food producers, including peaches, pears, cherries and corn. In the late 1970s and early 1980s the first grape vines were planted, sparking an increase in wine production. Now home to more than 20 wineries, Grand Junction is known as Colorado\'s Wine Country. The warm days and cool nights are exceptional conditions for producing hearty grapes, and red wine varietals in particular flourish in the conditions.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (10, 'Telluride', 'Telluride is tucked into a box canyon surrounded by 13,000 and 14,000-foot peaks. The town of Telluride is just eight blocks wide and twelve blocks long. Because of its significant role in the history of the American West, the core area of Telluride was designated a National Historic Landmark District in 1964. This listing is the highest level of historic status available from the United States Secretary of the Interior. These sites are so special that they are eligible for consideration to become national parks. With the town\'s colorful Victorian-era homes, clapboard storefronts, boutiques, art galleries, gourmet restaurants, historic buildings and more, Telluride is a delight to explore. Our citizens are committed to preserving Telluride\'s historically significant architecture, open space, traditional design elements and, most of all, Telluride’s small-town mountain lifestyle.', 'https://www.visittelluride.com/site/assets/files/1363/14277210064b3b122.503x304.jpg', 'To some, Telluride is known for world-class alpine skiing, and to others, summers full of cultural events and endless outdoor activities. But what runs true for everyone isTelluride\'s authentic mountain character, unpretentious attitude and celebration of four seasons of adventure in the Rocky Mountain high country.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (11, 'Denver', 'Founded in the mid-1800s as a mining hub during the gold rush, Denver has come a long way since its Wild West days. Over time, its residents have evolved from gunslinging gamblers into an easygoing crowd of ambitious, progressive-minded fitness fanatics and nature lovers who are eager to push the envelope on everything from civil rights to drug laws. Nicknamed the Mile High City for its 5,280-foot elevation (although officially reported as 5,279 feet), Denver\'s location at the base of the Rocky Mountains provides a gateway to a slew of outdoor pursuits, although it is probably best known for its devout ski and snowboard enthusiasts.', 'https://www.langan.com/wp-content/uploads/2017/08/Denver.jpg', 'Denver, located at the junction of the South Platte River and Cherry Creek, is the state capital and largest city in Colorado. Situated 5672 feet above sea level in the shadows of the Rocky Mountains, Denver is known as the \"Mile High City.\"');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (12, 'Glenwood Springs', 'Glenwood Springs is a resort city in Colorado known for its hot springs. It sits in the rugged Rocky Mountains, surrounded by the vast White River National Forest. Glenwood Canyon is rich with wildlife and features Hanging Lake, with its striking turquoise waters. Glenwood Caverns are ancient underground caves. Glenwood Caverns Adventure Park has roller coasters and canyon swings overlooking the Colorado River.', 'https://lh5.googleusercontent.com/proxy/P8_SkrMJ1UcetZl4V-FFC4jvwADDXhAqNarLcWdvZOC8XqkbSVORRq_2TlIIlPheifY-UHihwTuXG_9xsmXtFQG24K0HkQYo0jd9kWc4IYA88Yomlbv5DKkYhvpBnBRf3T0w-irmIo4qVmFLnUkudaftWN8=w318-h238-k-no', 'Known for it\'s soothing hotsprings, surrounded by national forest in the heart of the Rocky Mountains');

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
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (1, 1, 'Jazz Fest, Estes Park', 'No matter the type of music, always a gteat time', 'Many bands in one great location with a great backdrop', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Cost $10 per day or $15 whole weekend early purchase');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (2, 1, 'Rooftop Rodeo, Estes Park', 'Not really on the rooftop', 'The wild west was build with rodeo as entertainment. Estes Park is the west', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'FREE for all ages');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (3, 1, 'Estes Park Wine Fest', 'It\'s really good grape juice', 'Great views, great friends, yummy foods once you realize food is a good idea with consumption of wine', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Price TBD');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (4, 2, 'Grand Old West Days', 'Multi day, multi event extravangaza Memorial Day weekend', 'Includes 150 Anniv. of John Weley Powell expadition, Young Life Car Show, Moffat County Balloon Fest, Moffat County Fair and much more...', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Family fun Memorial Day week');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (5, 2, 'Moffat County Balloon Festival', 'Join us for the sights and beauty of our hotair balloon festival with the amazing Colorado sunrise as a backdrop', 'Enjoy the sites and sounds of the Colorado west at sunrise, stay for other famaily fun activities', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Join use each morning from 6:30-10 am');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (6, 2, 'Whittle the Woods Rendevous', 'Exciting head-to-head competition of experienced woodcarvers', 'Four days of wooden masterpieces by dozens of artists', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Watch the exciting carving competition, stay for the 5k race, car show, and live music');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (7, 3, 'Bufflalo Bill Days', 'Celebrat the rich history including the life of Buffalo Bill', 'Hosted in Golden, Buffalo Bill days is great fun for the whole family, celebrating the history of the Wild West and the contribution to early entertainment.', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Starts on Thursday with a golf tournament, main activities run Saturday-Sunday including the Wild West Show, parade, Muttin bustin and classic car show');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (8, 3, 'Colorado Classic', 'Third stage of the Colorado Classic professional cycle race', 'Enjoy the excitement and energy as you cheer on the professional cyclists as they blaze through Golden on stage three of the multi-day four stage race. New for 2019, the Colorado Classic race is all female riders.', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Expo begins at 10:00, race starts at 11:30. An increadible price for all \"FREE\"');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (9, 3, '14th Annual Golden Gallup', 'Biggest annual race of Golden both 5k and 10k loops', 'All ages and athletic abilities are welcome. The Golden Gallup is a fundraiser for Golden School Foundation', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Cost $15-30');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (10, 4, 'Pikes Peak Region121st Annual Greek Festival', 'Great mediterrean food and some culture', 'Everyone really comes for the food', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Noon - 7:00');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (11, 4, '13th Annual Springs Beer Fest', 'Held at America the Beautiful Park', 'Bring the family. All who sample the beers will be carded. Reserve a ride ahead of time', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'FREE admission (food & drinks cost extra)');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (12, 4, 'Colorado Springs Labor Day Lift Off', 'Take in the sunrise fresh air with some great views at the base of Cheyenne Mountain', 'Now you know why America the Beautiful was written after Samuel A. Ward\'s visit in 1883', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Memorial park sunrise');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (13, 5, 'Boulder Craft Beer Festival', 'Yup another beer fest', 'Coloradans realy like their craft brews', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'North Boulder Park');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (14, 5, 'Boulder Taco Festival', 'What? A festival of food?', 'Should be the same day as the craft beer fest', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Some park');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (15, 5, 'Pearl Street Arts Festival', 'Great local art', 'Nice to help out the \"starving artists\"', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Other park');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (16, 6, 'Aspen Music Festival', 'Enjoy a variety of music compositions and themes in one of the country\'s most beautiful venues.', 'The 70th anniversary season provides a premier selection of international musical groups playing various classical musical selections', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'Concert times and prices vary. See http://www.aspenmusicfestival.com for details');
INSERT INTO `event` (`id`, `destination_id`, `name`, `short_description`, `long_description`, `start_date`, `end_date`, `event_details`) VALUES (17, 6, 'Jazz Aspen Snowmass', 'A popular collection of local and national jazz musicians gather for 3 days of jazz enjoyment', 'See https://www.songkick.com/festivals/62726-jazz-aspen-snowmass/id/37199234-jazz-aspen-snowmass-2019 for additional ticket and venue details', '2015-07-11 11:00:00', '2015-09-11 11:00:00', 'See ticket retailer for additional details');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (1, '4x4 & Jeep Tours', 'Jeep, jeeps, and more jeeps', 'Don\'t worry about bashing up you 4x4, let us do the driving.', 'https://coloradojeeptours.com/wp-content/uploads/chelsy-red-canyon-group.jpeg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (2, 'Adventure Tours', 'No seriously, let us do the driving while you take in the scenery.', 'Lots to see and more', 'https://captainzipline.com/wp-content/uploads/colorado-zipline-tour-2.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (3, 'ATV', 'Be sure to wear a helmet', 'Stay on designated trails', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/CO_PhotoProject2007_0515_0.jpg?itok=WZNlrfiO');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (4, 'Dog Sledding', 'The dogs do the leg work', 'Dress warmly', 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Dogsled3_Edwards_MI_3.jpg?itok=NpUTALq8');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (5, 'Guest/Dude Ranches', 'Watch where you step', 'If you desire to leave your clean, air conditioned, comfy home to come play on the ranch and get a little dirty, we welcome you.', 'https://duderanch.s3.amazonaws.com/2017/03/31/5038.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (6, 'Hang/Paragliding', 'Who needs a plane to fly', 'Ride the wind', 'https://www.uncovercolorado.com/wp-content/uploads/2014/04/Colorado-Paragliding01-1000x500-650x325.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (7, 'Hunting', 'Don\'t settle for store bought meats...', 'We have organic wildlife to hunt (with appropriate license)', 'http://kifaru.net/wp-content/uploads/2018/04/Alex_Nestor.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (8, 'Kayaking', 'Enjoy some time on the water', 'We offer both exciting white water and relaxing flat water kayaking', 'https://kayaksreviewed.com/wp-content/uploads/2018/06/img_8202-1024x683.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (9, 'Motorcycle Touring', 'Join the group with a few or many riders', 'Select the distance and group size you would like to ride with. Safety in numbers', 'https://www.advpulse.com/wp-content/uploads/2016/07/Rawhyde-High-Rockies-Adventure-2.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (10, 'Mountain Biking', 'Trails for all ability levels', 'Smooth and flat, slightly hilly, intense climb/descend and everything in between', 'https://cdn.allsteamboat.com/images/content/5552_14368_Steamboat_Springs_Colorado_Mountain_Biking_lg.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (11, 'Mountaineering', 'Conquere the high peaks', 'Looking for more than just another hike, try mountaineering', 'https://backcountrymagazine.com/wp-content/uploads/2017/06/14er_josh_embed_1.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (12, 'Rafting', 'Float the smooth water', 'Tame the rapids', 'https://www.breckenridgewhitewater.com/wp-content/uploads/2013/09/gore-06-8.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (13, 'Rock Climbing', 'Scale a rock wall', 'Sure it is pure stone, don\'t let that stop you', 'https://cdn-files.apstatic.com/climb/107138402_medium_1494168815.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (14, 'Sky Diving', 'So you want to jump out of a perfectly good plane', 'Ok, we will let you use a parachute', 'https://arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/7LXPZ7ZSIUEV3Z6AGHVQPRXTZY.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (15, 'Snowmobiling', 'Like a motorcycle on snow', 'Speed is needed', 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Snowmobiling2_Vail_MI.jpg?itok=vzoORcz2');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (16, 'Tour/Road Biking', 'Why take a car...', '...you can pedal your way there', 'https://2.bp.blogspot.com/-95Uiku-3iEs/VsZ9rz2MXoI/AAAAAAAC9ZI/CKjXWHzn6Cw/s1600/Thump%2BRace%2BTeam%2Brides%2Bnear%2BLake%2BDillon%2BColorado.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (17, 'Ziplining & Aerial Parks', 'Like being a kid...no matter your age', 'Smooth gliding by wire', 'https://www.denverpost.com/wp-content/uploads/2016/05/20120813__20120814_C1_FE14OWCOV_1p2.jpg?w=600');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (18, 'Backpacking', 'All you can carry on your back', 'Keep that in mind...don\'t take your whole closet', 'https://coloradowildernessridesandguides.com/wp-content/uploads/2018/12/20180919_084609.jpeg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (19, 'Camping', 'Who need four walls and a roof', 'Under the stars, canopy, or tent', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/TroutLakeCamping_DC2.jpg?itok=2UO32aZ_');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (20, 'Canoeing', 'Might be a little tipsy', 'Give your arms a workout', 'https://2.bp.blogspot.com/-qWGRN0PYzMA/V3bAbxMwaYI/AAAAAAAAB3U/kLZus1M2nLcXhjs49pMLrjrnGP3IzjLJgCKgB/s1600/13411851_10153862276073547_8840792291443099981_o.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (21, 'Fishing', 'Fresh fish for dinner', 'Hope you are good...or you may go hungry', 'https://www.denverpost.com/wp-content/uploads/2016/07/fishing-arkansas-river.jpg?w=527');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (22, 'Golf', 'Batters up...wait that\'s not right', 'Swing the club and hit a little ball...can\'t be too hard', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/wintergolf.jpg?itok=_hTTZyKT');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (23, 'Hiking/Walking', 'Hiking is just waling on an undefined sidewalk', 'Wear propper shoes', 'http://www.cannaventure.org/wp-content/uploads/2017/10/royal-arch-trail-boulder-colorado-cannaventure-september-2017-10-1024x683.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (24, 'Horseback Riding', 'Worked for the pioneers', 'Still works today', 'https://media-cdn.tripadvisor.com/media/photo-s/03/d4/3a/e8/stables-at-the-broadmoor.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (25, 'Jet Skiing', 'Your personal jet boat', 'Remember no brakes!', 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Jetski1_FortMorgan_MI.jpg?itok=lMwsLrjV');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (26, 'RV Sites', 'Yes you can cook on the road just like at home...microwave', 'You don\'t have to sleep on the ground with a rock perfectly positioned in the middle of you back all night', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWNlKbswxeHCmiQYlirBYc7JBhfrnNtbUPGRFsEZ1lmtZVM1j0');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (27, 'Kayaking', 'More stable than you think...', 'and more efficient than a canoe', 'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/70/2b/6e.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (28, 'Water Skiing', 'Put sticks on you feet, hold on to the rope, try to stay on top of the water', 'You will experience what \"eat water\" means', 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Waterskiing2_ChatfieldRes_MI.jpg?itok=yTMlC9Qb');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (29, 'Ice Skating', 'How strong are you ankles?', 'And by the way, ice is hard when you crash', 'https://www.mountainliving.com/LakesideVillage_Keystone_Lake_key9400_jack_affleck.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (30, 'Skiing & Snowboarding', 'Much more enjoyable than shoveling', 'But you may still tweek your back', 'https://www.christielodge.com/resourcefiles/attractionsmallimages/colorado-skiing-snowboarding-th.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (31, 'Sleigh Rides', 'Can carry a little more than dog sled...', 'Kinda slow, but emissions free travel', 'http://coloradosleighrides.com/site/wp-content/uploads/2014/09/winter-sleigh-rides.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (32, 'Snowshoeing', 'Just in case you can\'t wait until the snow melts to go hiking', 'Not nearly as painful when you crash as skiing', 'https://i0.wp.com/www.denverpost.com/wp-content/uploads/2016/04/20141224__20141228_E9_TR28HUTHOLIDAYp2.jpg?w=620&crop=0%2C0px%2C100%2C9999px');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (33, 'Boat Tours', 'Let us run aground', 'Hopefully we have enough water this year.', 'http://canyonlandsbynight.com/wp-content/uploads/2015/09/sound-light-show-tour.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (34, 'Eco Tours', 'May include people power...', '...or animal power when traveling', 'http://www.ecotourmachupicchu.com/assets/img/ecotour-logo.png');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (35, 'Scenic Drives', 'Look at all the stuff!', 'Keep you eye on the road', 'https://www.theroamingboomers.com/wp-content/uploads/2012/09/Road-to-Ouray-Colorado.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (36, 'River Rafting & Tubing', 'That\'s not a river...', 'Have you ever seen the Mississippi?', 'https://whitewatertours.com/wp-content/uploads/2016/12/Raft-Blasting-thru-Class-3-Whitewater-on-the-South-Fork-American-River.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (37, 'Canyoning & Rapelling Tours', 'Can sure get back down much quicker', 'Don\'t forget the ropes', 'https://c8.alamy.com/comp/CTJFKB/repelling-down-a-cliff-CTJFKB.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (38, 'Horseback Riding Tours', 'The original All Turain Vehicle', 'You are kinda high off the ground, hold on.', 'http://bozeman-horseback-riding.com/wp-content/uploads/2012/04/Day-Riders-Spanish-Peaks.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (39, 'Day Trips', 'Not night', 'Once you realize a day trip is too short, book another trip', 'https://static.wixstatic.com/media/f6ee89_a87d17bc312c4aaf9e4af7290089eb0e~mv2.png');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (40, 'Train', 'Does anyone still travel that way', 'Keep on the tracks', 'https://www.colorado.com/sites/default/files/styles/640x480/public/zzdata-35555_718x480.jpg?itok=rkR-qywe');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (41, 'Rodeo', 'Why ride a bike or atv...?', 'When you can ride an angry horse...or even better, a BULL! sound great!', 'https://d38trduahtodj3.cloudfront.net/images.ashx?t=ig&rid=StPaulRodeo&i=sb_tyler_corrington_87_on_korkow_rodeos_paint_chip_resized(2).jpg&w=330&h=330&cropbox=1&cropboxhpos=center&stf=1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `journal_entry`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (1, 2, 1, 1, 'Trip to Estes Park', 'Tell me about your fake trip', '2019-07-01 11:00:00', 1, 1, 1);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (2, 2, 1, 1, 'Trip to Dinosaur', 'Tell me about your fake trip', '2019-07-01 11:00:00', 2, 2, 2);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (3, 2, 1, 1, 'Trip to Golden', 'Tell me about your fake trip', '2019-07-01 11:00:00', 3, 3, 3);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (4, 4, 1, 1, 'Trip to Colorado Springs', 'Tell me about your fake trip', '2019-07-01 11:00:00', 4, 4, 4);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (5, 4, 1, 1, 'Trip to Boulder', 'Tell me about your fake trip', '2019-07-01 11:00:00', 5, 5, 5);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (6, 3, 1, 1, 'Trip to Aspen', 'Tell me about your fake trip', '2019-07-01 11:00:00', 6, 6, 6);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (7, 3, 1, 1, 'Trip to Durango', 'Tell me about your fake trip', '2019-07-01 11:00:00', 7, 7, 7);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (8, 3, 1, 1, 'Trip to Gunnison', 'Tell me about your fake trip', '2019-07-01 11:00:00', 8, 8, 8);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (9, 1, 0, 1, 'Trip to Grand Junction', 'Dear diary, I had an excellent time mountain biking in Grand Junction and learning about trains.  All aboard!  #conductor', '2019-07-01 11:00:00', 9, 9, 9);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (10, 1, 1, 1, 'Trip to Telluride', 'Tell me about your fake trip', '2019-07-01 11:00:00', 10, 10, 10);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (11, 1, 1, 1, 'Trip to Denver', 'Tell me about your fake trip', '2019-07-01 11:00:00', 11, 11, 11);
INSERT INTO `journal_entry` (`id`, `user_id`, `is_public`, `is_complete`, `title`, `entry_text`, `create_date`, `destination_id`, `event_id`, `activitity_id`) VALUES (12, 4, 1, 1, 'Trip to Glenwood Springs', 'Tell me about your fake trip', '2019-07-01 11:00:00', 12, 12, 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (1, 'Lodging', 'Please, come stay and enjoy your visit', 'Colorado hotels and lodging range from five-star luxury hotels to rustic cabins. Whether it’s a city hotel, mountain resort, historic B&B or alpine lodge, Colorado accommodations provide amazing views, values and a variety of places to stay. Choose between the largest international hotel chains to small inns. And, you’ll find plenty of great dining options and activities no matter where you stay in Colorado.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlsPQxYDhJxgl3MNFMocEEmPwMmcG5llr5rmUCGB1yb2_YPSy4jQ');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (2, 'Restaurants', 'The best roadkill in the west', 'Colorado restaurants range from fine dining experience to fastfood chains or food truchs. Featuring a variety of cuizines from around the word.  And, you’ll find plenty of great dining options at any price point.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPNlHRqt4UQW8vf7HBDXq5YTk-GP6SeuIwcR7zHEol6WYy31TlKg');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (3, 'Gas Stations', 'Refuel and go', 'Connoco, Texaco, Ammaco, BP, Shell, gasoline and deisel available', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (4, 'Pets Allowed', 'Dog friendly', 'Dogs welcome in all outdoor areas on a leash at our descretion (owners required to clean up after their dogs)', 'http://www.awdt.net/uploads/3/1/4/6/31462531/4470109_orig.jpg');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (5, 'Family Friendly', 'Bring the rug rats', 'Play area available for children, stroller accessable', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (6, 'Accessible', 'Wheelchair accessible', 'ADA parking, wheelchair ramps, easy access concrete path', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (7, 'Indoor parking', 'Indoor parking limited (arrive early)', 'Shaded, not climate controlled', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (8, 'Free wifi', 'WIFI details on flyer', 'WIFI may be slow due to minimal band width', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (9, 'Bicycle friendly', 'Two wheeler always welcome', 'Bike storage available, bring your own lock, not responsible for damaged or stolen bikes', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (10, 'Indoor pool', 'Splash around...not too much', 'Enjoy the pool and cool down', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (11, 'Hot tub', 'Relax for a while', 'Let the massage jets soothe your sore muscles', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (12, 'Online Reservations', 'Discounts  may apply', 'Discounts may be seasonal', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (13, 'Alcohol Permitted', 'Permitted on private property', 'No glass bottles', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (14, 'Campsites Available', 'First come first served (limit 7 consecutive days)', 'RV and tent sites', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (15, 'RV Hookup', 'Additional charge above camp fee', 'Electric, water, dump station', '');
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (16, 'Shuttles Available', 'Free shuttle to all events', 'All shuttles ADA accessable', '');

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
-- Data for table `point_of_interest_has_amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (1, 1);
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (1, 2);
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (1, 3);
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (2, 4);
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (2, 5);
INSERT INTO `point_of_interest_has_amenity` (`point_of_interest_id`, `amenity_id`) VALUES (2, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_has_activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (1, 1);
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (1, 2);
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (1, 3);
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (2, 4);
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (2, 5);
INSERT INTO `point_of_interest_has_activity` (`point_of_interest_id`, `activity_id`) VALUES (2, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `point_of_interest_comment` (`id`, `user_id`, `poi_id`, `comment_text`, `rating`, `comment_date`) VALUES (1, 1, 1, 'sometext', 5, NULL);

COMMIT;

