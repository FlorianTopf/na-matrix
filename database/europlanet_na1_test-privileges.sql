SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


/* CREATE USER 'europlanet_na1'@'localhost' IDENTIFIED BY 'europlanet%na1'; */

grant DELETE on TABLE `europlanet_na1_test`.`additional_information` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`additional_information` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`additional_information` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`additional_information` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`agencies` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`agencies` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`agencies` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`agencies` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`antenna_types` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`antenna_types` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`antenna_types` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`antenna_types` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`clearnights_ranges` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`clearnights_ranges` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`clearnights_ranges` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`clearnights_ranges` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`countries` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`countries` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`countries` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`countries` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`hidden_fields` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`hidden_fields` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`hidden_fields` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`hidden_fields` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`instrument_types` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`instrument_types` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`instrument_types` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`instrument_types` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`instruments` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`instruments` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`instruments` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`instruments` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`observatories` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`observatories` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`observatories` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`observatories` to 'europlanet_na1'@'localhost'; 
grant DELETE on TABLE `europlanet_na1_test`.`observatory_to_research_areas` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`observatory_to_research_areas` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`observatory_to_research_areas` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`observatory_to_research_areas` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`observatory_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`observatory_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`observatory_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`observatory_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`observatory_to_telescopes` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`observatory_to_telescopes` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`observatory_to_telescopes` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`observatory_to_telescopes` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`observatory_to_targets` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`observatory_to_targets` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`observatory_to_targets` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`observatory_to_targets` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`precipitation_ranges` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`precipitation_ranges` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`precipitation_ranges` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`precipitation_ranges` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`research_areas` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`research_areas` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`research_areas` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`research_areas` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`science_goals` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`science_goals` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`science_goals` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`science_goals` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`scientific_contacts` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`scientific_contacts` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`scientific_contacts` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`scientific_contacts` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`sensors` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`sensors` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`sensors` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`sensors` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`sensor_to_science_goals` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`sensor_to_science_goals` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`sensor_to_science_goals` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`sensor_to_science_goals` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`sensor_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`sensor_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`sensor_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`sensor_to_scientific_contacts` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`space_mission_to_research_areas` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`space_mission_to_research_areas` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`space_mission_to_research_areas` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`space_mission_to_research_areas` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`space_mission_to_sensors` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`space_mission_to_sensors` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`space_mission_to_sensors` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`space_mission_to_sensors` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`space_mission_to_targets` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`space_mission_to_targets` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`space_mission_to_targets` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`space_mission_to_targets` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`space_missions` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`space_missions` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`space_missions` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`space_missions` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`targets` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`targets` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`targets` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`targets` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`telescope_to_instruments` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`telescope_to_instruments` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`telescope_to_instruments` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`telescope_to_instruments` to 'europlanet_na1'@'localhost'; 
grant DELETE on TABLE `europlanet_na1_test`.`telescope_types` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`telescope_types` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`telescope_types` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`telescope_types` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`telescopes` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`telescopes` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`telescopes` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`telescopes` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`timezones` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`timezones` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`timezones` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`timezones` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`users_list` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`users_list` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`users_list` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`users_list` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`users_statistics` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`users_statistics` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`users_statistics` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`users_statistics` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`wavelength_ranges` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`wavelength_ranges` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`wavelength_ranges` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`wavelength_ranges` to 'europlanet_na1'@'localhost';
grant DELETE on TABLE `europlanet_na1_test`.`wavelength_units` to 'europlanet_na1'@'localhost';
grant INSERT on TABLE `europlanet_na1_test`.`wavelength_units` to 'europlanet_na1'@'localhost';
grant SELECT on TABLE `europlanet_na1_test`.`wavelength_units` to 'europlanet_na1'@'localhost';
grant UPDATE on TABLE `europlanet_na1_test`.`wavelength_units` to 'europlanet_na1'@'localhost'; 

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;