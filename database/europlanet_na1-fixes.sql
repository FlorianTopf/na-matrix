/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 1312 */
UPDATE  `europlanet_na1`.`sensors` SET  `sensor_type` =  'Wide-angle, multi-channel CCD' WHERE  `sensors`.`id` =775 LIMIT 1 ;

UPDATE  `europlanet_na1`.`sensors` SET  `sensor_name` =  'ERNE - (Energetic and Relativistic Nuclei and Electron Experiment )' WHERE  `sensors`.`id` =936 LIMIT 1 ;

/* SOHO */
DELETE FROM `scientific_contacts`WHERE id IN (1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027);
DELETE FROM `sensors` WHERE id IN (920,921,922,923,924, 925,926,927,928,929,930,931);

/* XMM-Newton delete */ 
/*
DELETE FROM scientific_contacts WHERE id IN (SELECT scientific_contact_id FROM sensor_to_scientific_contacts, space_mission_to_sensors, sensors 
WHERE space_mission_to_sensors.sensor_id = sensors.id AND space_mission_to_sensors.sensor_id = sensor_to_scientific_contacts.sensor_id AND 
space_mission_to_sensors.space_mission_id = 35);

DELETE FROM sensors WHERE id IN (SELECT space_mission_to_sensors.sensor_id FROM space_mission_to_sensors WHERE 
space_mission_to_sensors.sensor_id  = sensors.id AND space_mission_to_sensors.space_mission_id = 35); */

/* Messenger */
/* SELECT `scientific_contact_id` FROM  `sensor_to_scientific_contacts`  WHERE sensor_id IN (1100, 1101, 1102, 1103, 1104, 1105, 1106); */
DELETE FROM `scientific_contacts`WHERE id IN (1190, 1191, 1192, 1193, 1194, 1195, 1196);
DELETE FROM `sensors` WHERE id IN (1100, 1101, 1102, 1103, 1104, 1105, 1106);

/* SELECT `scientific_contact_id` FROM  `sensor_to_scientific_contacts`  WHERE sensor_id IN (1051,1052,1052,1053,1054,1055,1056,1057); */
DELETE FROM `scientific_contacts` WHERE id IN (1140,1141,1142,1143,1144,1145,1146);
DELETE FROM `sensors` WHERE id IN (1051,1052,1052,1053,1054,1055,1056,1057);

/* ACE */
/* SELECT `scientific_contact_id` FROM  `sensor_to_scientific_contacts`  WHERE sensor_id IN (5,6,7,8,9,10,11,12,13); */
DELETE FROM `sensors` WHERE id IN (5,6,7,8,9,10,11,12,1);

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */