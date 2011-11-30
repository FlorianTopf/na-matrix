<?php
/**
 * @file DBConnector.php
 * @version $Id$
 * @author Florian Topf
 */

include_once ('DbConfig.php');
include_once ('html.php');

class DbConnector extends SystemComponent
{
	private $dbms = NULL; // the link to the DBMS (DataBase Management System)

	static public $CONFIG_TABLENAME_IS_PLURAL;

	function __construct($dbType)
	{
		$settings = parent::getSettings();
		// Get the main settings from the array we just loaded
		$host = $settings['dbhost' . $dbType];
		$db = $settings['dbname' . $dbType];
		$user = $settings['dbusername' . $dbType];
		$pass = $settings['dbpassword' . $dbType];
		$CONFIG_TABLENAME_IS_PLURAL = $settings['tablename_is_plural'];

		/*
		echo $host;
		echo $db;
		echo $user;
		echo $pass;
		*/

		// Connect to the database

		$this->dbms = new mysqli($host, $user, $pass);
		if (mysqli_connect_errno())
		{
		    printf("Mysql DBMS Connection failed: %s\n", mysqli_connect_error());
		 	exit();
		}

		if ($this->dbms->select_db($db) === FALSE)
		{
			echo "Database $db selection failed";
			exit();
		}
	}

	function checkDb($dbType)
	{
		$settings = parent::getSettings();
		$host = $settings['dbhost' . $dbType];
		$db = $settings['dbname' . $dbType];
		$user = $settings['dbusername' . $dbType];
		$pass = $settings['dbpassword' . $dbType];
		$CONFIG_TABLENAME_IS_PLURAL = $settings['tablename_is_plural'];

		// LOCAL VAR $dbms to check Db connection
		$dbms = new mysqli($host, $user, $pass);

		if (mysqli_connect_errno() || ($dbms->select_db($db) === FALSE))
			return false;
		else
		{
			$dbms->close();
			return true;
		}
	}

	function query($sql) {
		if ($result = $this->dbms->query($sql)) {
		    if ($result == NULL) echo "encore null !";
		}
		else {
			nl();
			echo "Mysqli ERROR: ";
			echo $this->dbms->error;
			exit;
		}
		return $result;
	}

	function getLastInsertId()
	{
		return $this->dbms->insert_id;
	}

	function errno()
	{
		return $this->dbms->errno;
	}

	function error()
	{
		return $this->dbms->error;
	}

	function affectedRows()
	{
		return $this->dbms->affected_rows;
	}

	//Function: getNumRows, Purpose: Return row count
	function getNumRows($result)
	{
		return $result->num_rows;
	}

	//Function: close, Purpose: Close the connection
	function close()
	{
		$this->dbms->close();
	}

}


?>