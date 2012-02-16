<?php
/**
 * @file Acl.php
 * @version $Id$
 * @author Florian Topf
 */

class Acl
{
	static private $_isUserLogged=FALSE; // default = no user logged
	static private $_user=NULL; // default = no user

	
	static private $_aclPages = array(
	'add' => 11,
	'browse' => 0,
	'map' => 0,
	'edit' => 11,
	'home' => 0,
	'login' => 0,
	'logout' => 0,
	'account' => 11,
	'reset' => 0,
	'registration' => 31,
	'registration_q' => 0
	);
	
	/** @todo add acl for actions */
	static private $aclActions = array(
	);

	static private $_profiles = array(
	//Guest - can browse and see details on entries
	'anonymous' => 0,
	//Data Submitter - can submit OBS entries (approved = 0)
	'browsing' => 11,
	//Maintainer - can add, edit, approve (submitted data entries)
	'processing' => 21,
	//God - can add, edit, approve, delete entries and create Maintainer accounts
	'superuser' => 31,
	);

	static function getAclForPages($option)
	{
		if (isset(self::$_aclPages[$option]))
			return self::$_aclPages[$option];
		else
			return -1;
	}

}


?>