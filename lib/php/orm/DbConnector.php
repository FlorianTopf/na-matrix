<?php

include_once ('DbConfig.php');

class DbConnector extends SystemComponent 
{
	private $dbms; // the link to the DBMS (DataBase Management System)

	static public $CONFIG_TABLENAME_IS_PLURAL;

	function __construct()
	{
		$settings = parent::getSettings();

		// Get the main settings from the array we just loaded
		$host = $settings['dbhost'];
		$db = $settings['dbname'];
		$user = $settings['dbusername'];
		$pass = $settings['dbpassword'];
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
	
	function query($sql) {
		if ($result = $this->dbms->query($sql)) {
		    if ($result == NULL) echo "encore null !";
		}
		else {
			echo "<br>Mysqli ERROR: ";
			echo $this->dbms->error;
			exit;
		}
		return $result;
	}
	
	function errno()
	{
		return $this->dbms->errno;
	}
	
	function error()
	{
		return $this->dbms->error;
	}
	
	function getLastInsertId() 
	{
		return $this->dbms->insert_id;
	}
	
	//Function: close, Purpose: Close the connection
	function close() 
	{
		$this->dbms->close();
	}
	
}


?>