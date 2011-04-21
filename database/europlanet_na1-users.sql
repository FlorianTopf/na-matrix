SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `europlanet_na1` ;
CREATE SCHEMA IF NOT EXISTS `europlanet_na1` DEFAULT CHARACTER SET latin1 ;
USE `europlanet_na1` ;

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
  PRIMARY KEY (`id`) )
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
  `page` VARCHAR(45) NOT NULL ,
  `epoch` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user` (`user` ASC) ,
  CONSTRAINT `users_statistics_ibfk_1`
    FOREIGN KEY (`user` )
    REFERENCES `europlanet_na1`.`users_list` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1921
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`users_list`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('1', 'anonymous', NULL, NULL, NULL, NULL, NULL, NULL, 'other', '0');
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('2', 'stoeckler', '530e90856e3fa433e5ad31f3359ea47e', 'Mr.', 'Robert', 'Stöckler', 'robert.stoeckler@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', '31');
INSERT INTO `europlanet_na1`.`users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES ('3', 'ftopf', '5e12806b179c04620320b332f205a80c', 'Mr.', 'Florian', 'Topf', 'florian.topf@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', '31');

COMMIT;
