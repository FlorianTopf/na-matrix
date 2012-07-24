<?php
/**
 * @file spacemission.php
 * @version $Id$
 * @author Florian Topf
 */


/**
 * @class Spacemission
 *
 * @brief Represents the table space_missions and access to it
 *
 * @todo generalize error messages and send them via mail
 * integrate set_message() with error by checking in controller each time
 * if a SESSION error ocurred show_message()
 * 
 * @todo check all htmlentities/htmlspecialchars occurences!!
 */
class SpacemissionDAO extends ModelDAO
 {
	/** Array for all agencies */
	protected $_agencies = array();

	/** Array for all research areas */
	protected $_researchAreas = array();

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
	'science_goals' => '');

//-----------------------------------------------------------------------------------------------------------
 	/** get a field from sensors */
	public function get_sensor($x_field, $y_field)
	{
		if(isset($this->_sensors[$x_field][$y_field]))
			return htmlspecialchars($this->_sensors[$x_field][$y_field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from scientific contacts */
	public function get_scientific_contact($x_field, $y_field, $z_field)
	{
		if(isset($this->_scientificContacts[$x_field][$y_field][$z_field]))
			return htmlspecialchars($this->_scientificContacts[$x_field][$y_field][$z_field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn get_all_resources($page, $filters)
   * @brief gets all existing resources space mission
   *
   * @param $page which page wants to display resources
   * @param $filters array of values to be used as filter on the database
   *
   * @return $resources array of resources
   */
	public function get_all_resources($page, $filters = array())
	{
		$resources = array();
		$filter_queries = array();
		/** we have to check carefully when resetting the filters */
		$filter_string = implode('', $filters);
//		print "Filterstring: " . $filter_string;
//		nl();
		
		if($page == "edit")
			$query = "SELECT id, mission_name AS name, creation_date, modification_date FROM space_missions ORDER BY modification_date DESC";
		if($page == "browse")
		{
			$query = "SELECT id, mission_name, mission_agency, launch_date, death_date, web_address FROM space_missions";

			if(!empty($filter_string))
				$query .= " WHERE ";
				
			//in the case if someone is hitting enter - without autocompleter		
			if(!empty($filters["name"]))
				$filter_queries[] = 'mission_name LIKE "%' . $filters["name"] . '%"';
			
			if(!empty($filters["id"]))
				$filter_queries[] = "id=" . $filters["id"];
			
			if(!empty($filters["agency"]))
				$filter_queries[] = "mission_agency=". $filters["agency"];
				
			if(!empty($filters["research_area"]))
			{
				$filter_queries[] = "id IN (SELECT space_mission_id FROM space_mission_to_research_areas WHERE " .
				"research_area_id=" . $filters["research_area"] . ")";
			}
			
			if(!empty($filters["target"]))
			{
				$filter_queries[] = "id IN (SELECT space_mission_id FROM space_mission_to_targets WHERE " .
				"target_id=" . $filters["target"] . ")";
			}
			
			/** concatenating all filter queries with AND */
			$query .= implode(" AND ", $filter_queries);
			
			$query .= " ORDER BY mission_name";
			
			//DEBUG:
//			echo $query;
//			nl();
		}

		$result = self::$db->query($query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			$resources[$row["id"]] = $row;
			if($page == "browse")
			{
				//Mission Agency
				$query2 = "SELECT acronym, web_address FROM agencies WHERE id=" . $row["mission_agency"];
				$result2 = self::$db->query($query2);
				$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
				$resources[$row["id"]]["agency"] = $row2["acronym"];
				$resources[$row["id"]]["agency_web_address"] = $row2["web_address"];
				mysqli_free_result($result2);

				//Targets
				$targets = array();
				$query2 = "SELECT target_id FROM space_mission_to_targets WHERE space_mission_id=" . $row["id"];
				$result2 = self::$db->query($query2);
				while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC))
				{
					$query3 = "SELECT target_name FROM targets WHERE id=" . $row2["target_id"];
					$result3 = self::$db->query($query3);
					$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
					$resources[$row["id"]]["targets"][] = $row3["target_name"];
					mysqli_free_result($result3);
				}
				mysqli_free_result($result2);
			}
		}
		mysqli_free_result($result);

		return $resources;
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
      	$result = self::$db->query($query);
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
		$result = self::$db->query($query);

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			foreach ($row as $key => $value)
				$this->_hasMany[$key][] = $value;

		mysqli_free_result($result);

		//Targets
		$query = "SELECT target_id as targets FROM space_mission_to_targets " .
		"WHERE space_mission_to_targets.space_mission_id=" . $resource_id;
		$result = self::$db->query($query);
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
		$result = self::$db->query($query);

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			//for each sensor of the requested space mission
			foreach($row as $key => $value)
				//check if value is 0 since we use FLOAT in the DB
				if($value != '0' || $key == "range_begin" || $key == "range_end")
				{
					if($key == 'id')
					{
						//save sensors id in sensors
						$this->_hasMany["sensors"][] = $value;

						//get all scientific contacts from current sensor
						$query_2 = "SELECT * FROM scientific_contacts, sensor_to_scientific_contacts " .
						"WHERE scientific_contacts.id=sensor_to_scientific_contacts.scientific_contact_id ".
						"AND sensor_to_scientific_contacts.sensor_id=" . $value;
						//DEBUG:
						//echo "Scientific Contacts queries: " . $query_2 . "<br>";
						$result_2 = self::$db->query($query_2);

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
					else if ($key == 'sensor_type') /** check for entries and put semicolon (autocomplete) */
					{
						$value = trim($value); //remove whitespaces at the beginning/end
						//print "TEST: " . $value . "x";
						//nl();
						// has only something to do with autocompleter
						if ((substr($value, -1) != ",") && !empty($value)) 
							$value = $value . ", "; //add semicolon
						//a little mistake from avove (with !empty missing before)
						else if ($value == ",")
							$value = "";
						else if($value != "")
							$value = $value . " ";
							
						//print "TEST 2: " . $value ."x";
						//nl();
						$this->_sensors[$key][] = stripslashes($value);
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
 * @fn get_old_resource($resource_id)
   * @brief gets an Old NA1 DB space mission resource
   *
   * @param $resource_id ID of the resource we want to have
   *
   * GLOBAL: $_POST array
   */
	public function get_old_resource($resource_id) {

		//OLD NA1 - maintable Table:
		$query = "SELECT * FROM maintable WHERE id=" . $resource_id;
      	$result = self::$dbOldSpa->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No such Resource existing!</b>");
      	mysqli_free_result($result);

      	foreach ($res as $key => $value)
		{
			if($key == "Mission")
				$this->_fields["spa_mission_name"] = stripslashes($value);
			if($key == "Agency")
				$this->_fields["spa_brief_description"] = "Agency: " . stripslashes($value) . LF;
			if($key == "Launch")
				$this->_fields["spa_launch_date"] = stripslashes($value);
			if($key == "Death")
				$this->_fields["spa_death_date"] = stripslashes($value);
			if($key == "Orbit")
				$this->_fields["spa_brief_description"] .= "Orbit: " . stripslashes($value) . LF;
			if($key == "Notes")
				$this->_fields["spa_brief_description"] .= "Notes: " . stripslashes($value) . LF;
			if($key == "sid")
				$spaId = stripslashes($value);
		}

		//OLD NA1 - sensors Table
		$query = "SELECT * FROM sensors WHERE sid=" . $spaId;
      	$result = self::$dbOldSpa->query($query);

      	$counter = 0;
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{

      		foreach ($row as $key => $value)
      		{
      			if($key == "sid")
      				$this->_hasMany["sensors"][] = $counter;
				if($key == "Sensor")
      				$this->_sensors["sensor_name"][] = stripslashes($value);
      			if($key == "Type")
      				$this->_sensors["sensor_type"][] = stripslashes($value);
      			if($key == "underlying")
      				$this->_sensors["underlying"][] = stripslashes($value);
      			if($key == "rangebegin")
      				$this->_sensors["range_begin"][] = floatval($value);
      			if($key == "rangeend")
      				$this->_sensors["range_end"][] = ($value != "") ? floatval($value) : "";
      			if($key == "units")
      				$this->_sensors["units"][] = stripslashes($value);
      			if($key == "measured")
      				$this->_sensors["measured"][] = stripslashes($value);
      			if($key == "resolution")
      				$this->_sensors["resolution"][] = stripslashes($value);
      			if($key == "fov")
      				$this->_sensors["field_of_view"][] = stripslashes($value);
      			if($key == "sciencegoals")
      				$this->_sensors["sensor_comments"][] = "SciGoals: " . stripslashes($value) . LF;
      			if($key == "prin_inv")
      				$this->_scientificContacts["name"][$counter][] = stripslashes($value);
      			if($key == "prin_inv_con")
      				$this->_scientificContacts["email"][$counter][] = stripslashes($value);

      		}
      		$counter++;
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
  		"`id`,`mission_name`,`mission_agency`,`launch_date`,`death_date`,`web_address`, `brief_description`, 
  		`creation_date`, `modification_date`, `research_comments`, `target_comments`)" .
  		" VALUES (NULL,'" .
        addslashes($_POST["add_spa_name"]) . "','" .
        $_POST["add_spa_agency_id"] . "','" .
        $_POST["add_spa_launch"] . "','" .
        $_POST["add_spa_death"] . "','" .
        addslashes($_POST["add_spa_web_address"]) . "','" .
        addslashes($_POST["add_spa_brief_desc"]) . "'," .
        "NOW()" . ",'','" .
        addslashes($_POST["add_spa_research_com"]) . "','" .
        addslashes($_POST["add_spa_target_com"])
        . "')";
        
        //echo $query;

        self::$db->query($query);
        $status = array("errno" => self::$db->errno(),
                        "error" => self::$db->error(),
                        "res_id" => self::$db->getLastInsertId(), 
        				"res_name" => $_POST["add_spa_name"]);

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
		"modification_date=NOW()," .
		"research_comments='" . addslashes($_POST["add_spa_research_com"]) . "'," .
        "target_comments='" . addslashes($_POST["add_spa_target_com"]) . "' " .
  		"WHERE id=" . $res_id;
        
  		self::$db->query($query);
	    $status = array("errno" => self::$db->errno(),
                        "error" => self::$db->error(),
                        "res_id" => $res_id,
	    				"res_name" => $_POST["update_spa_name"]);

	  	return $status;
	}
	
//-----------------------------------------------------------------------------------------------------------
/**
   * @fn del_resource($res_id)
   * @brief deletes an existing resource space mission
   *
   * @param $res_id ID of the resource we want to have
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function del_resource($res_id)
	{
		//DELETING scientific contacts
		$query = "DELETE FROM scientific_contacts WHERE id IN " .
			 "(SELECT scientific_contact_id FROM sensor_to_scientific_contacts, sensors, space_mission_to_sensors " .
			 "WHERE space_mission_to_sensors.sensor_id = sensors.id AND " .
			 "space_mission_to_sensors.sensor_id = sensor_to_scientific_contacts.sensor_id AND " .
			 "space_mission_to_sensors.space_mission_id = " . $res_id . ");";
		self::$db->query($query);
		
		//DELETING sensors
		$query = "DELETE FROM sensors WHERE id IN " .
			"(SELECT space_mission_to_sensors.sensor_id FROM space_mission_to_sensors WHERE " .
			"space_mission_to_sensors.sensor_id  = sensors.id AND " . 
			"space_mission_to_sensors.space_mission_id = " . $res_id . ");";
	    self::$db->query($query);
		
		//DELETING spacemission
		$query = "DELETE FROM space_missions WHERE id=" . $res_id;
		self::$db->query($query);

		$status = array("errno" => self::$db->errno(),
			"error" => self::$db->error(),
			"resource_id" => $res_id);

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
   	 				$wavelength_ranges = $this->get_wavelength_ranges();
					$wavelength_string = "";
			 		foreach($wavelength_ranges['id'] as $wl_key => $value)
			 		{
			 			//add name to string here if post-key isset!
			 			if(isset($_POST["add_spa_sen_wavelength_{$wl_key}"][$key]))
			 			{
			 				//print $wavelength_ranges['acronym'][$key];
			 				//nl();
			 				$wavelength_string .= ($wavelength_ranges['acronym'][$wl_key] . ", ");
			 			}
			 		}
   	 				
   	 				$query = "INSERT INTO sensors (`id`,`sensor_name`,`sensor_type`,`diameter_m`, `wavelength`, `range_begin`," .
	   	 	  		   "`range_end`,`units`,`measured`,`resolution`,`field_of_view`,`web_address`, `sensor_comments`) VALUES (NULL,'" .
	   	 	  		   addslashes($_POST["add_spa_sen_name"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_type"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_dia"][$key]) . "','" .
	   	 	  		   addslashes($wavelength_string) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_range_beg"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_range_end"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_units"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_measured"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_resolution"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_fov"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sen_web"][$key]) . "','" .
	   	 	  		   addslashes($_POST["add_spa_sensor_com"][$key]) . "')";
	
	   	 	  		//DEBUG:
	   	 	  		//echo "Main Query: " . $query . "<br>";
	
	   	 	  		self::$db->query($query);
		        	if (self::$db->errno() != 0)
		          		print "<H4>Error inserting new entry in sensors!</H4>" . LF;
	
		      		//Save sensor id for additional queries
		      		$sensor_id = self::$db->getLastInsertId();
	
	   	 	 		//Space Mission to Sensors
	   	 	 		$query = "INSERT INTO space_mission_to_sensors (`space_mission_id`,`sensor_id`)" .
	   	 	 		"VALUES (" . $res_id . "," .  $sensor_id . ")";
	
	   	 	 		self::$db->query($query);
	   	 	    	if (self::$db->errno() != 0)
	   	 	    		print "<H4>Error inserting new entry in space_mission_to_sensors!</H4>" . LF;
	
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
	
			            	self::$db->query($query);
					    	if (self::$db->errno() != 0)
					        	print "<H4>Error inserting scientific_contacts!</H4>" . LF;
	
					    	$query = "INSERT INTO sensor_to_scientific_contacts VALUES (" . $sensor_id .
					         	     "," . self::$db->getLastInsertId() . ")";
	
					    	self::$db->query($query);
					    	if (self::$db->errno() != 0)
					        	print "<H4>Error inserting sensor_to_scientific_contacts!</H4>" . LF;
						}
					}
   	 			}
   	 		}
   	 	}
   }

//-----------------------------------------------------------------------------------------------------------
   /**
   * @fn del_old_resource($resource_id);
   * @brief DELETE Old NA1 DB spacemission entries for given $resource_id
   *
   * @param $resource_id ID of Space Mission where we want to delete
   *
   * GLOBAL: $_POST array
   */
	public function del_old_resource($resource_id)
	{
		// Get sid of OLD NA1 Spa resource
		$query = "SELECT sid FROM maintable WHERE id=" . $resource_id;
      	$result = self::$dbOldSpa->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No such Resource existing!</b>");
      	mysqli_free_result($result);

		// DELETE spacemission sensors Table entries of Old NA1 DB
      	$query = "DELETE FROM sensors WHERE sensors.sid=" . $res["sid"] . ";";
		self::$dbOldSpa->query($query);

		// DELETE spacemission maintable Table entry of Old NA1 DB
		$query = "DELETE FROM maintable WHERE maintable.id=" . $resource_id . ";";
		self::$dbOldSpa->query($query);

		$status = array("errno" => self::$dbOldSpa->errno(),
			"error" => self::$dbOldSpa->error(),
			"resource_id" => $resource_id);

		return $status;
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
	 self::$db->query($query);
	 if (self::$db->errno() != 0)
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
	     	self::$db->query($query);
         	if (self::$db->errno() != 0)
         		print "<H4>Error deleting entry in sensor_to_scientific_contacts!</H4>" . LF;


         	$query = "DELETE FROM sensors WHERE id=" . $sen_id;

          	//DEBUG:
      	 	//echo "TEST: " . $query . "<br>";
      	 	//echo "SEN_ID" . $sen_id . "<br>";
         	self::$db->query($query);
         	if (self::$db->errno() != 0)
         		print "<H4>Error deleting entry in sensors!</H4>" . LF;

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

   				self::$db->query($query);
	      		if (self::$db->errno() != 0)
	        		print "<H4>Error inserting new entry in research_areas!</H4>" . LF;

   				//push new id into add_obs_res_are_ids
   				array_push($_POST["add_spa_res_are_ids"], self::$db->getLastInsertId());
   			}
   		}

   		foreach ($_POST["add_spa_res_are_ids"] as $res_are_id)
	    {
			//check if res id is empty and 100000 (other)
	    	if(($res_are_id != '') && ($res_are_id != 100000))
	      	{
	      		$query = "INSERT INTO space_mission_to_research_areas VALUES (" . $res_id .
	        	"," . $res_are_id . ")";

	     		self::$db->query($query);
	      		if (self::$db->errno() != 0)
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
	  self::$db->query($query);
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

	     			self::$db->query($query);
	      			if (self::$db->errno() != 0)
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
	  self::$db->query($query);
    }

 }

?>
