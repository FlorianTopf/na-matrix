<?php
/**
 * @file ModelDAO.php
 * @version $Id$
 * @author Florian Topf
 */

include_once ('DbConnector.php');

function __autoload($className) {
   	// If DAO class, remove the ending 'DAO'
   	$classFile = substr($className,-3)=='DAO' ? substr($className,0,-3) : $className;
	// This now works from everywhere
	//$classFilePath = $_SERVER['DOCUMENT_ROOT'];
	$classFilePath = DOC_ROOT;
	//echo "cfp = $classFilePath";
	$classFileLongName = 'models/'.$classFile.'.php';
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
	static protected $dbOldObs = NULL; //Singelton dbOldObs connection
	static protected $dbOldSpa = NULL; //Singelton dbOldSpa connection

	static protected $_daos; // List of all currently used DAOs
	static private $_currentDaoName=''; // name of the current DAO

	private $_modelName; // Model name

	/** Array of column names from the mapped table */
	protected $_fields = array();

	/** Array of all 1-N relations: can be overridden by subclasses */
	protected $_hasMany = array();

//-----------------------------------------------------------------------------------------------------------

	protected function __construct()
	{
		$this->_modelName = $this->getModelName(); // ex : 'ModelDAO' --> 'Model'

		if (self::$db == NULL)
			self::$db = new DbConnector('');

		if ((self::$dbOldObs == NULL) && DbConnector::checkDb('OldObs'))
			self::$dbOldObs = new DbConnector('OldObs');

		if ((self::$dbOldSpa == NULL) && DbConnector::checkDb('OldSpa'))
			self::$dbOldSpa = new DbConnector('OldSpa');

		self::set($this);

	}

//-----------------------------------------------------------------------------------------------------------

	static public function getDB()
	{
		return self::$db;
	}

	static public function getDbOldObs()
	{
		return self::$dbOldObs;
	}

	static public function getDbOldSpa()
	{
		return self::$dbOldSpa;
	}

	//Not needed anymore! Remove when cleaning up DbConnector!
	static public function switchDb()
	{
		$temp = self::$db;
		self::$db = self::$dbTemp;
		self::$dbTemp = $temp;
	}

//-----------------------------------------------------------------------------------------------------------

	static private function set(ModelDAO $dao) {
		self::$_daos[get_class($dao)] = $dao;
	}

//-----------------------------------------------------------------------------------------------------------

	static public function getFromName($daoName) {
		if (strtoupper(substr($daoName, -3)) != 'DAO') $daoName.='DAO';
		if (!isset(self::$_daos[$daoName])) {
			// create a new ModelDAO instance (will be UNIQUE and used by all other Models)
//			echo "NEW ";
//			echo "class = $daoName <br>";
			self::set(new $daoName()); // ATTENTION: not allowed if ModelDAO constructor is private
		}
		return self::$_daos[$daoName];
	}

//-----------------------------------------------------------------------------------------------------------

	static public function getCurrent() {
		return self::$_daos[self::$_currentDaoName];
	}

//-----------------------------------------------------------------------------------------------------------

	static public function setCurrent($daoName) {
		self::$_currentDaoName = $daoName;
	}

//-----------------------------------------------------------------------------------------------------------

	function getModelName() { // ex : for GroupDAO --> model is "Group"
		return substr(get_class($this), 0,-3);
	}

//-----------------------------------------------------------------------------------------------------------
//--- COMMON METHODS
	/** get a field from the mapped table */
	public function get_field($field)
	{
		if(array_key_exists($field, $this->_fields))
			return htmlspecialchars($this->_fields[$field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
 	/** get fieldkeys from 1-N relations (_hasMany) */
 	public function get_has_many($x_field, $y_field=NULL)
	{
		if($y_field == NULL)
			return $this->_hasMany[$x_field];
		else if(isset($this->_hasMany[$x_field][$y_field]))
			return $this->_hasMany[$x_field][$y_field];
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
	/** initialize 1-N relation (_hasMany) if no entry is there */
	public function init_has_many($x_field, $y_field=NULL)
	{
		if($y_field == NULL)
		{
			$this->_hasMany[$x_field] = array();
			array_push($this->_hasMany[$x_field], 0);
		}
		else
		{
			$this->_hasMany[$x_field][$y_field] = array();
			array_push($this->_hasMany[$x_field][$y_field], 0);
		}

		//echo "INIT HAS MANY: " . $x_field . "<br>";
	}

//-----------------------------------------------------------------------------------------------------------
	/** get targets from table
	 * @todo improve this a bit */
	public function get_targets()
	{
		$query = "SELECT id, target_name FROM targets ORDER BY targets.target_name ASC";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_targets[$key][] = $value;
				$this->_targets[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_targets;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get all research_areas from table
	 * @todo improve this a bit
	 * @todo this is a duplicate to get_research_areas, refactoring needed */
	public function get_research_areas()
	{
		$query = "SELECT * FROM research_areas ORDER BY research_areas.name ASC";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      	    foreach ($row as $key => $value)
				$this->_researchAreas[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_researchAreas;
	}	
	
//-----------------------------------------------------------------------------------------------------------
	/** get countries from countries table
	 * @todo improve this a bit */
	public function get_countries()
	{
		$query = "SELECT id, name FROM countries";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
      			//$this->_countries[$key][] = $value;
				$this->_countries[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_countries;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get timezones from table
	 * @todo improve this a bit */
 	public function get_timezones()
	{
		$query = "SELECT * FROM timezones ORDER BY timezone ASC";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_timezones[$key][] = $value;
				$this->_timezones[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_timezones;
	}
	
//-----------------------------------------------------------------------------------------------------------
	/** get agencies from table */
	public function get_agencies()
	{
		$query = "SELECT * FROM agencies";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				$this->_agencies[$key][$row['id']] = $value;
     	mysqli_free_result($result);

     	return $this->_agencies;
	}
//-----------------------------------------------------------------------------------------------------------
 	/** get wavelength units from table
 	 * @todo improve this a bit */
 	public function get_wavelength_units()
 	{
		$query = "SELECT id, wavelength_unit FROM wavelength_units";
		$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_wavelengthUnits[$key][] = $value;
				$this->_wavelengthUnits[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_wavelengthUnits;
 	}

//-----------------------------------------------------------------------------------------------------------
 	/** get wavelength ranges from table
 	 * @todo improve this a bit */
 	public function get_wavelength_ranges()
 	{
 		$query = "SELECT id, acronym FROM wavelength_ranges";
 		$result = self::$db->query($query);
 		
 		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
      			$this->_wavelengthRanges[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_wavelengthRanges;
 	}
//-----------------------------------------------------------------------------------------------------------
 	
}


?>