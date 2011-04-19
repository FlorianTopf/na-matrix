<?php

include_once ('DbConnector.php');

function __autoload($className) {
   	// If DAO class, remove the ending 'DAO'
   	$classFile = substr($className,-3)=='DAO' ? substr($className,0,-3) : $className;
	// This now works from everywhere
	$classFilePath = $_SERVER['DOCUMENT_ROOT'];
	//echo "cfp = $classFilePath";
	$classFileLongName = 'na1-matrix/models/'.$classFile.'.php';
	//echo "cft = ".$classFilePath.'/'.$classFileLongName;
	if (file_exists($classFilePath.'/'.$classFileLongName))
   		require_once $classFilePath.'/'.$classFileLongName;
   	else 
   	 	throw new Exception("The class named $className does not exist !");
}

abstract class ModelDAO
{
	// common to all ModelDAO instances :
	
	static protected $db = NULL; // Singleton database connection
	
	static protected $_daos; // List of all currently used DAOs
	static private $_currentDaoName=''; // name of the current DAO
	
	private $_modelName; // Model name
	
	protected function __construct()
	{
		$this->_modelName = $this->getModelName(); // ex : 'ModelDAO' --> 'Model'
		
		if (self::$db == NULL)
			self::$db = new DbConnector();
			
		self::set($this);
			
	}
	
	static public function getDB()
	{
		return self::$db;
	}
	
	static private function set(ModelDAO $dao) {
		self::$_daos[get_class($dao)] = $dao;
	}
	
	static public function getFromName($daoName) {
		if (strtoupper(substr($daoName, -3)) != 'DAO') $daoName.='DAO';
		if (!isset(self::$_daos[$daoName])) { 
			// create a new ModelDAO instance (will be UNIQUE and used by all other Models)
			echo "NEW ";
			echo "class = $daoName <br>";
			self::set(new $daoName()); // ATTENTION: not allowed if ModelDAO constructor is private
		}
		return self::$_daos[$daoName];
	}
	
	static public function getCurrent() {
		return self::$_daos[self::$_currentDaoName];
	}
	
	static public function setCurrent($daoName) {
		self::$_currentDaoName = $daoName;
	}
	
	function getModelName() { // ex : for GroupDAO --> model is "Group"
		return substr(get_class($this), 0,-3);
	}
	
}



?>