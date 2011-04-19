<?php
/**
 * @file show.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo improve if clauses when we want to hide fields which are not given
 * @todo improve includes a bit
 */

require_once("../inc/setup.php");
require_once("../inc/parameters.php");
require_once("../inc/functions.php");
require_once("../models/observatory.php");
require_once("../models/spacemission.php");

//DB CONNECTION:
$link = dbiSelect();

//CREATES ACCESS CLASSES TO THE MAIN RESOURCE TYPES
//$_observatory = new Observatory();
//$_spacemission = new SpaceMission();

//RES_NAME RETRIEVAL:
$name_type = "";
if ($_GET["res_type"] == "observatories")
	$name_type = "name";
elseif($_GET["res_type"] == "space_missions")
	$name_type = "mission_name";

$query = "SELECT " . $name_type . " FROM " . $_GET["res_type"] . " WHERE id=" . $_GET["id"];
$result = mysqli_query($link, $query);
$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
mysqli_free_result($result);
mysqli_close($link);

?>


<HTML class='report'>
<HEAD>
  <TITLE>NA1-Matrix: <?php print $res[$name_type]  ?></TITLE>
  <META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <META http-equiv="cache-control" content="no-cache, must-revalidate">
  <LINK rel="stylesheet" type="text/css" href="../inc/style.css">
  <SCRIPT src="../inc/jquery-1.4.2.min.js"></SCRIPT>
  <SCRIPT src="../inc/jquery.validate.min.js"></SCRIPT>
  <SCRIPT src="../inc/functions.js"></SCRIPT>
</HEAD>

<BODY class='report'>


