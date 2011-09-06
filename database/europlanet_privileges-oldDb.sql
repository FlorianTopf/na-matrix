SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE USER 'europla1_europla'@'localhost' IDENTIFIED BY  '3n^ZPyXum*&u';

grant DELETE on TABLE `europla1_obs`.`areasofresearch` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`areasofresearch` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`areasofresearch` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`areasofresearch` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_obs`.`contact` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`contact` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`contact` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`contact` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_obs`.`extrainstruments` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`extrainstruments` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`extrainstruments` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`extrainstruments` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_obs`.`hiddenfields` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`hiddenfields` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`hiddenfields` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`hiddenfields` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_obs`.`instruments` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`instruments` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`instruments` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`instruments` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_obs`.`maintable` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_obs`.`maintable` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_obs`.`maintable` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_obs`.`maintable` to 'europla1_europla'@'localhost';

grant DELETE on TABLE `europla1_spa`.`maintable` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_spa`.`maintable` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_spa`.`maintable` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_spa`.`maintable` to 'europla1_europla'@'localhost';
grant DELETE on TABLE `europla1_spa`.`sensors` to 'europla1_europla'@'localhost';
grant INSERT on TABLE `europla1_spa`.`sensors` to 'europla1_europla'@'localhost';
grant SELECT on TABLE `europla1_spa`.`sensors` to 'europla1_europla'@'localhost';
grant UPDATE on TABLE `europla1_spa`.`sensors` to 'europla1_europla'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
