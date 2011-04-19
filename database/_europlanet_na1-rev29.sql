SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`observatory_to_research_areas` DROP FOREIGN KEY `research_area_id_1` ;

ALTER TABLE `europlanet_na1`.`observatory_to_scientific_contacts` DROP FOREIGN KEY `scientific_contact_id_1` ;

ALTER TABLE `europlanet_na1`.`observatory_to_research_areas` 
  ADD CONSTRAINT `research_area_id_1`
  FOREIGN KEY (`research_area_id` )
  REFERENCES `europlanet_na1`.`research_areas` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `research_area_id_1` (`research_area_id` ASC) 
, DROP INDEX `research_area_id_1` ;

ALTER TABLE `europlanet_na1`.`observatory_to_scientific_contacts` 
  ADD CONSTRAINT `scientific_contact_id_1`
  FOREIGN KEY (`scientific_contact_id` )
  REFERENCES `europlanet_na1`.`scientific_contacts` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, ADD INDEX `scientific_contact_id_1` (`scientific_contact_id` ASC) 
, DROP INDEX `scientific_contact_id_1` ;

ALTER TABLE `europlanet_na1`.`agencies` ADD COLUMN `acronym` VARCHAR(20) NOT NULL  AFTER `id` , ADD COLUMN `web_address` TEXT NOT NULL  AFTER `name` , CHANGE COLUMN `name` `name` TEXT NOT NULL  ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;