<?php

  if ($_GET["res_type"] == "observatories")
  {
	//CREATES ACCESS CLASS TO OBSERVATORIES
  	$_observatory = new ObservatoryDAO();
  	//GET OBSERVATORY
  	$_observatory->get_resource($_GET["id"]);

	//OBSERVATORY GENERAL:
  	print "<FIELDSET class='report'><LEGEND><B>Observatory General:</B></LEGEND>" . LF;
  	print "<P><B>Observatory name:&nbsp;</B>" .	$_observatory->get_field("obs_name") . "</P>" . LF;
  	if ($_observatory->get_field("obs_founded"))
  		print "<P><B>Year founded:&nbsp;</B>" . $_observatory->get_field("obs_founded") . "</P>" . LF;
  	if ($_observatory->get_field("obs_institution"))
  		print "<P><B>Institution:&nbsp;</B>" . $_observatory->get_field("obs_institution") . "</P>" . LF;
  	if($_observatory->get_hidden_field("web_address"))
  		print "<P><B>Web address:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>" . LF;
  	else if ($_observatory->get_field("obs_web_address"))
  		print "<P><B>Web address:&nbsp;</B><A href='" . $_observatory->get_field("obs_web_address") . "' target='_blank'>" .
  												   		$_observatory->get_field("obs_web_address") . "</A></P>" . LF;
  	if ($_observatory->get_field("obs_address"))
  		print "<P><B>Address:&nbsp;</B>" . ($_observatory->get_hidden_field("address") ?
  			  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_address")). "</P>" . LF;
  	if ($_observatory->get_hidden_field("zip_code"))
  		print "<P><B>ZIP code:&nbsp;</B>" . ($_observatory->get_hidden_field("zip_code") ?
  			  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_zip_code")) . "</P>" . LF;
  	if ($_observatory->get_hidden_field("city"))
  		print "<P><B>City:&nbsp;</B>" . ($_observatory->get_hidden_field("city") ?
  		 	  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_city")) . "</P>" . LF;

  	$countries = $_observatory->get_countries();
  	print "<P><B>Country:&nbsp;</B>" . $countries['name'][$_observatory->get_field("obs_country_id")] . "</P>" . LF;

  	if ($_observatory->get_hidden_field("phone"))
  		print "<P><B>Phone:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>" . LF;
  	else if ($_observatory->get_field("obs_phone"))
  		print "<P><B>Phone:&nbsp;</B>" . $_observatory->get_field("obs_phone") . "</P>" . LF;

  	if($_observatory->get_hidden_field("email"))
  		print "<P><B>Email:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>" . LF;
  	else if ($_observatory->get_field("obs_email"))
  		print "<P><B>Email:&nbsp;</B><A href='mailto:" . $_observatory->get_field("obs_email") . "'>" . $_observatory->get_field("obs_email") . "</A></P>" . LF;

	//GeoHack Coordinate Postfixes:
	if($_observatory->get_field_array("obs_latitude", "float"))
		$geohack_lat_postfix = "_N_";
	else
		$geohack_lat_postfix = "_S_";
	if($_observatory->get_field_array("obs_longitude", "float"))
		$geohack_lon_postfix = "_E_";
	else
		$geohack_lon_postfix = "_W_";

	//GPS Coords are null?
	$gps_are_null = false;
	if (($_observatory->get_field_array("obs_latitude", "float") || $_observatory->get_field_array("obs_longitude", "float"))  == 0 )
		$gps_are_null = true;

  	if($_observatory->get_hidden_field("latitude"))
  		print "<P><B>Latitude:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>";
  	else if (!$gps_are_null)
		print "<P><B>Latitude:&nbsp;</B>" . "<A href='http://toolserver.org/~geohack/geohack.php?pagename=" . $_observatory->get_field("obs_name") .
  										"&params=" . $_observatory->get_field_array("obs_latitude", "float")  . $geohack_lat_postfix .
  								   		$_observatory->get_field_array("obs_longitude", "float") . $geohack_lon_postfix . "' target='_blank'>" .
  										$_observatory->get_field_array("obs_latitude", "prefix") . " " .
  		  								$_observatory->get_field_array("obs_latitude", "degree") . "&deg ".
  		  								$_observatory->get_field_array("obs_latitude", "minutes"). "' " .
  		  								$_observatory->get_field_array("obs_latitude", "seconds"). "'' " .
  		  								$_observatory->get_field_array("obs_latitude", "cent")	 . "'''" . "</A></P>" . LF ;

  	if($_observatory->get_hidden_field("longitude"))
  		print "<P><B>Longitude:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>";
  	else if (!$gps_are_null)
  		print "<P><B>Longitude:&nbsp;</B>" . "<A href='http://toolserver.org/~geohack/geohack.php?pagename=" . $_observatory->get_field("obs_name") .
  										"&params=" . $_observatory->get_field_array("obs_latitude", "float")  . $geohack_lat_postfix .
  								   		$_observatory->get_field_array("obs_longitude", "float") . $geohack_lon_postfix . "' target='_blank'>" .
  										$_observatory->get_field_array("obs_longitude", "prefix") . " " .
  		  								$_observatory->get_field_array("obs_longitude", "degree") . "&deg ".
  		  								$_observatory->get_field_array("obs_longitude", "minutes"). "' " .
  		  								$_observatory->get_field_array("obs_longitude", "seconds"). "'' " .
  		  								$_observatory->get_field_array("obs_longitude", "cent")	 . "'''" . "</A></P>" . LF ;

	if ($_observatory->get_field("obs_approx_position"))
  		print "<P><B>Approximate position:&nbsp;</B>" . $_observatory->get_field("obs_approx_position") . "</P>" . LF;
  	if ($_observatory->get_field("obs_sealevel_m"))
  		print "<P><B>Sealevel:</B>&nbsp;" . $_observatory->get_field("obs_sealevel_m") . "&nbsp;[m]</P>" . LF;

  	$p_ranges = $_observatory->get_precipitation_ranges();
  	$p_range = array_search($_observatory->get_field("obs_precipitation"), $p_ranges['id']);
  	if ($p_ranges['range'][$p_range] != "---")
  		print "<P><B>Precipitation range:</B>&nbsp;" . $p_ranges['range'][$p_range] . "&nbsp;[mm/Y]</P>" . LF;

  	$c_ranges = $_observatory->get_clearnights_ranges();
  	$c_range = array_search($_observatory->get_field("obs_clear_nights"), $c_ranges['id']);
  	if ($c_ranges['range'][$c_range] != "---")
  		print "<P><B>Clear nights:</B>&nbsp;" . $c_ranges['range'][$c_range] . "&nbsp;[D]</P>" . LF;

  	$timezones = $_observatory->get_timezones();
  	$timezone = array_search($_observatory->get_field("obs_timezone"), $timezones['id']);
  	print "<P><B>Timezone:</B>&nbsp;" . $timezones['timezone'][$timezone] . "&nbsp;[GMT+/-]</P>" . LF;

	if ($_observatory->get_field("obs_observatory_status"))
		print "<P><B>Observatory Status:</B>&nbsp;" . $_observatory->get_field("obs_observatory_status") . "</P>" . LF;

	if ($_observatory->get_field("obs_partner_observatories"))
  		print "<P><B>Partner observatories:</B>&nbsp;" . $_observatory->get_field("obs_partner_observatories") . "</P>" . LF;
  	print "</FIELDSET>" . LF;

	//OBSERVATORY Scientific Contacts:
  	print "<FIELDSET class='report'><LEGEND><B>Scientific Contacts:</B></LEGEND>" . LF;
  	print "<TABLE border='0' cellpadding='4' class='rtable' width='100%'>" . LF;
  	if($_observatory->get_hidden_field("scientific_contacts"))
  		"<TR><TD><font color='#FF0000'>Not Displayed</font></TD></TR>";
  	else
  		if(is_array($_observatory->get_has_many("scientific_contacts", NULL)))
      		foreach($_observatory->get_has_many("scientific_contacts", NULL) as $key => $value)
      		{
				print "<TR>";
				print "<TD><b>Name:</b>&nbsp;" . $_observatory->get_scientific_contact("sci_con_name", $key)  . "</TD>";
				print "<TD><b>Email:</b>&nbsp;<A href='mailto:" . $_observatory->get_scientific_contact("sci_con_email", $key) . "'>" .
				  					$_observatory->get_scientific_contact("sci_con_email", $key) . "</A></TD>";
				print "<TD><b>Institution:</b>&nbsp;" . $_observatory->get_scientific_contact("sci_con_institution", $key) . "</TD>";
				print "</TR>";
      		}
    print "</TABLE>";
  	print "</FIELDSET>" . LF;

  	//OBSERVATORY Research Areas:
  	print "<FIELDSET class='report'><LEGEND><B>Research Areas:</B></LEGEND><UL>" . LF;
	$research_areas = $_observatory->get_research_areas();
    foreach($research_areas['id'] as $key => $value)
    	if(is_array($_observatory->get_has_many("research_areas", NULL)))
        	if (in_array($value, $_observatory->get_has_many("research_areas", NULL)))
          		print "<li>" . $research_areas['name'][$key] . "</li>";
	print "</UL></FIELDSET>" . LF;

	//OBSERVATORY Targets:
	print "<FIELDSET class='report'><LEGEND><B>Targets:</B></LEGEND><UL>" . LF;
	$targets = $_observatory->get_targets();
    foreach($targets['id'] as $key => $value)
    	if(is_array($_observatory->get_has_many("targets", NULL)))
        	if (in_array($value, $_observatory->get_has_many("targets", NULL)))
          		print "<li>" . $targets['target_family'][$key] . " - " . $targets['target_name'][$key] . "</li>";
    print "</UL></FIELDSET>" . LF;

    //OBSERVATORY Telescopes:
    $telescope_types = $_observatory->get_telescope_types();
    $antenna_types = $_observatory->get_antenna_types();
    $instrument_types = $_observatory->get_instrument_types();
    $wavelength_units = $_observatory->get_wavelength_units();
    if(is_array($_observatory->get_has_many("telescopes", NULL)))
      	foreach($_observatory->get_has_many("telescopes", NULL) as $key => $telescope_id)
	    {
	    	print "<FIELDSET class='report'><LEGEND><B>Telescope:&nbsp;" . $_observatory->get_telescope("telescope_name", $key) . "</B></LEGEND>" . LF;
	    	print "<P><B>Telescope Name:&nbsp;</B>" . $_observatory->get_telescope("telescope_name", $key) . "</P>" . LF;
	    	//print "<P><B>Telescope Type:</B> " . $telescope_types['name'][$_observatory->get_telescope("telescope_type", $key) - 1] . "</P>" . LF;
	    	print "<P><B>Telescope Type:&nbsp;</B>" . $telescope_types['name'][$_observatory->get_telescope("telescope_type", $key)] . "</P>" . LF;
	    	if ($_observatory->get_telescope("telescope_elements", $key))
	    		print "<P><B>Telescope Elements:&nbsp;</B>" . $_observatory->get_telescope("telescope_elements", $key) . "</P>" . LF;
	    	if ($_observatory->get_telescope("diameter_m", $key))
	    		print "<P><B>Diameter:&nbsp;</B>" . clean_num($_observatory->get_telescope("diameter_m", $key)) . "&nbsp;[m]</P>" . LF;
	    	if ($_observatory->get_telescope("focallength_m", $key))
	    		print "<P><B>Focallength:&nbsp;</B>" . $_observatory->get_telescope("focallength_m", $key) . "&nbsp;[m]</P>" . LF;
	    	if ($antenna_types['antenna_type'][$_observatory->get_telescope("antenna_type", $key)] != "---")
	    		print "<P><B>Antenna Type:&nbsp;</B>" . $antenna_types['antenna_type'][$_observatory->get_telescope("antenna_type", $key)] . "</P>" . LF;
	    	if ($_observatory->get_telescope("wavelength_begin", $key))
	    		print "<P><B>Wavelength Begin:&nbsp;</B>" . clean_num($_observatory->get_telescope("wavelength_begin", $key)) . " " .
	    			  $wavelength_units['wavelength_unit'][$_observatory->get_telescope("wavelength_b_unit", $key)] . "</P>" . LF;
	    	if ($_observatory->get_telescope("wavelength_end", $key))
	    		print "<P><B>Wavelength End:&nbsp;</B>" . clean_num($_observatory->get_telescope("wavelength_end", $key)) . " " .
	    			  $wavelength_units['wavelength_unit'][$_observatory->get_telescope("wavelength_e_unit", $key)] . "</P>" . LF;
			if ($_observatory->get_telescope("comments", $key))
	    		print "<P><B>Telescope Comments:&nbsp;</B>" . $_observatory->get_telescope("comments", $key) . "</P>" . LF;

	    	//OBSERVATORY Instruments:
	    	if(is_array($_observatory->get_has_many("instruments", $telescope_id)))
      			foreach($_observatory->get_has_many("instruments", $telescope_id) as $key2 => $instrument_id)
	    		{
	    			print "<FIELDSET class='report'><LEGEND><B>Instrument:&nbsp;" . $_observatory->get_instrument("instrument_name", $telescope_id, $key2) . "</B></LEGEND>" . LF;
	    			print "<P><B>Instrument Name:&nbsp;</B>" . $_observatory->get_instrument("instrument_name", $telescope_id, $key2) . "</P>" . LF;
//	    			print "<P><B>Instrument Type:&nbsp;</B>" . $instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2) - 1] . "</P>" . LF;
					print "<P><B>Instrument Type:&nbsp;</B>" . $instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2)] . "</P>" . LF;
	    			if ($_observatory->get_instrument("focal_position", $telescope_id, $key2))
						print "<P><B>Focal Position:&nbsp;</B>" . $_observatory->get_instrument("focal_position", $telescope_id, $key2) . "</P>" . LF;
					if ($_observatory->get_instrument("wavelength", $telescope_id, $key2))
	    				print "<P><B>Wavelength:&nbsp;</B>" . $_observatory->get_instrument("wavelength", $telescope_id, $key2) . "</P>" . LF;
	    			if ($_observatory->get_instrument("wavelength_begin", $telescope_id, $key2))
	    				print "<P><B>Wavelength Begin:&nbsp;</B>" . clean_num($_observatory->get_instrument("wavelength_begin", $telescope_id, $key2)) . " " .
	    					  //$wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $key2) - 1] . "</P>" . LF;
	    					  $wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $key2)] . "</P>" . LF;
	    			if ($_observatory->get_instrument("wavelength_end", $telescope_id, $key2))
	    				print "<P><B>Wavelength End:&nbsp;</B>" . clean_num($_observatory->get_instrument("wavelength_end", $telescope_id, $key2)) . " " .
	    					  //$wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $key2) - 1] . "</P>" . LF;
	    					  $wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $key2)] . "</P>" . LF;
	    			if ($_observatory->get_instrument("spatial_resolution", $telescope_id, $key2))
	    				print "<P><B>Spatial Resolution:&nbsp;</B>" . $_observatory->get_instrument("spatial_resolution", $telescope_id, $key2) . "</P>" . LF;
	    			if ($_observatory->get_instrument("spectral_resolution", $telescope_id, $key2))
	    				print "<P><B>Spectral Resolution:&nbsp;</B>" . $_observatory->get_instrument("spectral_resolution", $telescope_id, $key2) . "</P>" . LF;
	    			if ($_observatory->get_instrument("polarisation", $telescope_id, $key2))
	    				print "<P><B>Polarisation:&nbsp;</B>" . $_observatory->get_instrument("polarisation", $telescope_id, $key2) . "</P>" . LF;
	    			if ($_observatory->get_instrument("field_of_view", $telescope_id, $key2))
	    				print "<P><B>Field of View:&nbsp;</B>" . $_observatory->get_instrument("field_of_view", $telescope_id, $key2) . "</P>" . LF;

	    			if ($_observatory->get_instrument("max_frames_per_sec", $telescope_id, $key2))
	    				print "<P><B>MAX frames:&nbsp;</B>" . $_observatory->get_instrument("max_frames_per_sec", $telescope_id, $key2) . "&nbsp;[per second]</P>" . LF;
	    			if ($_observatory->get_instrument("frame_size", $telescope_id, $key2))
	    				print "<P><B>Frame size:&nbsp;</B>" . $_observatory->get_instrument("frame_size", $telescope_id, $key2) . "&nbsp;[pixel*pixel]</P>" . LF;
	    			if ($_observatory->get_instrument("max_exposure_time", $telescope_id, $key2))
	    				print "<P><B>MAX exposure time:&nbsp;</B>" . $_observatory->get_instrument("max_exposure_time", $telescope_id, $key2) . "&nbsp;[seconds]</P>" . LF;
	    			if ($_observatory->get_instrument("min_exposure_time‚", $telescope_id, $key2))
	    				print "<P><B>MIN exposure time:&nbsp;</B>" . $_observatory->get_instrument("min_exposure_time", $telescope_id, $key2) . "&nbsp;[seconds]</P>" . LF;
	    			/** distinction between B/W == 1 and Color chip == 0 */
	    			if($instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2)] == "Camera")
	    				if ($_observatory->get_instrument("color_bw_chip", $telescope_id, $key2) == 0)
	    					print "<P><B>B/W or Color chip:&nbsp;</B>Color chip</P>" . LF;
	    				else if ($_observatory->get_instrument("color_bw_chip", $telescope_id, $key2) == 1)
	    					print "<P><B>B/W or Color chip:&nbsp;</B>B/W chip</P>" . LF;
	    			if ($_observatory->get_instrument("ccd_chip_type", $telescope_id, $key2))
	    				print "<P><B>CCD chip type:&nbsp;</B>" . $_observatory->get_instrument("ccd_chip_type", $telescope_id, $key2) . "</P>" . LF;

	    			if ($_observatory->get_instrument("comments", $telescope_id, $key2))
	    				print "<P><B>Instrument Comments:&nbsp;</B>" . $_observatory->get_instrument("comments", $telescope_id, $key2) . "</P>" . LF;
	    			print "</FIELDSET>" . LF;
	    		}
	    	print "</FIELDSET>" . LF;
	    }

	    //OBSERVATORY Additional Information
	    print "<FIELDSET class='report'><LEGEND><B>Additional Information:</B></LEGEND>" . LF;
	    if ($_observatory->get_hidden_field('further_contacts'))
	    	print "<P><B>Further contacts:&nbsp;</B><font color='#FF0000'>Not Displayed</font></P>" . LF;
	    else if ($_observatory->get_add_info('further_contacts'))
	    	print "<P><B>Further contacts:&nbsp;</B>" . $_observatory->get_add_info('further_contacts') . "</P>" . LF;
		if ($_observatory->get_add_info('instrument_comments'))
	    	print "<P><B>Instrument comments:&nbsp;</B>" . $_observatory->get_add_info('instrument_comments') . "</P>" . LF;
	    if ($_observatory->get_add_info('additional_instruments'))
	    	print "<P><B>Additional instruments:&nbsp;</B>" . $_observatory->get_add_info('additional_instruments') . "</P>" . LF;
	    if ($_observatory->get_add_info('array_description'))
	    	print "<P><B>Array description:&nbsp;</B>" . $_observatory->get_add_info('array_description') . "</P>" . LF;
	    if ($_observatory->get_add_info('backend_description'))
	    	print "<P><B>Backend description:&nbsp;</B>" . $_observatory->get_add_info('backend_description') . "</P>" . LF;
	    if ($_observatory->get_add_info('research_comments'))
	    	print "<P><B>Research comments:&nbsp;</B>" . $_observatory->get_add_info('research_comments') . "</P>" . LF;
	    if ($_observatory->get_add_info('general_comments'))
	    	print "<P><B>General comments:&nbsp;</B>" . $_observatory->get_add_info('general_comments') . "</P>" . LF;
		print "</FIELDSET>" . LF;

  }
  else if ($_GET["res_type"] == "space_missions")
  {
  	//CREATES ACCESS CLASS TO SPACE MISSIONS
  	$_spacemission = new SpaceMissionDAO();
  	//GET SPACE MISSION
    $_spacemission->get_resource($_GET["id"]);

    //SPACE MISSION GENERAL:
  	print "<FIELDSET class='report'><LEGEND><B>Space Mission General:</B></LEGEND>" . LF;
	print "<P><B>Space Mission name:&nbsp;</B>" .	$_spacemission->get_field("spa_mission_name") . "</P>" . LF;
	$agencies = $_spacemission->get_agencies();
	print "<P><B>Agency:</B>&nbsp;<A href='" . $agencies['web_address'][$_spacemission->get_field("spa_mission_agency")] .
		  "' target='_blank'>" . $agencies['acronym'][$_spacemission->get_field("spa_mission_agency")] . "</A></P>" . LF;
	print "<P><B>Launch Date:&nbsp;</B>" . $_spacemission->get_field("spa_launch_date") . "&nbsp;[YYYY-MM-DD]</P>" . LF;
	print "<P><B>Death Date:&nbsp;</B>" . $_spacemission->get_field("spa_death_date") . "&nbsp;[YYYY-MM-DD]</P>" . LF;
	print "<P><B>Web address:&nbsp;</B><A href='" . $_spacemission->get_field("spa_web_address") . "' target='_blank'>" . $_spacemission->get_field("spa_web_address") . "</A></P>" . LF;
	print "<P><B>Brief description:&nbsp;</B>" . nl2br($_spacemission->get_field("spa_brief_description")) . "</P>" . LF;
	print "</FIELDSET>" . LF;

	//Research Areas:
	print "<FIELDSET class='report'><LEGEND><B>Space Mission Research Areas:</B></LEGEND><UL>";
	$research_areas = $_spacemission->get_research_areas();
    foreach($research_areas['id'] as $key => $value)
    	if(is_array($_spacemission->get_has_many("research_areas", NULL)))
        	if (in_array($value, $_spacemission->get_has_many("research_areas", NULL)))
          		print "<li>" . $research_areas['name'][$key] . "</li>";
	print "</UL></FIELDSET>" . LF;

	//Targets:
	print "<FIELDSET class='report'><LEGEND><B>Space Mission Targets:</B></LEGEND> <UL>";
  	$targets = $_spacemission->get_targets();
    foreach($research_areas['id'] as $key => $value)
        if(is_array($_spacemission->get_has_many("targets", NULL)))
        	if (in_array($value, $_spacemission->get_has_many("targets", NULL)))
        	print "<li>" . $targets['target_family'][$key] . " - " . $targets['target_name'][$key] . "</li>" . LF;
	print "</UL></FIELDSET>" . LF;

	//Sensors:
	$science_goals = $_spacemission->get_science_goals();
	if(is_array($_spacemission->get_has_many("sensors", NULL)))
		foreach($_spacemission->get_has_many("sensors", NULL) as $sensor_count => $sensor_id)
		{
			print "<FIELDSET class='report'><LEGEND><B>Space Mission Sensor:&nbsp;" . $_spacemission->get_sensor("sensor_name", $sensor_count) . "</B></LEGEND>";
			print "<P><B>Sensor Name:&nbsp;</B>" . $_spacemission->get_sensor("sensor_name", $sensor_count) . "</P>" . LF;
			print "<P><B>Sensor Type:&nbsp;</B>" . $_spacemission->get_sensor("sensor_type", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("underlying", $sensor_count))
				print "<P><B>Underlying:&nbsp;</B>" . $_spacemission->get_sensor("underlying", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("range_begin", $sensor_count))
				print "<P><B>Range Begin:&nbsp;</B>" . $_spacemission->get_sensor("range_begin", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("range_end", $sensor_count))
				print "<P><B>Range End:&nbsp;</B>" . $_spacemission->get_sensor("range_end", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("units", $sensor_count))
				print "<P><B>Units:&nbsp;</B>" . $_spacemission->get_sensor("units", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("measured", $sensor_count))
				print "<P><B>Measured:&nbsp;</B>" . $_spacemission->get_sensor("measured", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("resolution", $sensor_count))
				print "<P><B>Resolution:&nbsp;</B>" . $_spacemission->get_sensor("resolution", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("field_of_view", $sensor_count))
				print "<P><B>Field of View:&nbsp;</B>" . $_spacemission->get_sensor("field_of_view", $sensor_count) . "</P>" . LF;
			if($_spacemission->get_sensor("web_address", $sensor_count))
				print "<P><B>Web Address:&nbsp;</B><A href='" . $_spacemission->get_sensor("web_address", $sensor_count) .
			 	"' target='_blank'>" . $_spacemission->get_sensor("web_address", $sensor_count) . "</A></P>" . LF;
			if($_spacemission->get_sensor("sensor_comments", $sensor_count))
				print "<P><B>Sensor Comments:&nbsp;</B>" . $_spacemission->get_sensor("sensor_comments", $sensor_count) . "</P>" . LF;

			//Science Goals:
//			print "<FIELDSET class='report'><LEGEND><B>Science Goals:</B></LEGEND> <UL>";
//			//if($_spacemission->get_science_goals($_POST["add_spa_sci_goal_ids"][$sensor_count]))
//			//	foreach ($_spacemission->get_science_goals($_POST["add_spa_sci_goal_ids"][$sensor_count]) as $key2 => $value2 )
//			//	{
//			//		print "<li>" . $value2 . "</li>";
//			//	}
//			foreach($science_goals['id'] as $key => $value)
//				if(is_array($_spacemission->get_has_many("science_goals", $sensor_id)))
//					if(in_array($value, $_spacemission->get_has_many("science_goals", $sensor_id)))
//						print "<li>" . $science_goals['name'][$key] . "</li>";
//			print "</UL></FIELDSET>" . LF;

			//Scientific Contacts:
			print "<FIELDSET class='report'><LEGEND><B>Scientific Contacts:</B></LEGEND>";
			print "<TABLE border='0' cellpadding='4' class='rtable' width='100%'>";
			if(is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
				foreach ($_spacemission->get_has_many("scientific_contacts", $sensor_id) as $contact_count => $contact_id)
				{
					print "<TR>";
					print "<TD><b>Name:&nbsp;</b>" . $_spacemission->get_scientific_contact("name", $sensor_id, $contact_count) . "</TD>";
					print "<TD><b>Email:&nbsp;</b><A href='mailto:" . $_spacemission->get_scientific_contact("email", $sensor_id, $contact_count) . "'>" .
						  $_spacemission->get_scientific_contact("email", $sensor_id, $contact_count) . "</TD>";
					print "<TD><b>Institution:&nbsp;</b>" . $_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count) . "</TD>";
					print "</TR>";
				}
			print "</TABLE>";
			print "</FIELDSET></FIELDSET>";
		}
  }

?>

</BODY>
</HTML>
