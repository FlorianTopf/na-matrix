<?php
/**
 * @file observatory.php
 * @version $Id$
 * @author Florian Topf
 */


/**
 * @class Observatory
 *
 * @brief Represents the table observatories and access to it
 *
 * @todo generalize error messages and send them via mail
 *       integrate set_message() with error by checking in controller each time
 *       if a SESSION error ocurred show_message()
 * @todo check all htmlentities/htmlspecialchars occurences!
 * @todo zip code und city überall komplett entfernen
 */
class ObservatoryDAO extends ModelDAO
 {
	/** Array for all countries */
	protected $_countries = array();

	/** Array for latitude prefixes
	 * @todo make a getter for this */
	public $_latitudePrefixes = array("North", "South");

	/** Array for longitude prefixes
	 * @todo make a getter for this */
	public $_longitudePrefixes = array("East", "West");

	/** Array for all precipitation ranges */
	protected $_precipitationRanges = array();

	/** Array for all precipitation ranges */
	protected $_clearnightsRanges = array ();

	/** Array for all timezones */
	protected  $_timezones = array ();

	/** Array of column names for scientific_contacts */
	protected $_scientificContacts = array();

	/** Array for all research areas */
	protected $_researchAreas = array ();

	/** Array for all targets */
	protected $_targets = array();

	/** Array for all instrument types */
	protected $_instrumentTypes = array();

	/** Array of column names for instruments */
	protected $_instruments = array();

	/** Array for all telescope types */
	protected $_telescopeTypes = array();

	/** Array for all antenna types */
	protected $_antennaTypes = array();

	/** Array for all wavelength units */
	protected $_wavelengthUnits = array();
	
	/** Array for all wavelength ranges */
	protected $_wavelengthRanges = array();

	/** Array of column names for telescopes */
	protected $_telescopes = array();

	/** Array of column names from hidden_fields */
	protected $_hiddenFields = array (
	'web_address' => 0,
	'address' => 0,
	'phone' => 0,
	'email' => 0,
	'latitude' => 0,
	'longitude' => 0,
	'scientific_contacts' => 0,
	'further_contacts' => 0 );

	/** Array of column names for additional_information */
	protected $_additionalInformation = array();

	/** Array of all 1-N relations: 1 observatory can have N entries
	 * 1 telescope can have N instruments
	 * key is target table, value are foreign keys */
	protected $_hasMany = array (
	'scientific_contacts' => '',
	'research_areas' => '',
	'targets' => '',
	'telescopes' => '',
	'instruments' => '');
	
	/** Users Array for Admin operations */
	protected $_users = array();

//-----------------------------------------------------------------------------------------------------------
	/** get field array from observatories
	 *  only for latitude / longitude right now */
	public function get_field_array($x_field, $y_field)
	{
		if(isset($this->_fields[$x_field][$y_field]))
			return $this->_fields[$x_field][$y_field];
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
 	/** get precipitation ranges from table
	 * @todo improve this a bit */
	public function get_precipitation_ranges()
	{
		$query = "SELECT * FROM precipitation_ranges ORDER BY id DESC";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_precipitationRanges[$key][] = $value;
				$this->_precipitationRanges[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_precipitationRanges;
	}

 //-----------------------------------------------------------------------------------------------------------
 	/** get clear nights from table
	 * @todo improve this a bit */
	public function get_clearnights_ranges()
	{
		$query = "SELECT * FROM clearnights_ranges ORDER BY id DESC";
      	$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_clearnightsRanges[$key][] = $value;
				$this->_clearnightsRanges[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_clearnightsRanges;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from scientific contacts */
	public function get_scientific_contact($x_field, $y_field)
	{
		if(isset($this->_scientificContacts[$x_field][$y_field]))
			return htmlspecialchars($this->_scientificContacts[$x_field][$y_field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
	/** get hidden fields */
	public function get_hidden_fields()
	{
		return $this->_hiddenFields;
	}

//-----------------------------------------------------------------------------------------------------------
 	/** get a field from telescopes */
	public function get_telescope($x_field, $y_field)
	{
		if(isset($this->_telescopes[$x_field][$y_field]))
			return htmlspecialchars($this->_telescopes[$x_field][$y_field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
 	/** get telescope types from table
  	 * @todo improve this a bit */
 	public function get_telescope_types()
 	{
		$query = "SELECT id, name FROM telescope_types ORDER BY name ASC";
		$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_telescopeTypes[$key][] = $value;
				$this->_telescopeTypes[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_telescopeTypes;
 	}

//-----------------------------------------------------------------------------------------------------------
 	/** get antenna types from table
	 * @todo improve this a bit */
 	public function get_antenna_types()
 	{
		$query = "SELECT id, antenna_type FROM antenna_types ORDER BY antenna_type ASC";
		$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_antennaTypes[$key][] = $value;
				$this->_antennaTypes[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_antennaTypes;
 	}

//-----------------------------------------------------------------------------------------------------------
 /** get a field from instruments */
	public function get_instrument($x_field, $y_field, $z_field)
	{
		if(isset($this->_instruments[$x_field][$y_field][$z_field]))
			return htmlspecialchars($this->_instruments[$x_field][$y_field][$z_field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
 	/** get instrument_types from table
  	 * @todo improve this a bit */
 	public function get_instrument_types()
 	{
		$query = "SELECT id, name FROM instrument_types ORDER BY name ASC";
		$result = self::$db->query($query);
      	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				//$this->_instrumentTypes[$key][] = $value;
				$this->_instrumentTypes[$key][$row['id']] = $value;
      	mysqli_free_result($result);

      	return $this->_instrumentTypes;
 	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from hidden fields  */
	public function get_hidden_field($field)
	{
		return $this->_hiddenFields[$field];
	}

//-----------------------------------------------------------------------------------------------------------
	/** get a field from additional_information */
	public function get_add_info($field)
	{
		if(array_key_exists($field, $this->_additionalInformation))
			return htmlspecialchars($this->_additionalInformation[$field], ENT_QUOTES);
		else
			return NULL;
	}

//-----------------------------------------------------------------------------------------------------------
	/** check if there is something inside */
	public function check_add_info()
	{
		if ($this->get_add_info('additional_instruments') || 
				$this->get_add_info('array_description') ||
				$this->get_add_info('backend_description'))
			return TRUE;
		else
			return FALSE;
	}

//-----------------------------------------------------------------------------------------------------------
	/** ADMIN TOOL FOR ASSIGNING USERS */
	public function get_users()
	{
		$query = "SELECT id, fname, lname FROM users_list ORDER BY lname ASC";
		$result = self::$db->query($query);
		
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
      		foreach ($row as $key => $value)
				if($row['id'] != '1')
					$this->_users[$key][$row['id']] = $value;
      	mysqli_free_result($result);
		
      	return $this->_users;
	}

//-----------------------------------------------------------------------------------------------------------
	/** partner observatory linker */
	public function obs_linker($partners)
	{
		$partners = trim($partners, ", ");
		$partners = explode(",", $partners);
		$new_partners = array();
		
		foreach($partners as $key => $partner)
		{
			$query = "SELECT id, name FROM observatories WHERE name LIKE '%" . trim($partner) . "%'";
			
			//echo $query;
			
			$result = self::$db->query($query);
			//maybe we just take the first result by now!
			if(self::$db->getNumRows($result) > 0)
			{
				$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
				
				$temp_partner = "<span style='color:#cd853f' title='Click for more details' " .
				"onclick=\"return openwin('ObservatoryView.php?" .
				"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["name"]) . "</span>";
				
				if(!in_array($temp_partner, $new_partners))
					$new_partners[] = $temp_partner;
			}
			else
				$new_partners[] = $partner;
		}
		
		$new_partners = implode("; ", $new_partners);
		
		return $new_partners;
	}
	
//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn get_all_resources($page, $filters)
   * @brief gets all existing resources observatory
   *
   * @param $page which page wants to display resources
   * @param $filters array of values to be used as filter on the database
   *
   * @return $resources array of resources
   *
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
		{
			$query = "SELECT id, name, user_id, creation_date, modification_date, approved, saved_for_later, last_saved_by FROM observatories WHERE ";		
				
			//this is for the users "My entries"
			if(!empty($filters["user_id"]))
				$filter_queries[] = "user_id=" . $filters["user_id"];
				
			//this is for the admins edit field!
			if(!empty($filters["id"]))
				$filter_queries[] = "id=" . $filters["id"];
			
			//we need to distinguish between edit and approve menu (0/1)
			if(isset($filters["approved"]))
				$filter_queries[] = " approved=" . $filters["approved"];
					
			/** concatenating all filter queries with AND */
			$query .= implode(" AND ", $filter_queries);
					
			$query .= " ORDER BY modification_date DESC";
			
			//print $query;
			//nl(2);
		}
		else if($page == "browse")
		{
			$query = "SELECT id, name, institution, web_address, " .
			"country_id, email, latitude, longitude FROM observatories";

			// --------------- Questionnaire Start -----------------
//			if ($_SESSION["user_level"] >= 21)
//			{
//				if(!empty($filter_string))
//					$query .= " WHERE ";
//			}
//			else
//			{
				$query .= " WHERE observatories.approved = 1 ";
				
				if(!empty($filter_string))
					$query .= "AND ";
//			}
			// --------------- Questionnaire End -----------------

			//DEBUG:
			//echo "Filter for Country:" . $filters["country"];
			//nl();
			//echo "Filter for Telescope Type:" . $filters["telescope_type"];
			//nl();
			//echo "Telescope Name: " . $filters["name"];
			//nl();
			
			//in the case if someone is hitting enter - without autocompleter		
			if(!empty($filters["name"]))
				$filter_queries[] = 'name LIKE "%' . $filters["name"] . '%"';
			
			if(!empty($filters["id"]))
				$filter_queries[] = "id=" . $filters["id"];

			if(!empty($filters["country"]))
				//$query .= "country_id=". $filters["country"];
				$filter_queries[] = "country_id=". $filters["country"];
				
			if(!empty($filters["t_name"]))
			{
				$filter_queries[] = 'id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN ' .
					'(SELECT id FROM telescopes WHERE telescope_name LIKE "%'  . $filters["t_name"] . '%"))';
			}

			if(!empty($filters["telescope_type"]))
			{
				//$query .= "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN ";
				//$query .= "(SELECT id FROM telescopes WHERE telescope_type=" . $filters["telescope_type"] . "))";
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN " .
					"(SELECT id FROM telescopes WHERE telescope_type=" . $filters["telescope_type"] . "))";
			}
			
			if(!empty($filters["mobile"]))
			{
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN " .
					"(SELECT id FROM telescopes WHERE mobile_flag=" . $filters["mobile"] . "))";
			}
			
			if(!empty($filters["diameter_sign"]))
			{
				/** @todo sort functions if necessary => put in browse sort functions */
				//$filters["diameter_m"] = ">2";
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN " .
					"(SELECT id FROM telescopes WHERE diameter_m" . $filters["diameter_sign"] . "))";
			}
			
			if(!empty($filters["wavelength_range"]))
			{
				/** @todo sort functions if necessary => put in browse sort functions */
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN " .
					"(SELECT id FROM telescopes WHERE wavelength LIKE '%" . $filters["wavelength_range"] . "%'))";
			}
			
			if(!empty($filters["instrument_type"]))
			{
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_telescopes WHERE telescope_id IN " .
					"(SELECT telescope_id FROM telescope_to_instruments WHERE instrument_id IN (SELECT id FROM instruments " .
					"WHERE instrument_type=" . $filters["instrument_type"] . ")))";
			}

			if(!empty($filters["research_area"]))
			{
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_research_areas WHERE " .
				"research_area_id=" . $filters["research_area"] . ")";
			}

			if(!empty($filters["target"]))
			{
				$filter_queries[] = "id IN (SELECT observatory_id FROM observatory_to_targets WHERE " .
				"target_id=" . $filters["target"] . ")";
			}

			/** concatenating all filter queries with AND */
			$query .= implode(" AND ", $filter_queries);

			$query .= " ORDER BY observatories.name";

			//DEBUG:
			//echo $query;
			//nl(2);
		}


		$result = self::$db->query($query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			$resources[$row["id"]] = $row;
			if($page == "browse")
			{
				$query2 = "SELECT name FROM countries WHERE id=" . $row["country_id"];
				$result2 = self::$db->query($query2);
				$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
				$resources[$row["id"]]["country"] = $row2["name"];
				mysqli_free_result($result2);

				//Hidden Fields
				$query2 = "SELECT web_address, email FROM hidden_fields WHERE id=" . $row["id"];
				$result2 = self::$db->query($query2);
				$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
				$resources[$row["id"]]["hide_web_address"] = $row2["web_address"];
				$resources[$row["id"]]["hide_email"] = $row2["email"];
				mysqli_free_result($result2);

				//Telescope Types
				$resources[$row["id"]]["telescope_types"] = array();
				$resources[$row["id"]]["wavelengths"] = array();
				$query2 = "SELECT telescope_id FROM observatory_to_telescopes WHERE observatory_id=" . $row["id"];
				$result2 = self::$db->query($query2);
				while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC))
				{
					$query3 = "SELECT telescope_type, wavelength, diameter_m FROM telescopes WHERE id=" . $row2["telescope_id"];
					$result3 = self::$db->query($query3);
					$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
					$telescope_type_id = $row3["telescope_type"];
					$resources[$row["id"]]["wavelengths"][] = $row3["wavelength"];
					$resources[$row["id"]]["diameter_m"][] = clean_num($row3["diameter_m"]) . " m ";
					mysqli_free_result($result3);

					$query3 = "SELECT name FROM telescope_types WHERE id=" . $telescope_type_id;
					$result3 = self::$db->query($query3);
					$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
					$resources[$row["id"]]["telescope_types"][] = $row3["name"];
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
   * @brief gets an existing resource observatory
   *
   * @param $resource_id ID of the resource we want to have
   *
   * GLOBAL: $_POST array
   */
	public function get_resource($resource_id) {
		$query = "SELECT * FROM observatories WHERE id=" . $resource_id;
      	$result = self::$db->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No such Resource existing!</b>");
      	mysqli_free_result($result);

		//OBSERVATORIES TABLE
		foreach ($res as $key => $value)
		{
			//check if value is 0 since we use INT in the DB
			if($value != '0')
			{
				if($key == 'latitude')
					$this->floatToGps($key, stripslashes($value));
				elseif($key == 'longitude')
					$this->floatToGps($key, stripslashes($value));
				else if($key == 'partner_observatories')
				{
					$value = trim($value); //remove whitespaces at the beginning/end
				    //check if last char is not semicolon and there is something written inside!
					if ((substr($value, -1) != ",") && !empty($value)) 
						$value = $value . ", "; //add semicolon
					//a little mistake from avove (with !empty missing before)
					else if ($value == ",")
						$value = "";
					else if($value != "")
						$value = $value . " ";
						
					$this->_fields["obs_$key"] = stripslashes($value);
				}
				else
					$this->_fields["obs_$key"] = stripslashes($value);
			}
			else
				$this->_fields["obs_$key"] = '';
		}

		//SCIENTIFIC CONTACTS
		$query = "SELECT id, name, email, institution FROM scientific_contacts, observatory_to_scientific_contacts " .
		"WHERE scientific_contacts.id=observatory_to_scientific_contacts.scientific_contact_id " .
		"AND observatory_to_scientific_contacts.observatory_id=" . $resource_id;
		//DEBUG:
		//echo $query;
		$result = self::$db->query($query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			foreach ($row as $key => $value)
			{
				if ($key == 'id')
					$this->_hasMany["scientific_contacts"][] = $value;
				else
					$this->_scientificContacts["sci_con_$key"][] = stripslashes($value);
			}
		}
		mysqli_free_result($result);

		//HIDDENFIELDS
		$query = "SELECT * FROM hidden_fields WHERE hidden_fields.id=" . $resource_id;
		$result = self::$db->query($query);
		$row = mysqli_fetch_array($result, MYSQLI_ASSOC);

		foreach ($row as $key => $value)
		{
			//check if key is not ID, we do not need that
			if($key != 'id')
				$this->_hiddenFields[$key] = $value;
		}
		mysqli_free_result($result);

		//RESEARCH AREAS
		$query = "SELECT research_area_id as research_areas FROM observatory_to_research_areas " .
		"WHERE observatory_to_research_areas.observatory_id=" . $resource_id;
		$result = self::$db->query($query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			foreach ($row as $key => $value)
				$this->_hasMany[$key][] = $value;
		}
		mysqli_free_result($result);

		//TARGETS
		$query = "SELECT target_id as targets FROM observatory_to_targets " .
		"WHERE observatory_to_targets.observatory_id=" . $resource_id;
		//DEBUG:
		//echo $query;
		$result = self::$db->query($query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			foreach ($row as $key => $value)
				$this->_hasMany[$key][] = $value;

		mysqli_free_result($result);

		//TELESCOPES
		//SIMILAR QUERY TO SCIENTIFIC CONTACTS
		$query = "SELECT * FROM telescopes, observatory_to_telescopes " .
		"WHERE telescopes.id=observatory_to_telescopes.telescope_id " .
		"AND observatory_to_telescopes.observatory_id=" . $resource_id;
		//echo "TESTING INSTRUMENT QUERY: " . $query . "<br>";

		$result = self::$db->query($query);

		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			//for each telescope of the requested obervatory
			foreach ($row as $key => $value)
			{
				//check if value is 0 since we use FLOAT in the DB
				if($value != '0' || $key == "diameter_m")
				{
					if($key == 'id')
					{
						//save telescope id in telescopes
						//DEBUG
						//echo "TELESCOPE ID: " . $value . "<br>";
						$this->_hasMany["telescopes"][] = $value;
						//$this->_hasMany["instruments"][$value] = array();

						//get all instruments for current telescope
						$query_1 = "SELECT * FROM instruments, telescope_to_instruments " .
						"WHERE instruments.id=telescope_to_instruments.instrument_id " .
						"AND telescope_to_instruments.telescope_id=" . $value;

						//DEBUG
						//echo $query_1 . "<br>";

						$result_1 = self::$db->query($query_1);
						while($row_1 = mysqli_fetch_array($result_1, MYSQLI_ASSOC))
						{
							//for each instrument of the requested telescopes
							foreach($row_1 as $i_key => $i_value)
							{
								//check if value is 0 since we use FLOAT in the DB
								if($i_value != '0')
								{
									if($i_key == 'id')
									{
										//DEBUG
										//echo "TELESCOPE ID: " . $value . "=> INSTRUMENT ID: " . $i_value . "<br>";
										$this->_hasMany["instruments"][$value][] = $i_value;
									}
									elseif($i_key == 'wavelength') /** check for entries and put semicolon (autocomplete) */
									{
										$i_value = trim($i_value); //remove whitespaces at the beginning/end
										//print "TEST: " . $value . "x";
										//nl();
										// has only something to do with autocompleter
										if ((substr($i_value, -1) != ",") && !empty($i_value)) 
											$i_value = $i_value . ", "; //add semicolon
										//a little mistake from avove (with !empty missing before)
										else if ($i_value == ",")
											$i_value = "";
										else if($i_value != "")
											$i_value = $i_value . " ";
							
										//print "TEST 2: " . $value ."x";
										//nl();
										$this->_instruments[$i_key][$value][] = stripslashes($i_value);
									}
									else
										$this->_instruments[$i_key][$value][] = stripslashes($i_value);

									//echo $i_key . ": ";
									//echo $i_value . "<br>";
								}
								else
									$this->_instruments[$i_key][$value][] = '';
							}
						}
						mysqli_free_result($result_1);
					}
					elseif ($key == 'wavelength') /** check for entries and put semicolon (autocomplete) */
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
						$this->_telescopes[$key][] = stripslashes($value);

					}
					else
						$this->_telescopes[$key][] = stripslashes($value);
				}
				else
					$this->_telescopes[$key][] = '';
			}
		}
		mysqli_free_result($result);

		//ADDITIONAL INFORMATION
		$query = "SELECT * FROM additional_information WHERE additional_information.id=" . $resource_id;
		//DEBUG:
		//echo $query;
		$result = self::$db->query($query);
		$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
		foreach ($row as $key => $value)
		{
			//check if key is not ID, we do not need that
			if($key != 'id')
				$this->_additionalInformation[$key] = stripslashes($value);
		}
		mysqli_free_result($result);

	}


//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn get_old_resource($resource_id)
   * @brief gets an existing resource OLD observatory
   *
   * @param $resource_id ID of the resource we want to have
   *
   * GLOBAL: $_POST array
   */
	public function get_old_resource($resource_id) {

		//OLD NA1 - maintable Table:
		$query = "SELECT * FROM maintable WHERE id=" . $resource_id;
//		echo "QUERY: " . $query;
//		nl();
      	$result = self::$dbOldObs->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No such Resource existing!</b>");
      	mysqli_free_result($result);
      	
      	foreach ($res as $key => $value)
		{
			if($key == "Name")
				$this->_fields["obs_name"] = $value;
			if($key == "Founded")
				$this->_fields["obs_founded"] = $value;
			if($key == "Institution")
				$this->_fields["obs_institution"] = $value;
			if($key == "URL")
				$this->_fields["obs_web_address"] = $value;
			if($key == "Country") // NO 100% match guaranteed! => as text to approx_position
				$this->_fields["obs_approx_position"] = $value;
			if($key == "Address")
				$this->_fields["obs_address"] = $value;
			if($key == "Phone")
				$this->_fields["obs_phone"] = $value;
			if($key == "email")
				$this->_fields["obs_email"] = $value;
			if($key == "Sciencecontactname")
				$this->_scientificContacts["sci_con_name"][] = stripslashes($value);
			if($key == "Sciencecontactnemail")
				$this->_scientificContacts["sci_con_email"][] = stripslashes($value);
			if($key == "Institution")
				$this->_scientificContacts["sci_con_institution"][] = stripslashes($value);
			if($key == "latitude")// NO 100% match guaranteed! => as text to approx_position
				$this->_fields["obs_approx_position"] .= "; LAT:" . stripslashes($value);
			if($key == "longitude")// NO 100% match guaranteed! => as text to approx_position
				$this->_fields["obs_approx_position"] .= "; LON:" . stripslashes($value);
			if($key == "meters")
				$this->_fields["obs_sealevel_m"] = $value;
			if($key == "precipitation")
				$this->_fields["obs_approx_position"] .= "; Rain:" . stripslashes($value);
			if($key == "clearnights")
				$this->_fields["obs_approx_position"] .= "; Nights:" . stripslashes($value);
			if($key == "timezone")
			{
				if($value >= 0)
					$value += 1;
				else
					$value = (($value * -1) + 13);
				$this->_fields["obs_timezone"] = $value;
			}
			if($key == "partners")
				$this->_fields["obs_partner_observatories"] = stripslashes($value);
			if($key == "comments")
				$this->_additionalInformation["general_comments"] = stripslashes($value);
			if($key == "oid")
				$obsId = stripslashes($value);
		}

		//OLD NA1 - instruments Table
		$query = "SELECT * FROM instruments WHERE oid=" . $obsId;
      	$result = self::$dbOldObs->query($query);
      	/** @todo möglichen Fehler (leeres Resultat) besser abfangen */
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
      		//or die("<br>Error: No associated Instruments existing!</b>");
      	mysqli_free_result($result);

      	$maxTelescopeNumber = 0;
      	if ($res != NULL)
      	foreach ($res as $key => $value)
		{
			$counter = 0;
			if($key == "instrument")
			{
				$str = explode("<br>", $value);
				foreach($str as $strValue)
				{
					$this->_telescopes["telescope_name"][] = stripslashes($strValue);
					$counter++;
				}
			}
			if($key == "type")
			{
				$str = explode("<br>", $value);
				foreach($str as $strValue)
				{
					$this->_telescopes["comments"][] = "TelType: " . stripslashes($strValue) . LF;
					$counter++;
				}
			}
			if($key == "diameter")
			{
				$str = explode("<br>", $value);
				foreach($str as $strValue)
				{
					$this->_telescopes["diameter_m"][] = floatval($strValue);
					$counter++;
				}
			}
			if($key == "focallength")
			{
				$str = explode("<br>", $value);
				foreach($str as $strValue)
				{
					$this->_telescopes["focallength_m"][] = stripslashes($strValue);
					$counter++;
				}
			}

			if($counter > $maxTelescopeNumber)
				$maxTelescopeNumber = $counter;
		}
		while($maxTelescopeNumber--)
			$this->_hasMany["telescopes"][] = ""; //FIXMEE
			
		//OLD NA1 - extrainstruments Table
		$query = "SELECT * FROM extrainstruments WHERE oid=" . $obsId;
      	$result = self::$dbOldObs->query($query);
      	/** @todo möglichen Fehler (leeres Resultat) besser abfangen */
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
      		//or die("<br>Error: No associated extra Instruments existing!</b>");
      	mysqli_free_result($result);

      	foreach ($res as $key => $value)
		{
			if($key == "furthurcommentsins")
			{
				if(!empty($strValue))
					$this->_telescopes["comments"][0] .=  stripslashes($strValue) . LF;
			}
				
			if($key == "additionalcommentsins")
				$this->_additionalInformation["additional_instruments"] = stripslashes($value);

			if($key == "arraydesc")
				$this->_additionalInformation["array_description"] = stripslashes($value);

			if($key == "backenddesc")
				$this->_additionalInformation["backend_description"] = stripslashes($value);
		}

		//OLD NA1 - contact Table
		$query = "SELECT * FROM contact WHERE oid=" . $obsId;
      	$result = self::$dbOldObs->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
      		//or die("<br>Error: No associated Contacts existing!</b>");
      	mysqli_free_result($result);

      	foreach ($res as $key => $value)
		{
			if($key == "FurthurContact")
				$this->_additionalInformation["further_contacts"] = stripslashes($value);

			if($key == "contactdata")
			{
				$this->_hiddenFields["address"] = $value;
				$this->_hiddenFields["further_contacts"] = $value;
//				$this->_hiddenFields["city"] = $value;
			}

			if($key == "emailaddress")
				$this->_hiddenFields["email"] = $value;

			if($key == "phonenumber")
				$this->_hiddenFields["phone"] = $value;

//			if($key == "postalcode")
//				$this->_hiddenFields["zip_code"] = $value;

			if($key == "url")
				$this->_hiddenFields["web_address"] = $value;

			if($key == "sc")
				$this->_hiddenFields["scientific_contacts"] = $value;

			if($key == "gc")
			{
				$this->_hiddenFields["latitude"] = $value;
				$this->_hiddenFields["longitude"] = $value;
			}
		}

		//OLD NA1 - areaofresearch Table
		$query = "SELECT * FROM areasofresearch WHERE oid=" . $obsId;
      	$result = self::$dbOldObs->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
      		//or die("<br>Error: No associated Areas of Interest existing!</b>");
      	mysqli_free_result($result);

      	foreach($res as $key => $value)
      	{
			if($key == "keyresearch")
				$this->_additionalInformation["research_comments"] = stripslashes($value) . LF;

			if($key == "extraresearch")
				$this->_additionalInformation["research_comments"] .= stripslashes($value) . LF;

			if($key == "comments")
				$this->_additionalInformation["research_comments"] .= stripslashes($value);
      	}

		//OLD NA1 - hiddenfields Table
		$query = "SELECT * FROM hiddenfields WHERE oid=" . $obsId;
      	$result = self::$dbOldObs->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No associated Hidden Fields existing!</b>");
      	mysqli_free_result($result);

      	foreach($res as $key => $value)
      	{
			if($key == "Contact")
				$this->_additionalInformation["further_contacts"] = stripslashes($value) . LF . $this->_additionalInformation["further_contacts"];

			if($key == "email")
				$this->_additionalInformation["further_contacts"] .= stripslashes($value) . LF;

			if($key == "phone")
				if(isset($this->_fields["obs_phone"]))
					$this->_additionalInformation["further_contacts"] .= "Phone: " . stripslashes($value) . LF;
				else
					$this->_fields["obs_phone"] = stripslashes($value);

			/** @todo this needs to be removed */
			if($key == "zip")
				$this->_fields["obs_address"] .= stripslashes($value);

			if($key == "url")
				if(isset($this->_fields["obs_web_address"]))
					$this->_additionalInformation["further_contacts"] .= "Url: " . stripslashes($value) . LF;
				else
					$this->_fields["obs_web_address"] = stripslashes($value);

			if($key == "sciconname")
				$this->_additionalInformation["further_contacts"] .= stripslashes($value) . " - ";
			if($key == "sciconcon")
				$this->_additionalInformation["further_contacts"] .= stripslashes($value) . LF;

			if($key == "latitude")
				$this->_additionalInformation["further_contacts"] .= "Latitude: " . stripslashes($value) . " - ";
			if($key == "longitude")
				$this->_additionalInformation["further_contacts"] .= "Longitude: " . stripslashes($value);
      	}

	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_resource()
   * @brief adds a new resource observatory
   * 
   * @param $save flag for save for later (approved=0 in any case)
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function add_resource($save = FALSE) {
		//convert GPS to FLOAT first
      	$latitude_float = $this->gpsToFloat($_POST["add_obs_latitude"]["prefix"],
                                                       $_POST["add_obs_latitude"]["degree"],
                                                       $_POST["add_obs_latitude"]["minutes"],
                                                       $_POST["add_obs_latitude"]["seconds"],
                                                       $_POST["add_obs_latitude"]["cent"]);

      	$longitude_float = $this->gpsToFloat($_POST["add_obs_longitude"]["prefix"],
                                                        $_POST["add_obs_longitude"]["degree"],
                                                        $_POST["add_obs_longitude"]["minutes"],
                                                        $_POST["add_obs_longitude"]["seconds"],
                                                        $_POST["add_obs_longitude"]["cent"]);
		
        /** @todo we need to get rid of user level stuff in DAO */
        // ------------- Questionnaire Start -------------
        if ($_SESSION["user_level"] >= 21)
        {
        	$approved = 1;
        	$saved_for_later = 0;
        }
        else
        {
        	$approved = 0;
        	$saved_for_later = 0;
        }
        // ------------- Questionnaire End ---------------
        
        // SAVE FOR LATER OPTION (for any user level)
        if($save == TRUE)
        {
        	$approved = 0;
        	$saved_for_later = 1;
        }
        	
		$query = "INSERT INTO observatories (" .
  			"`id`,`name`, `iau_code`, `founded`,`institution`,`web_address`,`address`," .
  			"`country_id`,`phone`,`email`,`latitude`,`longitude`,`approx_position`," .
			"`sealevel_m`,`precipitation`,`clear_nights`,`timezone`," .
			"`observatory_status`," .
  			"`partner_observatories`, `creation_date`, `user_id`, `approved`, `saved_for_later`, `last_saved_by`)" .
  			" VALUES (NULL,'" .
        	addslashes($_POST["add_obs_name"]) . "','" .
        	$_POST["add_obs_iau_code"] . "','" .
        	$_POST["add_obs_founded"] . "','" .
        	addslashes($_POST["add_obs_institution"]) . "','" .
        	addslashes($_POST["add_obs_web_address"]) . "','" .
        	addslashes($_POST["add_obs_address"]) . "','" .
        	$_POST["add_obs_country_id"] . "','" .
        	addslashes($_POST["add_obs_phone"]) . "','" .
        	addslashes($_POST["add_obs_email"]) . "','" .
        	addslashes($latitude_float) . "','" .
        	addslashes($longitude_float) . "','" .
        	addslashes($_POST["add_obs_position"]) . "','" .
        	addslashes($_POST["add_obs_sealevel"]) . "','" .
        	$_POST["add_obs_precip_id"] . "','" .
        	$_POST["add_obs_clearnights_id"] . "','" .
        	$_POST["add_obs_timezone_id"] . "','" .
        	addslashes($_POST["add_obs_status"]) . "','" .
        	addslashes($_POST["add_obs_partner"]) . "'," .
        	"NOW()" . ",'" .
			$_SESSION["user_id"] . "','" .   // Questionnaire
			$approved .	"','" .			     // Questionnaire
			$saved_for_later . "','" . 	     // Temporary Save
			$_SESSION["user_id"] .           // Who saved at last?
			"')";

        //print "Debug: " . $query;
        //nl();

		self::$db->query($query);
		$status = array("errno" => self::$db->errno(),
			"error" => self::$db->error(),
			"res_id" => self::$db->getLastInsertId(), 
			"res_name" => $_POST["add_obs_name"]);

		return $status;
	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn update_resource($res_id)
   * @brief updates an existing resource obs/spa
   *
   * @param $res_id ID of the resource we want to have
   * @param $save flag for save for later (approved=0 in any case)
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function update_resource($res_id, $save = FALSE) {
		//convert GPS to FLOAT first
		$latitude_float = $this->gpsToFloat($_POST["add_obs_latitude"]["prefix"],
                                                       $_POST["add_obs_latitude"]["degree"],
                                                       $_POST["add_obs_latitude"]["minutes"],
                                                       $_POST["add_obs_latitude"]["seconds"],
                                                       $_POST["add_obs_latitude"]["cent"]);

      	$longitude_float = $this->gpsToFloat($_POST["add_obs_longitude"]["prefix"],
                                                        $_POST["add_obs_longitude"]["degree"],
                                                        $_POST["add_obs_longitude"]["minutes"],
                                                        $_POST["add_obs_longitude"]["seconds"],
                                                        $_POST["add_obs_longitude"]["cent"]);

	    /** @todo we need to get rid of user level stuff in DAO */
        // ------------- Questionnaire Start -------------
        if ($_SESSION["user_level"] >= 21)
        {
        	$approved = 1;
        	$saved_for_later = 0;
        }
        else
        {
        	$approved = 0;
        	$saved_for_later = 0;
        }
        // ------------- Questionnaire End ---------------
        
        // SAVE FOR LATER OPTION (for any user level)
        if($save == TRUE)
        {
        	$approved = 0;
        	$saved_for_later = 1;
        }
        	
		$query = "UPDATE observatories SET " .
			//We get another POST VAR for the name if EDIT
	  		"name='" . addslashes($_POST["update_obs_name"]) . "'," .
			"iau_code='" . $_POST["add_obs_iau_code"] . "'," .
	  		"founded='" . $_POST["add_obs_founded"] . "'," .
	  		"institution='" . addslashes($_POST["add_obs_institution"]) . "'," .
	  		"web_address='" . addslashes($_POST["add_obs_web_address"]) . "'," .
	  		"address='" . addslashes($_POST["add_obs_address"]) . "'," .
	  		"country_id='" . $_POST["add_obs_country_id"] . "'," .
	  		"phone='" . addslashes($_POST["add_obs_phone"]) . "'," .
	  		"email='" .addslashes($_POST["add_obs_email"]) . "'," .
	  		"latitude='" . addslashes($latitude_float) . "'," .
	  		"longitude='" . addslashes($longitude_float) . "'," .
	  		"approx_position='" . addslashes($_POST["add_obs_position"]) . "'," .
	  		"sealevel_m='" . addslashes($_POST["add_obs_sealevel"]) . "'," .
	  		"precipitation='" . $_POST["add_obs_precip_id"] . "'," .
	  		"clear_nights='" . $_POST["add_obs_clearnights_id"] . "'," .
	  		"timezone='" . $_POST["add_obs_timezone_id"] . "'," .
	  		"observatory_status='" . addslashes($_POST["add_obs_status"]) . "'," .
	  		"partner_observatories='" . addslashes($_POST["add_obs_partner"]) . "'," .
			"modification_date=NOW()," .
			"user_id='" . $_POST["add_obs_user_id"] . "'," .
			"approved='" . $approved . "'," .
		    "saved_for_later='" . $saved_for_later . "'," .
			"last_saved_by='" . $_SESSION["user_id"] . "' " .
	  		"WHERE id=" . $res_id;
			
		// TO CHECK IF THE UPDATED ENTRY BELONGS TO MYSELF
		/** @todo what if we change the user? */
		if($_POST["add_obs_user_id"] == $_SESSION["user_id"])
			$is_my_entry = TRUE;
		else
			$is_my_entry = FALSE;
			
		self::$db->query($query);
		$status = array("errno" => self::$db->errno(),
			"error" => self::$db->error(),
			"res_id" => $res_id, 
			"res_name" => $_POST["update_obs_name"],
			"is_my_entry" => $is_my_entry,
			"user_id" => $_POST["add_obs_user_id"]);

		return $status;
	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn del_resource($resource_id)
   * @brief deletes an existing observatory
   *
   * @param $resource_id ID of the observatory we want to delete
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function del_resource($resource_id)
	{
		//DELETING instruments
		$query = "DELETE FROM instruments WHERE EXISTS " .
				 "(SELECT telescope_to_instruments.telescope_id FROM telescope_to_instruments, observatory_to_telescopes WHERE " .
				 "telescope_to_instruments.instrument_id = instruments.id AND " .
				 "observatory_to_telescopes.telescope_id = telescope_to_instruments.telescope_id AND " .
				 "observatory_to_telescopes.observatory_id = " . $resource_id . ");";
		self::$db->query($query);

		//DELETING scientific contacts
		$query = "DELETE FROM scientific_contacts WHERE EXISTS " .
				 "(SELECT observatory_to_scientific_contacts.observatory_id FROM observatory_to_scientific_contacts WHERE " .
				 "observatory_to_scientific_contacts.scientific_contact_id = scientific_contacts.id AND " .
				 "observatory_to_scientific_contacts.observatory_id = " . $resource_id . ");";
		self::$db->query($query);

		//DELETING telescopes
		$query = "DELETE FROM telescopes WHERE EXISTS " .
				 "(SELECT observatory_to_telescopes.observatory_id FROM observatory_to_telescopes WHERE " .
				 "observatory_to_telescopes.telescope_id = telescopes.id AND " .
				 "observatory_to_telescopes.observatory_id = " . $resource_id . ");";
		self::$db->query($query);

		//DELETING observatory
		$query = "DELETE FROM observatories WHERE id=" . $resource_id;
		self::$db->query($query);

		$status = array("errno" => self::$db->errno(),
			"error" => self::$db->error(),
			"resource_id" => $resource_id);

		return $status;
	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn del_old_resource($resource_id)
   * @brief deletes an existing observatory from OLD NA1 DB
   *
   * @param $resource_id ID of the observatory we want to delete
   *
   * @return $status mysql_status
   *
   * GLOBAL: $_POST array
   */
	public function del_old_resource($resource_id)
	{
		// Get oid of OLD NA1 Obs resource
		$query = "SELECT oid FROM maintable WHERE id=" . $resource_id;
      	$result = self::$dbOldObs->query($query);
      	$res = mysqli_fetch_array($result, MYSQLI_ASSOC)
      		or die("<br>Error: No such Resource existing!</b>");
      	mysqli_free_result($result);

      	foreach($res as $key => $value)
      		if($key == "oid")
      			$obsId = $value;

		// Delete areaofresearch Table entry
		$query = "DELETE FROM areasofresearch WHERE areasofresearch.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		// Delete contact Table entry
		$query = "DELETE FROM contact WHERE contact.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		// Delete extrainstruments Table entry
		$query = "DELETE FROM extrainstruments WHERE extrainstruments.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		// Delete hiddenfields Table entry
		$query = "DELETE FROM hiddenfields WHERE hiddenfields.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		// Delete instruments Table entry
		$query = "DELETE FROM instruments WHERE instruments.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		// Delete maintable Table entry
		$query = "DELETE FROM maintable WHERE maintable.oid=" . $obsId . ";";
		self::$dbOldObs->query($query);

		$status = array("errno" => self::$dbOldObs->errno(),
			"error" => self::$dbOldObs->error(),
			"resource_id" => $resource_id);

		return $status;
	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_obs_keys($res_id, $action)
   * @brief ADD/UPD/DEL OBSERVATORIES KEY REFERENCE TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to add SQL keys
   * @param $action ADD/UPDATE/DELETE/SAVE FOR LATER observatory
   * @param $add is it an add or edit operation?
   *
   * GLOBAL: $_POST array
   * 
   * @todo WE HAVE TO IMPROVE THIS PROCEDURE! (actions are located here!)
   *
   */
	public function add_obs_keys($res_id, $action, $add = TRUE)
  	{
  		//THIS IS FOR LATER SAVE
  		if(($action == "Save for Later") && ($add == TRUE))
  			$action = "Add Entry";
  		else if(($action == "Save for Later") && ($add == FALSE))
  			$action = "Update Entry";
  		
  		//------------------------------------------------------------
  		//ADD/UPD/DEL (observatory_to_scientific_contacts & scientific_contacts)
  		//called VIA EDIT
	  	if ($action == "Update Entry")
	  		$this->update_sci_cons($res_id);
	    //called VIA ADD/EDIT
		$this->add_sci_cons($res_id);

		//------------------------------------------------------------
		//ADD/UPD/DEL (hidden_fields)
		if ($action == "Update Entry")
	      	$this->update_hidden_fields($res_id);
	    //called VIA ADD
	    if ($action == "Add Entry")
	    	$this->add_hidden_fields($res_id);

	    //------------------------------------------------------------
	    //ADD/UPD/DEL (observatory_to_research_areas & research_areas)
	    //called via EDIT
	    if ($action == "Update Entry")
	      	$this->delete_res_areas($res_id);
	    //called VIA ADD/EDIT
	    $this->add_res_areas($res_id);

	    //------------------------------------------------------------
	    //ADD/UPD/DEL (observatory_to_targets)
	    //called via EDIT
	    if ($action == "Update Entry")
	      	$this->delete_targets($res_id);
	    //called VIA ADD/EDIT
	    $this->add_targets($res_id);

  		//------------------------------------------------------------
	    //ADD/UPD/DEL (observatories_to_telescopes & telescopes)
	    //called via EDIT
	    if ($action == "Update Entry")
			$this->delete_telescopes($res_id);
		//called VIA ADD/EDIT
		$this->add_telescopes($res_id);

	    //------------------------------------------------------------
	    //ADD/UPD/DEL (additional_information)
	   	//called via EDIT
	    if ($action == "Update Entry")
	      	$this->update_add_info($res_id);
	    //called VIA ADD
	    if ($action == "Add Entry")
	    	$this->add_add_info($res_id);
  	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn update_sci_cons($res_id)
   * @brief UPDATE OBSERVATORIES SCIENTIFIC CONTACTS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to update scientific contacts
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 3RD ORDER TABLE
   */
  	protected function update_sci_cons($res_id)
  	{
  		$query = "DELETE FROM observatory_to_scientific_contacts WHERE " .
	               "observatory_id=" . $res_id;
	    self::$db->query($query);

  		//PROOF IF THERE IS AN ARRAY!
  		if(is_array($_POST["add_obs_sci_con_ids"]))
			foreach ($_POST["add_obs_sci_con_ids"] as $key => $sci_con_id)
			{
				//intermediate solution for $sci_con_id=0;
				if ($sci_con_id == 0)
					break;

				// check if a name is written in the line
				if (!empty($_POST["add_obs_sci_con_name"][$key]))
				{

					$query = "INSERT INTO observatory_to_scientific_contacts VALUES (" . $res_id .
         	 			"," . $sci_con_id . ")";

					//DEBUG:
					//echo $query;
					//nl();

					self::$db->query($query);
					if (self::$db->errno() != 0)
  						print "<H4>Error updating observatory_to_scientific_contacts!</H4>" . LF;
					else
					{
  						$query = "UPDATE scientific_contacts SET " .
           					"name='". addslashes($_POST["add_obs_sci_con_name"][$key]) . "'," .
           					"email='" . addslashes($_POST["add_obs_sci_con_email"][$key]) . "'," .
           					"institution='" . addslashes($_POST["add_obs_sci_con_institution"][$key]) . "' " .
           					"WHERE id=" . $sci_con_id;

  						//SETTING THE POSTVAR TO empty string (for add_sci_cons)
  						$_POST["add_obs_sci_con_name"][$key] = "";

  						//DEBUG:
  						//echo $query;
  						//nl();

  						self::$db->query($query);
  						if (self::$db->errno() != 0)
    						print "<H4>Error updating scientific_contacts!</H4>" . LF;
					}
				}
				else //DELETE empty row scientific contacts
				{
  					$query = "DELETE FROM scientific_contacts WHERE id=" . $sci_con_id;
  					self::$db->query($query);
					if (self::$db->errno() != 0)
  						print "<H4>Error deleting entry in scientific_contacts!</H4>" . LF;
				}
			}
  	}

//-----------------------------------------------------------------------------------------------------------
  /**
   * @fn add_sci_cons($res_id)
   * @brief ADD OBSERVATORIES SCIENTIFIC CONTACTS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to add scientific contacts
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 3RD ORDER TABLE
   */
	protected function add_sci_cons($res_id)
	{
		//echo "DEBUG: SciConCount: " . count($_POST["add_obs_sci_con_name"]) . LF;
	    foreach($_POST["add_obs_sci_con_name"] as $key => $name)
		{
			// check if a name is written in the line
			if (!empty($_POST["add_obs_sci_con_name"][$key]))
			{
	        	$query = "INSERT INTO scientific_contacts VALUES (NULL,'" .
	               addslashes($_POST["add_obs_sci_con_name"][$key]) . "','" .
	               addslashes($_POST["add_obs_sci_con_email"][$key]) . "','" .
	               addslashes($_POST["add_obs_sci_con_institution"][$key]) . "')";

	       		//DEBUG:
  				//echo $query;
  				//nl();

	            self::$db->query($query);
			    if (self::$db->errno() != 0)
			          print "<H4>Error inserting scientific_contacts!</H4>" . LF;

			    $query = "INSERT INTO observatory_to_scientific_contacts VALUES (" . $res_id .
			             "," . self::$db->getLastInsertId() . ")";

			    self::$db->query($query);
			    if (self::$db->errno() != 0)
			          print "<H4>Error inserting observatory_to_scientific_contacts!</H4>" . LF;
			}
		}
	}

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn add_hidden_fields($res_id)
   * @brief ADD HIDDEN FIELDS TABLE ENTRY
   *
   * @param $res_id ID of observatory where we want to add hidden fields
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 1ST ORDER TABLE
   */
   protected function add_hidden_fields($res_id)
   {
		$query = "INSERT INTO hidden_fields VALUES (". $res_id  .",'" .
	    	checkbox_value("add_obs_hide_0") . "','" .
	    	checkbox_value("add_obs_hide_1") . "','" .
	    	checkbox_value("add_obs_hide_2") . "','" .
	    	checkbox_value("add_obs_hide_3") . "','" .
	    	checkbox_value("add_obs_hide_4") . "','" .
	    	checkbox_value("add_obs_hide_5") . "','" .
			checkbox_value("add_obs_hide_6") . "','" .
	        checkbox_value("add_obs_hide_7") . "')";

	    self::$db->query($query);
	    if (self::$db->errno() != 0)
	    	print "<H4>Error inserting hidden fields!</H4>" . LF;
   }

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn update_hidden_fields($res_id)
   * @brief UPDATE HIDDEN FIELDS TABLE ENTRY
   *
   * @param $res_id ID of observatory where we want to update hidden fields
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 1ST ORDER TABLE
   */
   protected function update_hidden_fields($res_id)
   {
		$query = "UPDATE hidden_fields SET " .
	  		"web_address='" . checkbox_value("add_obs_hide_0") . "'," .
	  		"address='" . checkbox_value("add_obs_hide_1") . "'," .
	  		"phone='" . checkbox_value("add_obs_hide_2") . "'," .
	  		"email='" . checkbox_value("add_obs_hide_3") . "'," .
	  		"latitude='" . checkbox_value("add_obs_hide_4") . "'," .
	  		"longitude='" . checkbox_value("add_obs_hide_5") . "'," .
	  		"scientific_contacts='" . checkbox_value("add_obs_hide_6") . "'," .
	  		"further_contacts='" . checkbox_value("add_obs_hide_7") . "'" .
	  		"WHERE id=" . $res_id;

	  	self::$db->query($query);
	    	if (self::$db->errno() != 0)
	    		print "<H4>Error updating hidden fields!</H4>" . LF;
   }

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn delete_res_areas($res_id)
   * @brief DELETE OBSERVATORIES RESEARCH AREAS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to delete research areas
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 2ND ORDER TABLE
   */
   protected function delete_res_areas($res_id)
   {
		$query = "DELETE FROM observatory_to_research_areas WHERE " .
			"observatory_id=" . $res_id;
	    self::$db->query($query);
   }

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn add_res_areas($res_id)
   * @brief ADD OBSERVATORIES RESEARCH AREAS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to add research areas
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 2ND ORDER TABLE
   */
   protected function add_res_areas($res_id)
   {
   		//adding new areas
   		if(isset($_POST["add_res_are"]))
   		{
   			//DEBUG:
   			//echo "TESTING: " . $_POST["add_res_are"][1] . "<br>";

   			foreach($_POST["add_res_are"] as $new_res_are)
   			{
   				//insert new area in research_areas
   				/** @todo check if the given names of new areas are existing */
   				$query = "INSERT INTO research_areas (" .
   				"`id`,`name`)". " VALUES (NULL, '" .
   				addslashes($new_res_are) . "')";

   				//DEBUG:
   				//echo "TESTING QUERY: " . $query . "<br>";

   				self::$db->query($query);
	      		if (self::$db->errno() != 0)
	        		print "<H4>Error inserting new entry in research_areas!</H4>" . LF;

   				//push new id into add_obs_res_are_ids
   				/** @todo we need to check if the array is existing or put validation in JS */
   				array_push($_POST["add_obs_res_are_ids"], self::$db->getLastInsertId());
   			}
   		}

   		foreach ($_POST["add_obs_res_are_ids"] as $res_are_id)
	    {
			//check if res id is not empty and 100000 (other)
	    	if(($res_are_id != '') && ($res_are_id != 100000))
	      	{
	      		$query = "INSERT INTO observatory_to_research_areas VALUES (" . $res_id .
	        	"," . $res_are_id . ")";

	      		//DEBUG:
	      		//echo "TESTING: " . $query . "<br>";

	     		self::$db->query($query);
	      		if (self::$db->errno() != 0)
	        		print "<H4>Error inserting in observatory_to_research_areas!</H4>" . LF;
	      	}
	    }
   }

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn delete_targets($res_id)
   * @brief DELETE OBSERVATORIES TARGETS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to delete targets
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 2ND ORDER TABLE
   */
   protected function delete_targets($res_id)
   {
		$query = "DELETE FROM observatory_to_targets WHERE " .
			"observatory_id=" . $res_id;
	    self::$db->query($query);
   }

//-----------------------------------------------------------------------------------------------------------
 /**
   * @fn add_targets($res_id)
   * @brief ADD OBSERVATORIES TARGETS TABLE ENTRIES
   *
   * @param $res_id ID of observatory where we want to add targets
   *
   * GLOBAL: $_POST array
   *
   * THIS IS A 2ND ORDER TABLE
   *
   * @todo adding new targets needed?
   */
   protected function add_targets($res_id)
   {
   		//if there is any entry given
   		if(isset($_POST["add_obs_target_ids"]))
   			foreach ($_POST["add_obs_target_ids"] as $target_id)
	    	{
				//if there is something choosen except first entry (explaination)
	    		if ($target_id != '')
				{
	    			$query = "INSERT INTO observatory_to_targets VALUES (" . $res_id .
	        			"," . $target_id . ")";

	      			//DEBUG:
	      			//echo "TESTING: " . $query . "<br>";

	     			self::$db->query($query);
	      			if (self::$db->errno() != 0)
	        			print "<H4>Error inserting in observatory_to_targets!</H4>" . LF;
				}
	    	}
   }

//-----------------------------------------------------------------------------------------------------------
/**
 * @fn delete_telescopes($res_id)
 * @brief DELETE OBSERVATORIES TELESCOPES TABLE ENTRIES
 *
 * @param $res_id ID of observatory where we want to update telescopes
 *
 * GLOBAL: $_POST array
 *
 * THIS IS A 3RD ORDER TABLE
 *
 * @todo implement INTELLIGENT DELETE like in update_sci_cons
 */
	protected function delete_telescopes($res_id)
	{
		//Telescopes
  		//PROOF IF THERE IS AN ARRAY!
  		if(isset($_POST["add_obs_telescope_ids"]))
			//foreach ($_POST["add_obs_instrument_ids"] as $instrument_id)
			foreach ($_POST["add_obs_telescope_ids"] as $tele_key => $telescope_id)
			{
				//check if an telescope type is choosen
				if (!empty($telescope_id))
				{
					//Instruments
  					$query = "DELETE FROM instruments WHERE id IN (" .
  						"SELECT instrument_id from telescope_to_instruments WHERE telescope_id=" . $telescope_id .")";

  					//DEBUG:
					//echo "INSTRUMENTS TABLE DELETE: " . $query . "<br>";

  					self::$db->query($query);
					if (self::$db->errno() != 0)
  						print "<H4>Error deleting entry in instruments!</H4>" . LF;

					//Telescopes
					$query = "DELETE FROM telescopes WHERE id=" . $telescope_id;

					//DEBUG:
					//echo "TELESCOPES TABLE DELETE: " . $query . "<br>";

  					self::$db->query($query);
					if (self::$db->errno() != 0)
  						print "<H4>Error deleting entry in telescopes!</H4>" . LF;
				}
			}
	}

//-----------------------------------------------------------------------------------------------------------
/**
 * @fn add_telescopes($res_id)
 * @brief ADD OBSERVATORIES TELESCOPE TABLE ENTRIES
 *
 * Loop through telescope type id array
 * the only input which needs to be given by user (without validation)
 *
 * @param $res_id ID of observatory where we want to add telescopes
 *
 * GLOBAL: $_POST array
 *
 * THIS IS A 3RD ORDER TABLE
 *
 * @todo implement INTELLIGENT UPDATE/ADD like in add_sci_cons
 */
	protected function add_telescopes($res_id)
	{
		//Telescopes
	    foreach($_POST["add_obs_telescope_type_id"] as $tele_key => $tele_type_id)
		{
			//check if an telescope type is choosen
			if (!empty($tele_type_id))
			{
				//new Telescope Type (only one!)
				if(!empty($_POST["add_telescope_type"][$tele_key]))
				{
					$query = "INSERT INTO telescope_types (" .
   					"`id`,`name`)". " VALUES (NULL, '" .
          			addslashes($_POST["add_telescope_type"][$tele_key]) . "')";

          			//DEBUG:
          			//echo "TELESCOPE TYPE: " . $query . "<br>";

          			self::$db->query($query);
	      			if (self::$db->errno() != 0)
	        			print "<H4>Error inserting new entry in telescope_types!</H4>" . LF;

	        		//overwrite POST var with new telescope type id
	        		$_POST["add_obs_telescope_type_id"][$tele_key] = self::$db->getLastInsertId();
				}

				//new Antenna Type (only one!)
				if(!empty($_POST["add_antenna_type"][$tele_key]))
				{
					$query = "INSERT INTO antenna_types (" .
   					"`id`,`antenna_type`)". " VALUES (NULL, '" .
          			addslashes($_POST["add_antenna_type"][$tele_key]) . "')";

          			//DEBUG:
          			//echo "ANTENNA TYPE: " . $query . "<br>";

          			self::$db->query($query);
	      			if (self::$db->errno() != 0)
	        			print "<H4>Error inserting new entry in antenna_types!</H4>" . LF;

	        		//overwrite POST var with new antenna type id
	        		$_POST["add_obs_antenna_type_id"][$tele_key] = self::$db->getLastInsertId();
				}
				
				//here we have to build up the wavelength ranges string
				$wavelength_ranges = $this->get_wavelength_ranges();
				$wavelength_string = "";
			 	foreach($wavelength_ranges['id'] as $key => $value)
			 	{
			 		//add name to string here if post-key isset!
			 		if(isset($_POST["add_obs_wavelength_{$key}"][$tele_key]))
			 		{
			 			//print $wavelength_ranges['acronym'][$key];
			 			//nl();
			 			$wavelength_string .= ($wavelength_ranges['acronym'][$key] . ", ");
			 		}
			 	}

				//insert new telescope
				$query = "INSERT INTO telescopes VALUES (NULL,'" .
				   addslashes($_POST["add_obs_telescope_name"][$tele_key]) . "','" .
	               $_POST["add_obs_telescope_type_id"][$tele_key] . "','" .
	               checkbox_value("add_obs_mobile_flag", $tele_key) . "','" .
	               $_POST["add_obs_telescope_elements"][$tele_key] . "','" .
	               $_POST["add_obs_diameter"][$tele_key] . "','" .
	               addslashes($_POST["add_obs_focallength"][$tele_key]) . "','" .
	               $_POST["add_obs_antenna_type_id"][$tele_key] . "','" .
				   //addslashes($_POST["add_obs_wavelength"][$tele_key]) . "','" .
				   addslashes($wavelength_string) . "','" .
				   $_POST["add_obs_wavelength_b"][$tele_key] . "','" .
				   $_POST["add_obs_wavelength_b_unit"][$tele_key] . "','" .
				   $_POST["add_obs_wavelength_e"][$tele_key] . "','" .
				   $_POST["add_obs_wavelength_e_unit"][$tele_key] . "','" .
				   addslashes($_POST["add_obs_telescope_comments"][$tele_key]) . "')";

				//DEBUG:
				//echo "TELESCOPES TABLE: " . $query . "<br>";

	            self::$db->query($query);
			    if (self::$db->errno() != 0)
			    	print "<H4>Error inserting telescopes!</H4>" . LF;

				//save telescope id for inserting instruments later
				$telescope_id = self::$db->getLastInsertId();

			    $query = "INSERT INTO observatory_to_telescopes VALUES (" . $res_id .
			    		"," . $telescope_id . ")";

			    //DEBUG:
			    //echo "OBSERVATORY_TO_TELESCOPES TABLE: " . $query . "<br>";

			    self::$db->query($query);
			    if (self::$db->errno() != 0)
			    	print "<H4>Error inserting observatory_to_telescopes!</H4>" . LF;

			    //Instruments
			    foreach($_POST["add_obs_instrument_type_id"][$tele_key] as $instr_key => $instr_type_id)
			    {
			    	//DEBUG:
			    	//echo "INSTRUMENT TYPE ID: " . $instr_type_id . "<br>";
			    	//check if an instrument type is choosen
			    	if(!empty($instr_type_id))
			    	{
			    		//new Instrument Type (only one!)
			    		if(!empty($_POST["add_instrument_type"][$tele_key][$instr_key]))
			    		{
							$query = "INSERT INTO instrument_types (" .
   							"`id`,`name`)". " VALUES (NULL, '" .
          					addslashes($_POST["add_instrument_type"][$tele_key][$instr_key]) . "')";

          					//DEBUG:
          					//echo "INSTRUMENT TYPE: " . $query . "<br>";

          					self::$db->query($query);
	      					if (self::$db->errno() != 0)
	        					print "<H4>Error inserting new entry in instrument_types!</H4>" . LF;

	        				//overwrite POST var with new instrument type id
	        				$_POST["add_obs_instrument_type_id"][$tele_key][$instr_key] = self::$db->getLastInsertId();
			    		}

			    		//insert new instrument to telescope
			    		$query = "INSERT INTO instruments VALUES (NULL,'" .
				   			addslashes($_POST["add_obs_instrument_name"][$tele_key][$instr_key]) . "','" .
	               			$_POST["add_obs_instrument_type_id"][$tele_key][$instr_key] . "','" .
	               			addslashes($_POST["add_obs_instrument_focal_position"][$tele_key][$instr_key]) . "','" .
	               			addslashes($_POST["add_obs_instrument_wavelength"][$tele_key][$instr_key]) . "','" .
				   			$_POST["add_obs_instrument_wavelength_b"][$tele_key][$instr_key] . "','" .
				   			$_POST["add_obs_instrument_wavelength_b_unit"][$tele_key][$instr_key] . "','" .
				   			$_POST["add_obs_instrument_wavelength_e"][$tele_key][$instr_key] . "','" .
				   			$_POST["add_obs_instrument_wavelength_e_unit"][$tele_key][$instr_key] . "','" .
	               			addslashes($_POST["add_obs_instrument_spatial_resolution"][$tele_key][$instr_key]) . "','" .
				   			addslashes($_POST["add_obs_instrument_spectral_resolution"][$tele_key][$instr_key]) . "','" .
				   			addslashes($_POST["add_obs_instrument_polarisation"][$tele_key][$instr_key]) . "','" .
				   			addslashes($_POST["add_obs_instrument_field_of_view"][$tele_key][$instr_key]) . "','" .
				   			$_POST["add_obs_instrument_max_frames"][$tele_key][$instr_key] . "','" .
				   			addslashes($_POST["add_obs_instrument_frame_size"][$tele_key][$instr_key]) . "','" .
				   			$_POST["add_obs_instrument_min_exposure"][$tele_key][$instr_key] . "','" .
				   			$_POST["add_obs_instrument_max_exposure"][$tele_key][$instr_key] . "','" .
				   			checkbox_value("add_obs_instrument_bw_chip", $tele_key, $instr_key) . "','" .
				   			addslashes($_POST["add_obs_instrument_chip_type"][$tele_key][$instr_key]) . "','" .
				   			addslashes($_POST["add_obs_instrument_comments"][$tele_key][$instr_key]) . "')";

				   		//DEBUG:
						//echo "INSTRUMENTS TABLE: " . $query . "<br>";

	            		self::$db->query($query);
			    		if (self::$db->errno() != 0)
			    			print "<H4>Error inserting instruments!</H4>" . LF;

						$query = "INSERT INTO telescope_to_instruments VALUES (" . $telescope_id .
			    			"," . self::$db->getLastInsertId() . ")";

						//DEBUG:
			    		//echo "TELESCOPE_TO_INSTRUMENTS TABLE: " . $query . "<br>";

			    		self::$db->query($query);
			    		if (self::$db->errno() != 0)
			    			print "<H4>Error inserting telescope_to_instruments!</H4>" . LF;
			    	}
			    }

			}
		}
	}

//-----------------------------------------------------------------------------------------------------------
/**
 * @fn add_add_info($res_id)
 * @brief ADD ADDITIONAL INFORMATION TABLE ENTRY
 *
 * @param $res_id ID of observatory where we want to add additional information
 *
 * GLOBAL: $_POST array
 *
 * THIS IS A 1ST ORDER TABLE
 */
  	protected function add_add_info($res_id)
  	{
		$query = "INSERT INTO additional_information VALUES (". $res_id  .",'" .
			addslashes($_POST["add_obs_fur_con"]) . "','" .
    		addslashes($_POST["add_obs_add_inst"]) . "','" .
    		addslashes($_POST["add_obs_array_desc"]) . "','" .
    		addslashes($_POST["add_obs_backend_desc"]) . "','" .
    		addslashes($_POST["add_obs_research_com"]) . "','" .
    		addslashes($_POST["add_obs_target_com"]) . "','" .
    		addslashes($_POST["add_obs_gen_com"]) . "','" .
    		addslashes($_POST["add_obs_feedback"]) . "')";

		//DEBUG:
  		//echo "ADD info: " . $query . "<br>";
    	self::$db->query($query);
    	if (self::$db->errno() != 0)
    		print "<H4>Error inserting additional information!</H4>" . LF;
  	}

//-----------------------------------------------------------------------------------------------------------
/**
 * @fn update_add_info($res_id)
 * @brief UPDATE ADDITIONAL INFORMATION TABLE ENTRY
 *
 * @param $res_id ID of observatory where we want to update additional information
 *
 * GLOBAL: $_POST array
 *
 * THIS IS A 1ST ORDER TABLE
 */
  	protected function update_add_info($res_id)
  	{
  		$query = "UPDATE additional_information SET " .
			"further_contacts='" . addslashes($_POST["add_obs_fur_con"]) . "'," .
			"additional_instruments='" . addslashes($_POST["add_obs_add_inst"]) . "'," .
			"array_description='" . addslashes($_POST["add_obs_array_desc"]) . "'," .
			"backend_description='" . addslashes($_POST["add_obs_backend_desc"]) . "'," .
			"research_comments='" . addslashes($_POST["add_obs_research_com"]) . "'," .
  			"target_comments='" . addslashes($_POST["add_obs_target_com"]) . "'," .
  			"general_comments='" . addslashes($_POST["add_obs_gen_com"]) . "'," .
			"feedback='" . addslashes($_POST["add_obs_feedback"]) . "'" .
				" WHERE id=" . $res_id;

		//DEBUG:
		//echo "UPDATE info: " . $query . "<br>";
		self::$db->query($query);
		if (self::$db->errno() != 0)
			print "<H4>Error updating additional information!</H4>" . LF;
  	}

//-----------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------
// HELPER METHODS
/**
 * gpsToFloat computes Float of GPS coords given in ($prefix ,$degree, $minutes, $seconds, $cent)
 * 
 * @return $float GPS values in float
 */
  	protected function gpsToFloat($prefix ,$degree, $minutes, $seconds, $cent)
  	{
  		$float = 0.0;

    	$float = abs($degree) + abs($minutes / 60) + abs($seconds / (60 * 60)) + abs($cent / (60 * 60 * 100));

  		if ($prefix == 'North')
  	  		$float *= 1;
  		else if ($prefix == 'South')
  	  		$float *= -1;
  		else if ($prefix == 'East')
  	  		$float *= 1;
  		else if ($prefix == 'West')
  	  		$float *= -1;
    	/** @todo set errno or warning */

  		//echo "gpsToFloat-DEBUG: " . $prefix . " , " . $degree . LF;
  		//echo "Float: " . $float . LF;

    	return $float;
  	}

//-----------------------------------------------------------------------------------------------------------
/**
 * floatToGps sets $_POST["add_obs_long/latitude"][...] vars according to $float
 *
 */
  	protected function floatToGps($LATorLON, $float)
  	{
  		if($float == NULL)
  			$float = 0.0;

  		$this->_fields["obs_$LATorLON"]["float"] = $float;

  		if ($LATorLON == "latitude")
  		{
  	  		if($float < 0)
        		$prefix = "South";
      		else
        		$prefix = "North";
    	}
  		else if ($LATorLON == "longitude")
  		{
  	  		if($float < 0)
        		$prefix = "West";
      		else
        		$prefix = "East";
  		}
  		else
  		{
  	  		//$_POST["add_obs_" . $LATorLON] = array();
  	  		/** @todo set errno or warning */
  		}

  		//echo "DEBUG-DB-float:" . $float;

    	$float = abs($float);
    	$deg = floor($float);
    	$min = floor(($float - $deg) * 60);
    	$sec = floor( ($float - $deg - ($min/60)) * 60 * 60 );
    	$cent = floor( ($float - $deg - ($min/60) - ($sec/(60 * 60))) * 60 * 60 * 100 );

  		$this->_fields["obs_$LATorLON"]["degree"] = $deg;
  		$this->_fields["obs_$LATorLON"]["minutes"] = $min;
  		$this->_fields["obs_$LATorLON"]["seconds"] = $sec;
  		$this->_fields["obs_$LATorLON"]["cent"] = $cent;
  		$this->_fields["obs_$LATorLON"]["prefix"] = $prefix;

  		//DEBUG:
  		//echo "TESTING: " . $this->_fields["obs_$LATorLON"]["degree"] . "<br>";

	  	//DEBUG:
	  	//echo $LATorLON . "-floatToGps()-DEGUG: Float" . $float . LF;
	  	//echo $this->_fields["obs_$LATorLON"]["prefix"] . " , " .  $this->_fields["obs_$LATorLON"]["degree"] . " , " . $this->_fields["obs_$LATorLON"]["minutes"]  . " , " .
	  	//     $this->_fields["obs_$LATorLON"]["seconds"] . " , " . $this->_fields["obs_$LATorLON"]["cent"] . LF;
  	}

}

?>
