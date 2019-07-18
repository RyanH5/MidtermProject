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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (1, 'ryanh5', ' \"password2.0\"', ' \"ryan\"', ' \"harr\"', ' \"harr@gmail.com\"', ' 2015-07-11 11:00:00', ' \"myimage.jpg\"', 'notAdmin',  0);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (2, 'craigh', ' \"passwo3.0\"', ' \"craig\"', ' \"smith\"', ' \"smith@gmail.com\"', ' 2015-07-11 11:00:00', ' \"craigsimagage.jpg\"', 'admin',  1);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (3, 'chana', ' \"password7.0\"', ' \"chana\"', ' \"lName\"', ' \"chana@gmail.com\"', ' 2015-07-11 11:00:00', ' \"chanaimage.jpg\"', 'notAdmin', 0);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `create_date`, `image_url`, `role`, `active`) VALUES (4, 'cecilK', 'pw1', 'Cecil', 'Last', 'cecil@gmail.com', ' 2015-07-11 11:00:00', 'cecilimage.jpg', 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `trippingdb`;
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (1, 'Estes Park', 'Estes Park lies at the entrence to Colorado\'s jewl, Rocky Mountain National Park. At an elevation of 7522\', Estes Park offers fantastic scenery and wildlife, as well as great shops, restaurants, and prime lodging.', 'https://i.pinimg.com/originals/bd/2d/1a/bd2d1a7d8983b3ee48a3fbace93b1039.jpg', 'Estes Park is a great place to escape the hustle and bustle of Denver and the summertime heat at lower elevation.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (2, 'Dinosaur', 'Located in the northwest corner of Colorado, is the town of Dinosaur. Origonaly named Baxter Springs, then Artesia, and renamed again in 1966, Dinosaur.', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/CONM_DinosaurDiamond.jpg?itok=pmSFMQen', 'Dinoaur offers great ancient history with easy access to Dinosaur National Monument with a touch of modern amenities.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (3, 'Golden', 'Golden is rich with history and activities for the whole family at an elevation of 5675\'. Golden was in the battle during the gold rush days, as a prime location for Colorado\'s state capital only to loose out to Denver. Golden is located at the base of the foothills and is home to Colorado\'s origonal brewery, Coors.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BFc6vJXsxBE-4qtIlq-aYcHZsiP8vqgBuwcGEDXZV7EAIdrFHg', 'Golden is situated at the mouth of Clear Creek and GoldenGate Canyons both offering access ino the higher elevation rocky mountains and only a short drive into Denver.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (4, 'Colorado Springs', 'Colorado Springs, at an elevation of 6,035 ft., is a city in Colorado at the eastern foot of the Rocky Mountains. It lies near glacier-carved Pikes Peak, a landmark in Pike National Forest with hiking trails and a cog railway leading to its 14,114-ft. summit. The city\'s Garden of the Gods park features iconic red-sandstone formations and mountain views.', 'https://lh4.googleusercontent.com/proxy/LWs8J1-A6iZvYtqZ9t3P8Ui2hW13B1KH0I4ZHt498R_0cftEZSR75Pc6jNckFhXXtkA257sph7dFZyzFPWfpWH2F3XbHXXekSU5H-1sD320O2GQub4x1BFDuCo7PeIZu0s5nXPMheXlQl5zqxYB0Eua6IrM=w357-h238-k-no', '');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (5, 'Boulder', 'Boulder is a city at the foothills of the Rocky Mountains, in northern Colorado. To the west, the trail-lined Flatirons are craggy rock formations overlooking the city. Downtown’s pedestrian Pearl Street Mall includes art galleries, cafes, restaurants and boutiques. The University of Colorado Boulder campus is home to the Fiske Planetarium and the Museum of Natural History, with zoology and anthropology exhibits. Vendors sell produce, flowers and prepared food at the Boulder County Farmers Markets. Outside Central Park, the Boulder Museum of Contemporary Art hosts rotating exhibits. Chautauqua Park is a grassy meadow at the foot of mountain hiking trails. Southwest of the city, Flagstaff Mountain includes the Flagstaff Nature Center and Sunrise Amphitheater, plus trails. Farther south, towering sandstone cliffs frame South Boulder Creek at Eldorado Canyon State Park.', 'https://lh6.googleusercontent.com/proxy/rsmMewRljY-3dW1h5cncG5PhX3BBAdMm-YmodhK1eKlWmWD_JRry7khUx4pVXrE12vkLdyNeF4EEKo08zVxW0xfde7K_Kf9nGxt2-1BbyjvpPMvLFnuf3UYXYZoNr7l7FnPROCBGLQeXBv28sWjQ92c2hDA=w357-h238-k-no', '');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (6, 'Aspen', 'While Aspen, Colorado is known as a travel destination frequented by the rich and famous, Aspen visitors and locals know this beautiful Colorado mountain town for its four ski resorts—Aspen Mountain, Snowmass Mountain, Aspen Highlands Mountain, and Buttermilk Mountain--as well as its variety of outdoor activities, arts programs, cultural events, and cosmopolitan nightlife. Aspen offers restaurants, shopping, lodging, and nightlife that cater to a range of budgets and experiences. Aspen also emphasizes preserving the environment, celebrating its silver mining heritage, and promoting the arts, culture, and local non-profits.', 'https://images.prod.meredith.com/product/2a09da9588ffe3362f4482f3bb48e509/1553872773850/l/maroon-bells-aspen-colorado-canvas-print-small-by-charitybarkley', 'Aspen is located in the Rocky Mountains at an elevation of 7,815 feet and encompasses 1.99 square miles. It is the 50th largest city in Colorado and is approximately 200 miles southwest of Denver. Aspen is located at the southern end of the lush Roaring Fork Valley, along with the neighboring cities of Glenwood Springs, Carbondale, El Jebel, and Basalt.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (7, 'Durango', 'Situated in Southwest Colorado, Durango is one of the state’s best-kept secrets. Surrounded by diverse and dramatic landscapes, from the Animas River Valley’s sandstone bluffs to the San Juan Mountains’ jagged peaks, Durango offers unparalleled access to the great outdoors, authentic Western heritage and culture, and a historic, walkable downtown full of hip shops, unique eateries and a dynamic art scene. Discover why the locals say that once you’ve been to Durango, you’ll never truly leave it behind.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTzRPOHozA4ER-72scO7z71FQcPfQVzfefSUZ5ZDxtWegy-_M', '\"');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (8, 'Gunnison', 'Gunnison is rather like a home on the range surrounded by ski areas, a national recreation area, national park, lakes, rivers and mesas and high-mountain sage that looks like it’s right out of a John Wayne Western movie. The city, which feels like a cattleman\'s town, is the kind of place where you don\'t feel like a tourist as much as somebody visiting the folks.', 'https://www.uncovercolorado.com/wp-content/uploads/2015/01/Blue-Mesa-Reservoir-Gunnison-County-Colorado-Op-650x325.jpg', 'It\'s a great base camp for exploring a treasure trove of natural and manmade attractions.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (9, 'Grand Junction', '\"Grand Junction is the largest city on Colorado\'s Western Slope, and serves as a hub for transportation and shipping between Denver and Salt Lake City. The population of the Grand Junction, according to the 2010 Census, is 146,723. The name Grand Junction stems from the junction of the Colorado River (formerly known as the Grand River) and the Gunnison River. The area was first settled by Europeans in the 1880s, but the area\'s history of human civilization stretches back thousands of years including the Ute and Fremont tribes, among others. Remnants of the tribal history includes petroglyphs and cave paintings, among other items. In the late 19th century, settlers were drawn to the fertile Grand Valley for its agricultural potential, and the area remains one of Colorado\'s largest food producers, including peaches, pears, cherries and corn. In the late 1970s and early 1980s the first grape vines were planted, sparking an increase in wine production. Now home to more than 20 wineries, Grand Junction is known as Colorado\'s Wine Country. The warm days and cool nights are exceptional conditions for producing hearty grapes, and red wine varietals in particular flourish in the conditions. \n\nIn addition to food production, the Grand Junction area includes unparalleled natural beauty. The Colorado National Monument is an outdoor-lover\'s paradise, offering trails for hiking and biking, as well as incredible views of red rock canyons and stone monoliths jutting straight up from the ground. The nearby Grand Mesa is a spectacular flat top mountain that plateaus near 10,000 feet. It offers a variety of activities year-round, including skiing in the winter and hiking, fishing and biking in the summer. \"', 'https://www.colorado.com/sites/default/files/styles/1000x685/public/GJ3_CONationalMonument_.jpg?itok=tgOG2x3Y', 'About Grand Junction. Grand Junction is the largest city on Colorado\'s Western Slope, and serves as a hub for transportation and shipping between Denver and Salt Lake City. The population of the Grand Junction, according to the 2010 Census, is 146,723.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (10, 'Telluride', 'Telluride is tucked into a box canyon surrounded by 13,000 and 14,000-foot peaks. The town of Telluride is just eight blocks wide and twelve blocks long. Because of its significant role in the history of the American West, the core area of Telluride was designated a National Historic Landmark District in 1964. This listing is the highest level of historic status available from the United States Secretary of the Interior. These sites are so special that they are eligible for consideration to become national parks. With the town\'s colorful Victorian-era homes, clapboard storefronts, boutiques, art galleries, gourmet restaurants, historic buildings and more, Telluride is a delight to explore. Our citizens are committed to preserving Telluride\'s historically significant architecture, open space, traditional design elements and, most of all, Telluride’s small-town mountain lifestyle.', 'https://www.visittelluride.com/site/assets/files/1363/14277210064b3b122.503x304.jpg', 'To some, Telluride is known for world-class alpine skiing, and to others, summers full of cultural events and endless outdoor activities. But what runs true for everyone isTelluride\'s authentic mountain character, unpretentious attitude and celebration of four seasons of adventure in the Rocky Mountain high country.');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (11, 'Denver', 'Founded in the mid-1800s as a mining hub during the gold rush, Denver has come a long way since its Wild West days. Over time, its residents have evolved from gunslinging gamblers into an easygoing crowd of ambitious, progressive-minded fitness fanatics and nature lovers who are eager to push the envelope on everything from civil rights to drug laws. Nicknamed the Mile High City for its 5,280-foot elevation (although officially reported as 5,279 feet), Denver\'s location at the base of the Rocky Mountains provides a gateway to a slew of outdoor pursuits, although it is probably best known for its devout ski and snowboard enthusiasts.', 'https://www.langan.com/wp-content/uploads/2017/08/Denver.jpg', 'Denver, located at the junction of the South Platte River and Cherry Creek, is the state capital and largest city in Colorado. Situated 5672 feet above sea level in the shadows of the Rocky Mountains, Denver is known as the \"Mile High City.\"');
INSERT INTO `destination` (`id`, `name`, `description`, `image_url`, `short_description`) VALUES (12, 'Glenwood Springs', 'Glenwood Springs is a resort city in Colorado known for its hot springs. It sits in the rugged Rocky Mountains, surrounded by the vast White River National Forest. Glenwood Canyon is rich with wildlife and features Hanging Lake, with its striking turquoise waters. Glenwood Caverns are ancient underground caves. Glenwood Caverns Adventure Park has roller coasters and canyon swings overlooking the Colorado River.', 'https://lh5.googleusercontent.com/proxy/P8_SkrMJ1UcetZl4V-FFC4jvwADDXhAqNarLcWdvZOC8XqkbSVORRq_2TlIIlPheifY-UHihwTuXG_9xsmXtFQG24K0HkQYo0jd9kWc4IYA88Yomlbv5DKkYhvpBnBRf3T0w-irmIo4qVmFLnUkudaftWN8=w318-h238-k-no', 'Known for it\'s soothing hotsprings surrounded by national forest in the heart of the Rocky Mountains');

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
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (1, '4x4 & Jeep Tours', NULL, NULL, 'https://coloradojeeptours.com/wp-content/uploads/chelsy-red-canyon-group.jpeg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (2, 'Adventure Tours', NULL, NULL, 'https://captainzipline.com/wp-content/uploads/colorado-zipline-tour-2.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (3, 'ATV', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/1000x685/public/CO_PhotoProject2007_0515_0.jpg?itok=WZNlrfiO');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (4, 'Dog Sledding', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Dogsled3_Edwards_MI_3.jpg?itok=NpUTALq8');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (5, 'Guest/Dude Ranches', NULL, NULL, 'https://duderanch.s3.amazonaws.com/2017/03/31/5038.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (6, 'Hang/Paragliding', NULL, NULL, 'https://www.uncovercolorado.com/wp-content/uploads/2014/04/Colorado-Paragliding01-1000x500-650x325.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (7, 'Hunting', NULL, NULL, 'http://kifaru.net/wp-content/uploads/2018/04/Alex_Nestor.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (8, 'Kayaking', NULL, NULL, 'https://kayaksreviewed.com/wp-content/uploads/2018/06/img_8202-1024x683.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (9, 'Motorcycle Touring', NULL, NULL, 'https://www.advpulse.com/wp-content/uploads/2016/07/Rawhyde-High-Rockies-Adventure-2.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (10, 'Mountain Biking', NULL, NULL, 'https://cdn.allsteamboat.com/images/content/5552_14368_Steamboat_Springs_Colorado_Mountain_Biking_lg.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (11, 'Mountaineering', NULL, NULL, 'https://backcountrymagazine.com/wp-content/uploads/2017/06/14er_josh_embed_1.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (12, 'Rafting', NULL, NULL, 'https://www.breckenridgewhitewater.com/wp-content/uploads/2013/09/gore-06-8.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (13, 'Rock Climbing', NULL, NULL, 'https://cdn-files.apstatic.com/climb/107138402_medium_1494168815.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (14, 'Sky Diving', NULL, NULL, 'https://arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/7LXPZ7ZSIUEV3Z6AGHVQPRXTZY.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (15, 'Snowmobiling', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Snowmobiling2_Vail_MI.jpg?itok=vzoORcz2');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (16, 'Tour/Road Biking', NULL, NULL, 'https://2.bp.blogspot.com/-95Uiku-3iEs/VsZ9rz2MXoI/AAAAAAAC9ZI/CKjXWHzn6Cw/s1600/Thump%2BRace%2BTeam%2Brides%2Bnear%2BLake%2BDillon%2BColorado.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (17, 'Ziplining & Aerial Parks', NULL, NULL, 'data:image/jpeg;base64,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');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (18, 'Backpacking', NULL, NULL, 'https://coloradowildernessridesandguides.com/wp-content/uploads/2018/12/20180919_084609.jpeg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (19, 'Camping', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/1000x685/public/TroutLakeCamping_DC2.jpg?itok=2UO32aZ_');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (20, 'Canoeing', NULL, NULL, 'https://2.bp.blogspot.com/-qWGRN0PYzMA/V3bAbxMwaYI/AAAAAAAAB3U/kLZus1M2nLcXhjs49pMLrjrnGP3IzjLJgCKgB/s1600/13411851_10153862276073547_8840792291443099981_o.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (21, 'Fishing', NULL, NULL, 'https://www.denverpost.com/wp-content/uploads/2016/07/fishing-arkansas-river.jpg?w=527');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (22, 'Golf', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/1000x685/public/wintergolf.jpg?itok=_hTTZyKT');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (23, 'Hiking/Walking', NULL, NULL, 'http://www.cannaventure.org/wp-content/uploads/2017/10/royal-arch-trail-boulder-colorado-cannaventure-september-2017-10-1024x683.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (24, 'Horseback Riding', NULL, NULL, 'https://media-cdn.tripadvisor.com/media/photo-s/03/d4/3a/e8/stables-at-the-broadmoor.jpg');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (25, 'Jet Skiing', NULL, NULL, 'https://www.colorado.com/sites/default/files/styles/media-player-large/public/Jetski1_FortMorgan_MI.jpg?itok=lMwsLrjV');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (26, 'RV Sites', NULL, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWNlKbswxeHCmiQYlirBYc7JBhfrnNtbUPGRFsEZ1lmtZVM1j0');
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (27, 'Kayaking', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (28, 'Water Skiing', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (29, 'Ice Skating', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (30, 'Skiing & Snowboarding', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (31, 'Sleight Rides', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (32, 'Snowshoeing', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (33, 'Boat Tours', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (34, 'Eco Tours', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (35, 'Scenic Drives', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (36, 'River Rafting & Tubing', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (37, 'Canyoning & Rapelling Tours', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (38, 'Horseback Riding Tours', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (39, 'Day Trips', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (40, 'Train', NULL, NULL, NULL);
INSERT INTO `activity` (`id`, `name`, `short_description`, `long_description`, `image_url`) VALUES (41, 'Rodeo', NULL, NULL, NULL);

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
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (3, 'wifi', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (4, 'drinking water', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (5, 'child care', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (6, 'swimming pool', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (7, 'showers', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (8, 'kitchen', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (9, 'non smoking', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (10, 'rv hookup', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (11, 'bar', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (12, 'electric car charger', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (13, 'eco friendly', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (14, 'cable tv', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (15, 'shopping', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (16, 'scenic overlook', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (17, 'live music', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (18, 'museum', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (19, 'casino', NULL, NULL, NULL);
INSERT INTO `amenity` (`id`, `name`, `short_description`, `long_description`, `icon_url`) VALUES (20, 'oversized parking', NULL, NULL, NULL);

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

