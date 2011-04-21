<?php 

class Acl
{
	static private $_isUserLogged=FALSE; // default = no user logged
	static private $_user=NULL; // default = no user
	
	static private $_acl = array(
	'add' => 21,
	'browse' => 0,
	'edit' => 21,
	'home' => 0,
	'login' => 0,
	'logout' => 0,
	'account' => 11,
	'reset' => 0,
	'registration' => 31
	);
	
	static private $_profiles = array(
	'anonymous' => 0,
	'browsing' => 11,
	'processing' => 21,
	'superuser' => 31,
	);
	
	static function getAclForOption($option) 
	{
		if (isset(self::$_acl[$option])) 
			return self::$_acl[$option];
		else
			return -1;
	}
	
}


?>