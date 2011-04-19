SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`instruments` 
  ADD CONSTRAINT `wavelength_unit_id_3`
  FOREIGN KEY (`wavelength_b_unit` )
  REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `wavelength_unit_id_4`
  FOREIGN KEY (`wavelength_e_unit` )
  REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `wavelength_unit_id_3` (`wavelength_b_unit` ASC) 
, ADD INDEX `wavelength_unit_id_4` (`wavelength_e_unit` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
