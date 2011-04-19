<?php
/**
 * @file spacemission.php
 * @version $Id$
 * @author Florian Topf
 *
 * @todo generalize error messages and send them via mail
 */

//require_once ('../inc/functions.php');

/**
 * @class Spacemission
 *
 * @brief Represents the table space_missions and access to it
 */
class SpacemissionDAO
 {
	/** database connection */
	protected $_link = NULL;

	/** Array of column names from space mission */
	protected $_fields = array();

	/** Array for all agencies */
	protected $_agencies = array ();

	/** Array for all research areas */
	protected $_researchAreas = array ();

	/** Array for all targets */
	protected $_targets = array();

	/** Array for all science goals */
	protected $_scienceGoals = array();

	/** Array of column names for sensors */
	protected $_sensors = array();

	/** Array of column names for scientific_contacts */
	protected $_scientificContacts = array();

	/** Array of all 1-N relations: 1 space mission can have N entries
	 * 1 sensor can have N scientific contacts/science goals
	 * key is target table, value are foreign keys */
	protected $_hasMany = array (
	'research_areas' => '',
	'targets' => '',
	'sensors' => '',
	'scientific_contacts' => '',
	'science_goals');

//-----------------------------------------------------------------------------------------------------------
	/** creates relevant member variables */
	function __construct() {
		 //creates database connection
		 $this->_link = dbiSelect();
	}

//-----------------------------------------------------------------------------------------------------------
 	/** removes/unsets relevant member variables */
	function __destruct() {
		//closes database connection
		mysqli_close($this->_link);
	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from space mission */
	public function get_field($field)
	{
		return htmlentities($this->_fields[$field],ENT_QUOTES);
	}

//-----------------------------------------------------------------------------------------------------------
	/** get agencies from table */
	public function get_agencies()
	{
		$query = "SELECT * FROM agencies";
      	$result = mysqli_query($this->_link, $query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				$this->_agencies[$key][$row['id']] = $value;
     	mysqli_free_result($result);

     	return $this->_agencies;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get fieldkeys from 1-N relations (_hasMany) */
	public function get_has_many($x_field, $y_field)
	{
		if($y_field == NULL)
			return $this->_hasMany[$x_field];
		else
			return $this->_hasMany[$x_field][$y_field];
	}

//-----------------------------------------------------------------------------------------------------------
	/** initialize 1-N relation (_hasMany) if no entry is there */
	public function init_has_many($x_field, $y_field)
	{
		if($y_field == NULL)
		{
			$this->_hasMany[$x_field] = array();
			array_push($this->_hasMany[$x_field], "0");
		}
		else
		{
			$this->_hasMany[$x_field][$y_field] = array();
			array_push($this->_hasMany[$x_field][$y_field], "0");
		}

		//echo "INIT HAS MANY: " . $x_field . "<br>";
	}

//-----------------------------------------------------------------------------------------------------------
	/** get all research_areas from table
	 * @todo improve this a bit
	 * @todo if we want to call this several times, we need to reinitalize arrays
	 * @todo this is a duplicate to get_research_areas, refactoring needed */
	public function get_research_areas()
	{
		$query = "SELECT * FROM research_areas ORDER BY research_areas.name ASC";
      	$result = mysqli_query($this->_link, $query)
      	 or die("<br>Error: ". mysqli_error($this->_link));
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      	    foreach ($row as $key => $value)
				$this->_researchAreas[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_researchAreas;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get targets from table
	 * @todo improve this a bit
	 * @todo if we want to call this several times, we need to reinitalize arrays */
	public function get_targets()
	{
		$query = "SELECT id, target_family, target_name FROM targets ORDER BY targets.target_family ASC";
      	$result = mysqli_query($this->_link, $query)
      	 or die("<br>Error: ". mysqli_error($this->_link));
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				$this->_targets[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_targets;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get science goals from table
	 * @todo improve this a bit
	 * @todo if we want to call this several times, we need to reinitalize arrays */
   public function get_science_goals()
   {
		$query = "SELECT * FROM science_goals";
      	$result = mysqli_query($this->_link, $query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
  			foreach($row as $key => $value)
  				$this->_scienceGoals[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_scienceGoals;
   }

//-----------------------------------------------------------------------------------------------------------
 	/** get a field from sensors */
	public function get_sensor($x_field, $y_field)
	{
		return htmlentities($this->_sensors[$x_field][$y_field],ENT_QUOTES);
	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from scientific contacts */
	public function get_scientific_contact($x_field, $y_field, $z_field)
	{
		return htmlentities($this->_scientificContacts[$x_field][$y_field][$z_field],ENT_QUOTES);
	}

//-----------------------------------------------------------------------------------------------------------
/**
 * @fn get_resource($resource_id)
   * @brief gets an existing resource space mission
   *
   * @param $resource_id ID of the resource we want to have
   *
   * GLOBAL: $_POST array
   */
	public function get_resource($resource_id) {
		$query = "SELECT * FROM space_missions WHERE id=" . $resource_id;
      	$result = mysqli_query($this->_link, $query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      	     or die("<br>Error: No such Resource existing!</b>");

      	//SPACE MISSION TABLE
		foreach($res as $key => $value)
			//check if value is 0000-00-00 since we use DATE in the DB
			if($value != "0000-00-00")
				$this->_fields["spa_$key"] = stripslashes($value);
			else
				$this->_fields["spa_$key"] = '';

		mysqli_free_result($result);

      	//Research Areas
		$query = "SELECT research_area_id as research_areas FROM space_mission_to_research_areas " .
		"WHERE space_mission_to_research_areas.space_mission_id=" . $resource_id;
		$result = mysqli_query($this->_link, $query);

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			foreach ($row as $key => $value)
				$this->_hasMany[$key][] = $value;

		mysqli_free_result($result);

		//Targets
		$query = "SELECT target_id as targets FROM space_mission_to_targets " .
		"WHERE space_mission_to_targets.space_mission_id=" . $resource_id;
		$result = mysqli_query($this->_link, $query)
			or die("<br>Error: ".mysqli_error($this->_link));

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			foreach($row as $key => $value)
				$this->_hasMany[$key][] = $value;

		mysqli_free_result($result);

		//Sensor Table and according Science Goals/Scientific Contacts
		$query = "SELECT * FROM sensors, space_mission_to_sensors " .
		"WHERE sensors.id=space_mission_to_sensors.sensor_id " .
		"AND space_mission_to_sensors.space_mission_id=" . $resource_id;
		//DEBUG:
		//echo "Sensor query: " . $query . "<br>";
		$result = mysqli_query($this->_link, $query);

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			//for each sensor of the requested space mission
			foreach($row as $key => $value)
				/** @todo check if value is 0 since we use FLOAT in the DB */
				if($value != '0')
				{
					if($key == 'id')
					{
						//save sensors id in sensors
						$this->_hasMany["sensors"][] = $value;

						//get all science goals from current sensor
//						$query_1 = "SELECT science_goal_id FROM sensor_to_science_goals WHERE sensor_id=" . $value;
//						//DEBUG:
//						//echo "Science Goals queries: " . $query_1 . "<br>";
//						$result_1 = mysqli_query($this->_link, $query_1)
//							or die("<br>Error: ". mysqli_error($this->_link));
//
//						while ($row_1 = mysqli_fetch_array($result_1, MYSQLI_ASSOC))
//							$this->_hasMany["science_goals"][$value][] = $row_1["science_goal_id"];
//
//						mysqli_free_result($result_1);

						//get all scientific contacts from current sensor
						$query_2 = "SELECT * FROM scientific_contacts, sensor_to_scientific_contacts " .
						"WHERE scientific_contacts.id=sensor_to_scientific_contacts.scientific_contact_id ".
						"AND sensor_to_scientific_contacts.sensor_id=" . $value;
						//DEBUG:
						//echo "Scientific Contacts queries: " . $query_2 . "<br>";
						$result_2 = mysqli_query($this->_link, $query_2)
							or die("<br>Error: ". mysqli_error($this->_link));

						while ($row_2 = mysqli_fetch_array($result_2, MYSQLI_ASSOC))
						{
							foreach($row_2 as $sc_key => $sc_value)
								if($sc_key == 'id')
									$this->_hasMany["scientific_contacts"][$value][] = $sc_value;
								else
									$this->_scientificContacts[$sc_key][$value][] = stripslashes($sc_value);
						}
						mysqli_free_result($result_2);
					}
					else
						$this->_sensors[$key][] = stripslashes($value);
				}
				else
					$this->_sensors[$key][] = '';
		}
		mysqli_free_result($result);
	}
//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_resource()
   * @brief adds a new resource space mission
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function add_resource() {
  		$query = "INSERT INTO space_missions (" .
  		"`id`,`mission_name`,`mission_agency`,`launch_date`,`death_date`,`web_address`, `brief_description`, `creation_date`)" .
  		"VALUES(NULL,'" .
        addslashes($_POST["add_spa_name"]) . "','" .
        $_POST["add_spa_agency_id"] . "','" .
        $_POST["add_spa_launch"] . "','" .
        $_POST["add_spa_death"] . "','" .
        addslashes($_POST["add_spa_web_address"]) . "','" .
        addslashes($_POST["add_spa_brief_desc"]) . "'," .
        "NOW())";

        mysqli_query($this->_link, $query);
        $status = array("errno" => mysqli_errno($this->_link),
                        "error" => mysqli_error($this->_link),
                        "res_id" => mysqli_insert_id($this->_link));

        return $status;
	}
//-----------------------------------------------------------------------------------------------------------
/**
   * @fn update_resource($res_id)
   * @brief updates an existing resource space mission
   * 
   * @param $res_id ID of the resource we want to have
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function update_resource($res_id) {
		$query = "UPDATE space_missions SET " .
  		"mission_name='" . addslashes($_POST["update_spa_name"]) . "'," .
  		"mission_agency='" . $_POST["add_spa_agency_id"] . "'," .
  		"launch_date='" . $_POST["add_spa_launch"] . "'," .
  		"death_date='" . $_POST["add_spa_death"] . "'," .
  		"web_address='" . addslashes($_POST["add_spa_web_address"]) . "'," .
		"brief_description='" . addslashes($_POST["add_spa_brief_desc"]) . "'," .
		"modification_date=NOW() " .
  		"WHERE id=" . $res_id;

  		mysqli_query($this->_link, $query);
	    $status = array("errno" => mysqli_errno($this->_link),
                        "error" => mysqli_error($this->_link),
                        "res_id" => $res_id);

	  	return $status;
	}
//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_spa_keys($res_id, $action)
   * @brief ADD/UPD/DEL SPACE MISSIONS KEY REFERENCE TABLE ENTRIES
   *
   * @param $res_id ID of space mission where we want to add SQL keys
   * @param $action ADD/UPDATE/DELETE space mission
   *
   * GLOBAL: $_POST array
   *
   * @todo finish IMPLEMENTATION of sensors at add_spa_keys($res_id, $action)
   */
 	function add_spa_keys($res_id, $action)
  	{
 		// ------------------------------------------------------------
    	// ADD/UPD/DEL (space_mission_to_research_areas & research_areas)
	    //called via EDIT
	    if ($action == "Update Entry")
	    {
	      $this->delete_res_areas($res_id);
	    }
	    //called VIA ADD/EDIT
	    $this->add_res_areas($res_id);

  		// ------------------------------------------------------------
    	// ADD/UPD/DEL (space_mission_to_targets & targets)
    	if ($action == "Update Entry")
   		{
   		  $this->delete_targets($res_id);
    	}
    	$this->add_targets($res_id);

    	// ------------------------------------------------------------
    	// ADD/UPD/DEL (space_mission_to_sensors & sensors)
    	if ($action == "Update Entry")
    	{
    		$this->delete_sensors($res_id);
    	}
    	$this->add_sensors($res_id);

  	}

//-----------------------------------------------------------------------------------------------------------
/**
   * @fn add_sensors($res_id);
   * @brief INSERT sensors & space_mission_to_sensors TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to insert sensors
   *
   * GLOBAL: $_POST array
   */
   protected function add_sensors($res_id)
   {
		if(isset($_POST["add_spa_sen_name"]))
   	 	{

   	 		foreach($_POST["add_spa_sen_name"] as $key => $name)
   	 		{
   	 			//Check if this sensor fieldset is filled
   	 			if($name != '')
   	 			{

   	 	  		$query = "INSERT INTO sensors (`id`,`sensor_name`,`sensor_type`,`underlying`,`range_begin`," .
   	 	  		   "`range_end`,`units`,`measured`,`resolution`,`field_of_view`,`web_address`, `sensor_comments`) VALUES (NULL,'" .
   	 	  		   addslashes($_POST["add_spa_sen_name"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_type"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_under"][$key]) . "','" .
   	 	  		              $_POST["add_spa_sen_range_beg"][$key] . "','" .
   	 	  		              $_POST["add_spa_sen_range_end"][$key] . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_units"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_measured"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_resolution"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_fov"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sen_web"][$key]) . "','" .
   	 	  		   addslashes($_POST["add_spa_sensor_com"][$key]) . "')";

   	 	  		//DEBUG:
   	 	  		//echo "Main Query: " . $query . "<br>";

   	 	  		mysqli_query($this->_link, $query);
	        	if (mysqli_errno($this->_link) != 0)
	          		print "<H4>Error inserting new entry in sensors!</H4>" . LF;

	      		//Save sensor id for additional queries
	      		$sensor_id = mysqli_insert_id($this->_link);

   	 	 		//Space Mission to Sensors
   	 	 		$query = "INSERT INTO space_mission_to_sensors (`space_mission_id`,`sensor_id`)" .
   	 	 		"VALUES (" . $res_id . "," .  $sensor_id . ")";

   	 	 		mysqli_query($this->_link, $query)
   	 	    		or die("<br>Error: ".mysqli_error($this->_link));
   	 	    	if (mysqli_errno($this->_link) != 0)
   	 	    		print "<H4>Error inserting new entry in space_mission_to_sensors!</H4>" . LF;

          		//Sensor to Science Goals
          		//new Science Goals
//   	 	    	if(isset($_POST["add_sci_goal"][$key]))
//          		{
//          			foreach($_POST["add_sci_goal"][$key] as $id => $new_sci_goal)
//          			{
//          				if($new_sci_goal != '')
//          				{
//          					$query = "INSERT INTO science_goals (" .
//   							"`id`,`acronym`,`name`)". " VALUES (NULL, '" .
//   							addslashes($_POST["add_sci_acro"][$key][$id]) . "', '" .
//          					addslashes($new_sci_goal) . "')";
//
//          					mysqli_query($this->_link, $query);
//	      					if (mysqli_errno($this->_link) != 0)
//	        					print "<H4>Error inserting new entry in science_goals!</H4>" . LF;
//
//	        				//push new id into add_spa_sci_goal_ids
//	        				/** @todo we need to check if the array is existing or put validation in JS */
//   							array_push($_POST["add_spa_sci_goal_ids"][$key], mysqli_insert_id($this->_link));
//          				}
//          			}
//          		}
//
//   		    	if(isset($_POST["add_spa_sci_goal_ids"][$key]))
//   		    		foreach($_POST["add_spa_sci_goal_ids"][$key] as $sci_goal_id)
//   		    		{
//   		    			//check if sci goal id is not empty and 100000 (other)
//   		    			/** @todo maybe obsolete */
//	    				if(($sci_goal_id != '') && ($sci_goal_id != 100000))
//	      				{
//   		    				$query = "INSERT INTO sensor_to_science_goals (`sensor_id`,`science_goal_id`) " .
//   		    				"VALUES (" . $sensor_id . "," . $sci_goal_id . ")";
//   		      		   		//DEBUG:
//   		      		   		//echo "sensor_to_science_goals - Query: " . $query . "<br>";
//   		      				mysqli_query($this->_link, $query)
//   		      					or die("<br>Error: ".mysqli_error($this->_link));
//	            			if (mysqli_errno($this->_link) != 0)
//	              				print "<H4>Error inserting new entry in sensors_to_science_goals!</H4>" . LF;
//	      				}
//					}

   		  		//Scientific Contacts
	   	 		foreach($_POST["add_spa_sci_con_name"][$key] as $sci_con_key => $sci_con_line)
				{
					// check if a name is written in the line
					if ($_POST["add_spa_sci_con_name"][$key][$sci_con_key] != "")
					{

		               	$query = "INSERT INTO scientific_contacts VALUES (NULL,'" .
		               		addslashes($_POST["add_spa_sci_con_name"][$key][$sci_con_key]) . "','" .
		               		addslashes($_POST["add_spa_sci_con_email"][$key][$sci_con_key]) . "','" .
		               		addslashes($_POST["add_spa_sci_con_institution"][$key][$sci_con_key]) . "')";

		            	mysqli_query($this->_link, $query);
				    	if (mysqli_errno($this->_link) != 0)
				        	print "<H4>Error inserting scientific_contacts!</H4>" . LF;

				    	$query = "INSERT INTO sensor_to_scientific_contacts VALUES (" . $sensor_id .
				         	     "," . mysqli_insert_id($this->_link) . ")";

				    	mysqli_query($this->_link, $query);
				    	if (mysqli_errno($this->_link) != 0)
				        	print "<H4>Error inserting sensor_to_scientific_contacts!</H4>" . LF;
					}
				}
   	 			}
   	 		}
   	 	}
   }

//-----------------------------------------------------------------------------------------------------------
   /**
   * @fn delete_sensors($res_id);
   * @brief DELETE sensors & space_mission_to_sensors TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to delete sensors
   *
   * GLOBAL: $_POST array
   */
   protected function delete_sensors($res_id)
   {
   	//Space Mission To Sensors
     $query = "DELETE FROM space_mission_to_sensors WHERE " .
               "space_mission_id=" . $res_id;

     //DEBUG:
     //echo "TEST: " . $query . "<br>";
	 mysqli_query($this->_link, $query);
	 if (mysqli_errno($this->_link) != 0)
	              print "<H4>Error deleting entry in space_mission_to_sensors!</H4>" . LF;

	 //Sensor
	 if(isset($_POST["add_spa_sensor_ids"]))
	   foreach($_POST["add_spa_sensor_ids"] as $sen_id)
	   {
         //we need to check for empty values (because of cloning hidden fields)
         if($sen_id != '')
         {

         	//Scientific Contacts
         	$query = "DELETE FROM scientific_contacts WHERE id IN " . "
         	(SELECT scientific_contact_id FROM sensor_to_scientific_contacts WHERE sensor_id=" . $sen_id . ")";
	 	 	//DEBUG:
     	 	//echo "TEST: " . $query . "<br>";
	     	mysqli_query($this->_link, $query);
         	if (mysqli_errno($this->_link) != 0)
         		print "<H4>Error deleting entry in sensor_to_scientific_contacts!</H4>" . LF;


         	$query = "DELETE FROM sensors WHERE id=" . $sen_id;

          	//DEBUG:
      	 	//echo "TEST: " . $query . "<br>";
      	 	//echo "SEN_ID" . $sen_id . "<br>";
         	mysqli_query($this->_link, $query);
         	if (mysqli_errno($this->_link) != 0)
         		print "<H4>Error deleting entry in sensors!</H4>" . LF;

         	//Sensor to Science Goals (maybe obsolete)
//	     	$query = "DELETE FROM sensor_to_science_goals WHERE sensor_id=" . $sen_id;
//	 	 	//DEBUG:
//     	 	//echo "TEST: " . $query . "<br>";
//	     	mysqli_query($this->_link, $query);
//         	if (mysqli_errno($this->_link) != 0)
//         		print "<H4>Error deleting entry in sensor_to_science_goals!</H4>" . LF;

         }
	   }
   }

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_res_areas($res_id);
   * @brief INSERT space_mission_to_research_areas TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to insert research areas
   *
   * GLOBAL: $_POST array
   */
    protected function add_res_areas($res_id)
    {
   		//adding new areas
   		if(isset($_POST["add_res_are"]))
   		{
   			foreach($_POST["add_res_are"] as $new_res_are)
   			{
   				//insert new area in research_areas
   				/** @todo check if the given names of new areas are existing */
   				$query = "INSERT INTO research_areas (" .
   				"`id`,`name`)". " VALUES (NULL, '" .
   				addslashes($new_res_are) . "')";

   				mysqli_query($this->_link, $query);
	      		if (mysqli_errno($this->_link) != 0)
	        		print "<H4>Error inserting new entry in research_areas!</H4>" . LF;

   				//push new id into add_obs_res_are_ids
   				array_push($_POST["add_spa_res_are_ids"], mysqli_insert_id($this->_link));
   			}
   		}

   		foreach ($_POST["add_spa_res_are_ids"] as $res_are_id)
	    {
			//check if res id is empty and 100000 (other)
	    	if(($res_are_id != '') && ($res_are_id != 100000))
	      	{
	      		$query = "INSERT INTO space_mission_to_research_areas VALUES (" . $res_id .
	        	"," . $res_are_id . ")";

	     		mysqli_query($this->_link, $query);
	      		if (mysqli_errno($this->_link) != 0)
	        		print "<H4>Error inserting in space_mission_to_research_areas!</H4>" . LF;
	      	}
	    }
    }

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn delete_res_areas($res_id);
   * @brief DELETE space_mission_to_research_areas TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to delete research areas
   *
   * GLOBAL: $_POST array
   */
    protected function delete_res_areas($res_id)
    {
      $query = "DELETE FROM space_mission_to_research_areas WHERE " .
               "space_mission_id=" . $res_id;
	  mysqli_query($this->_link, $query);
    }

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_targets($res_id)
   * @brief INSERT space_mission_to_targes & targets TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to insert targets
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 3RD ORDER TABLE
   *
   */
    protected function add_targets($res_id)
    {
        /** @todo adding new targets needed? */

    	//if there is any entry given
   		if(isset($_POST["add_spa_target_ids"]))
   			foreach ($_POST["add_spa_target_ids"] as $target_id)
	    	{
				//if there is something choosen except first entry (explaination)
	    		if ($target_id != '')
				{
	    			$query = "INSERT INTO space_mission_to_targets VALUES (" . $res_id .
	        			     "," . $target_id . ")";

	     			mysqli_query($this->_link, $query);
	      			if (mysqli_errno($this->_link) != 0)
	        			print "<H4>Error inserting in space_mission_to_targets!</H4>" . LF;
				}
	    	}
    }
//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn delete_targets($res_id)
   * @brief DELETE space_mission_to_targes TABLE ENTRIES for given $res_id
   *
   * @param $res_id ID of Space Mission where we want to delete targets
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 3RD ORDER TABLE
   *
   */
    protected function delete_targets($res_id)
    {
      $query = "DELETE FROM space_mission_to_targets WHERE " .
		   	   "space_mission_id=" . $res_id;
	  mysqli_query($this->_link, $query);
    }

 }

?>