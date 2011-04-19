SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`additional_information` 
ADD PRIMARY KEY (`id`) ;

ALTER TABLE `europlanet_na1`.`hidden_fields` 
ADD PRIMARY KEY (`id`) ;

ALTER TABLE `europlanet_na1`.`observatory_to_research_areas` 
ADD PRIMARY KEY (`observatory_id`, `research_area_id`) ;

ALTER TABLE `europlanet_na1`.`observatory_to_scientific_contacts` 
ADD PRIMARY KEY (`observatory_id`, `scientific_contact_id`) ;

ALTER TABLE `europlanet_na1`.`observatory_to_telescopes` 
ADD PRIMARY KEY (`observatory_id`, `telescope_id`) ;

ALTER TABLE `europlanet_na1`.`camera_properties` 
ADD PRIMARY KEY (`id`) ;

ALTER TABLE `europlanet_na1`.`space_mission_to_sensors` 
ADD PRIMARY KEY (`space_mission_id`, `sensor_id`) ;

ALTER TABLE `europlanet_na1`.`space_mission_to_targets` 
ADD PRIMARY KEY (`space_mission_id`, `target_id`) ;

ALTER TABLE `europlanet_na1`.`sensor_to_scientific_contacts` 
ADD PRIMARY KEY (`sensor_id`, `scientific_contact_id`) ;

ALTER TABLE `europlanet_na1`.`space_mission_to_research_areas` 
ADD PRIMARY KEY (`space_mission_id`, `research_area_id`) ;

ALTER TABLE `europlanet_na1`.`observatory_to_targets` 
ADD PRIMARY KEY (`observatory_id`, `target_id`) ;

ALTER TABLE `europlanet_na1`.`sensor_to_science_goals` 
ADD PRIMARY KEY (`sensor_id`, `science_goal_id`) ;

ALTER TABLE `europlanet_na1`.`telescope_to_instruments` 
ADD PRIMARY KEY (`telescope_id`, `instrument_id`) ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
