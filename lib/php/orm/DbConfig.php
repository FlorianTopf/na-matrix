<?php

abstract class SystemComponent 
{
	static private $settings;

	static function getSettings()
	{

		// Database variables
		$settings['dbhost'] = 'localhost';
//		$settings['dbusername'] = 'europlanet_na1';
//		$settings['dbpassword'] = 'europlanet%na1';
//		$settings['dbname'] = 'europlanet_na1';
		$settings['dbhost'] = 'localhost';
		$settings['dbusername'] = 'root';
		$settings['dbpassword'] = '';
		$settings['dbname'] = 'europlanet_na1_test';

		return $settings;
	}
}

?>