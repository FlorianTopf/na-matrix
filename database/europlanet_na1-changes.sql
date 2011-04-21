SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


/** ALTER SCRIPTS FOR REVISION 336 */

TRUNCATE TABLE `users_statistics`;

ALTER TABLE `europlanet_na1`.`users_list` DROP FOREIGN KEY `users_list_ibfk_1` ;

ALTER TABLE `europlanet_na1`.`users_statistics` DROP FOREIGN KEY `users_statistics_ibfk_2` ;

ALTER TABLE `europlanet_na1`.`users_list` 
DROP INDEX `level` ;

ALTER TABLE `europlanet_na1`.`users_statistics` CHANGE COLUMN `page` `page` VARCHAR(45) NOT NULL  
, DROP INDEX `page` ;

DROP TABLE IF EXISTS `europlanet_na1`.`pages_list` ;

DROP TABLE IF EXISTS `europlanet_na1`.`users_levels` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;