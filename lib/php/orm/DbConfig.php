<?php
/**
 * @file DbConfig.php
 * @version $Id$
 * @author Florian Topf
 */

abstract class SystemComponent
{
	static private $settings;

	static function getSettings()
	{

		// Database variables
		$settings['dbhost'] = 'localhost';
		$settings['dbusername'] = 'europlanet_na1';
		$settings['dbpassword'] = 'europlanet%na1';
		$settings['dbname'] = 'europlanet_na1';
//		$settings['dbusername'] = 'root';
//		$settings['dbpassword'] = '';
//		$settings['dbname'] = 'europlanet_na1_test';

		//Temporary Questionnaire DB settings:
		$settings['dbhostTemp'] = 'localhost';
		$settings['dbusernameTemp'] = 'europlanet_na1';
		$settings['dbpasswordTemp'] = 'europlanet%na1';
		$settings['dbnameTemp'] = 'europlanet_na1_temp';

		//Old-Obs-NA1 DB settings:
		$settings['dbhostOldObs'] = 'localhost';
		$settings['dbusernameOldObs'] = 'europlanet_na1';
		$settings['dbpasswordOldObs'] = 'europlanet%na1';
		$settings['dbnameOldObs'] = 'europla1_obs';

		//Old-Spa-NA1 DB settings:
		$settings['dbhostOldSpa'] = 'localhost';
		$settings['dbusernameOldSpa'] = 'europlanet_na1';
		$settings['dbpasswordOldSpa'] = 'europlanet%na1';
		$settings['dbnameOldSpa'] = 'europla1_spa';

		$settings['tablename_is_plural'] = true;

		return $settings;
	}
}

?>