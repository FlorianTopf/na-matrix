SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `europlanet_na1` DEFAULT CHARACTER SET latin1 ;
USE `europlanet_na1` ;

-- -----------------------------------------------------
-- Table `europlanet_na1`.`users_levels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`users_levels` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`users_levels` (
  `level` INT(10) UNSIGNED NOT NULL ,
  `category` TEXT NOT NULL ,
  `description` TEXT NOT NULL ,
  PRIMARY KEY (`level`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`pages_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`pages_list` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`pages_list` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  `level` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `level` (`level` ASC) ,
  CONSTRAINT `pages_list_ibfk_1`
    FOREIGN KEY (`level` )
    REFERENCES `europlanet_na1`.`users_levels` (`level` ))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`users_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`users_list` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`users_list` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` TEXT NOT NULL ,
  `passwd` TEXT NULL ,
  `title` TEXT NULL ,
  `fname` TEXT NULL ,
  `lname` TEXT NULL ,
  `email` TEXT NULL ,
  `affiliation` TEXT NULL ,
  `category` TEXT NOT NULL ,
  `level` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `level` (`level` ASC) ,
  CONSTRAINT `users_list_ibfk_1`
    FOREIGN KEY (`level` )
    REFERENCES `europlanet_na1`.`users_levels` (`level` ))
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`users_statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`users_statistics` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`users_statistics` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user` INT(10) UNSIGNED NOT NULL ,
  `page` INT(10) UNSIGNED NOT NULL ,
  `epoch` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user` (`user` ASC) ,
  INDEX `page` (`page` ASC) ,
  CONSTRAINT `users_statistics_ibfk_1`
    FOREIGN KEY (`user` )
    REFERENCES `europlanet_na1`.`users_list` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `users_statistics_ibfk_2`
    FOREIGN KEY (`page` )
    REFERENCES `europlanet_na1`.`pages_list` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1921
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`users_levels`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`users_levels` (`level`, `category`, `description`) VALUES ('0', 'anonymous', 'access without login');
INSERT INTO `europlanet_na1`.`users_levels` (`level`, `category`, `description`) VALUES ('11', 'browsing', 'read-only access for registered users');
INSERT INTO `europlanet_na1`.`users_levels` (`level`, `category`, `description`) VALUES ('21', 'processing', 'data processing for selected users');
INSERT INTO `europlanet_na1`.`users_levels` (`level`, `category`, `description`) VALUES ('31', 'super user', 'full access');

COMMIT;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`pages_list`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('1', 'add.php', 'add new catalogue entries', '21');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('2', 'browse.php', 'browse catalogue', '0');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('3', 'edit.php', 'edit catalogue entries', '21');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('4', 'home.php', NULL, '0');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('5', 'login.php', NULL, '0');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('6', 'logout.php', NULL, '0');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('7', 'account.php', 'change account details', '11');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('8', 'reset.php', 'resets a user password', '0');
INSERT INTO `europlanet_na1`.`pages_list` (`id`, `name`, `description`, `level`) VALUES ('9', 'registration.php', 'registers a new user', '31');

COMMIT;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`users_list`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('1', 'anonymous', NULL, NULL, NULL, NULL, NULL, NULL, 'other', '0');
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('2', 'stoeckler', '530e90856e3fa433e5ad31f3359ea47e', 'Mr.', 'Robert', 'Stöckler', 'robert.stoeckler@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', '31');
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('3', 'ftopf', '5e12806b179c04620320b332f205a80c', 'Mr.', 'Florian', 'Topf', 'florian.topf@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', '31');

COMMIT;
