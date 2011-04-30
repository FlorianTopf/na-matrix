<?php
/**
 * @file ObservatoryView.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo improve if clauses when we want to hide fields which are not given
 * @todo improve includes a bit
 * @todo empty tables (without tr), empty lists (without li), a href targets are NOT allowed with xhtml strict
 */

require_once ('../config.inc.php');
//require_once ('../lib/php/functions.php');
require_once ('../lib/php/orm/html.php');
include_once ('../lib/php/orm/DbConnector.php');
//require_once ('../models/Observatory.php');
require_once ('../lib/php/orm/ModelDAO.php');

//DB CONNECTION:
$link = new DbConnector();

$query = "SELECT name FROM observatories WHERE id=" . $_GET["id"];
$result = $link->query($query);
$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
mysqli_free_result($result);
$link->close();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
  <title>NA1-Matrix: <?php print $res["name"]  ?></title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
  <meta http-equiv="cache-control" content="no-cache, must-revalidate"/>
  <link rel="stylesheet" type="text/css" href="../css/style.css"/>
<!--    <script type="text/javascript" src="lib/js/jquery-1.4.2.min.js"></script>-->
<!--    <script type="text/javascript" src="lib/js/jquery.validate.min.js"></script>-->
<!--    <script type="text/javascript" src="js/functions.js"></script>-->
</head>

<body class='report'>

<?php

	//CREATES ACCESS CLASS TO OBSERVATORIES
  	//$_observatory = new ObservatoryDAO();
  	$_observatory = ModelDAO::getFromName("Observatory");
  	//GET OBSERVATORY
  	$_observatory->get_resource($_GET["id"]);

	//OBSERVATORY GENERAL:
  	print "<fieldset class='report'><legend><b>Observatory General:</b></legend>" . LF;
  	print "<p><b>Observatory name:&nbsp;</b>" .	$_observatory->get_field("obs_name") . "</p>" . LF;
  	if ($_observatory->get_field("obs_founded"))
  		print "<p><b>Year founded:&nbsp;</b>" . $_observatory->get_field("obs_founded") . "</p>" . LF;
  	if ($_observatory->get_field("obs_institution"))
  		print "<p><b>Institution:&nbsp;</b>" . $_observatory->get_field("obs_institution") . "</p>" . LF;
  	if($_observatory->get_hidden_field("web_address"))
  		print "<p><b>Web address:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>" . LF;
  	else if ($_observatory->get_field("obs_web_address"))
  		print "<p><b>Web address:&nbsp;</b><a href='" . $_observatory->get_field("obs_web_address") . "' target='_blank'>" .
  												   		$_observatory->get_field("obs_web_address") . "</a></p>" . LF;
  	if ($_observatory->get_field("obs_address"))
  		print "<p><b>Address:&nbsp;</b>" . ($_observatory->get_hidden_field("address") ?
  			  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_address")). "</p>" . LF;
  	if ($_observatory->get_hidden_field("zip_code"))
  		print "<p><b>ZIP code:&nbsp;</b>" . ($_observatory->get_hidden_field("zip_code") ?
  			  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_zip_code")) . "</p>" . LF;
  	if ($_observatory->get_hidden_field("city"))
  		print "<p><b>City:&nbsp;</b>" . ($_observatory->get_hidden_field("city") ?
  		 	  "<font color='#FF0000'>Not Displayed</font>" : $_observatory->get_field("obs_city")) . "</p>" . LF;

  	$countries = $_observatory->get_countries();
  	print "<p><b>Country:&nbsp;</b>" . $countries['name'][$_observatory->get_field("obs_country_id")] . "</p>" . LF;

  	if ($_observatory->get_hidden_field("phone"))
  		print "<p><b>Phone:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>" . LF;
  	else if ($_observatory->get_field("obs_phone"))
  		print "<p><b>Phone:&nbsp;</b>" . $_observatory->get_field("obs_phone") . "</p>" . LF;

  	if($_observatory->get_hidden_field("email"))
  		print "<p><b>Email:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>" . LF;
  	else if ($_observatory->get_field("obs_email"))
  		print "<p><b>Email:&nbsp;</b><a href='mailto:" . $_observatory->get_field("obs_email") . "'>" . $_observatory->get_field("obs_email") . "</a></p>" . LF;

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
  		print "<p><b>Latitude:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>";
  	else if (!$gps_are_null)
		print "<p><b>Latitude:&nbsp;</b>" . "<a href='http://toolserver.org/~geohack/geohack.php?pagename=" . $_observatory->get_field("obs_name") .
  										"&amp;params=" . $_observatory->get_field_array("obs_latitude", "float")  . $geohack_lat_postfix .
  								   		$_observatory->get_field_array("obs_longitude", "float") . $geohack_lon_postfix . "' target='_blank'>" .
  										$_observatory->get_field_array("obs_latitude", "prefix") . " " .
  		  								$_observatory->get_field_array("obs_latitude", "degree") . "&deg; ".
  		  								$_observatory->get_field_array("obs_latitude", "minutes"). "' " .
  		  								$_observatory->get_field_array("obs_latitude", "seconds"). "'' " .
  		  								$_observatory->get_field_array("obs_latitude", "cent")	 . "'''" . "</a></p>" . LF ;

  	if($_observatory->get_hidden_field("longitude"))
  		print "<p><b>Longitude:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>";
  	else if (!$gps_are_null)
  		print "<p><b>Longitude:&nbsp;</b>" . "<a href='http://toolserver.org/~geohack/geohack.php?pagename=" . $_observatory->get_field("obs_name") .
  										"&amp;params=" . $_observatory->get_field_array("obs_latitude", "float")  . $geohack_lat_postfix .
  								   		$_observatory->get_field_array("obs_longitude", "float") . $geohack_lon_postfix . "' target='_blank'>" .
  										$_observatory->get_field_array("obs_longitude", "prefix") . " " .
  		  								$_observatory->get_field_array("obs_longitude", "degree") . "&deg; ".
  		  								$_observatory->get_field_array("obs_longitude", "minutes"). "' " .
  		  								$_observatory->get_field_array("obs_longitude", "seconds"). "'' " .
  		  								$_observatory->get_field_array("obs_longitude", "cent")	 . "'''" . "</a></p>" . LF ;

	if ($_observatory->get_field("obs_approx_position"))
  		print "<p><b>Approximate position:&nbsp;</b>" . $_observatory->get_field("obs_approx_position") . "</p>" . LF;
  	if ($_observatory->get_field("obs_sealevel_m"))
  		print "<p><b>Sealevel:</b>&nbsp;" . $_observatory->get_field("obs_sealevel_m") . "&nbsp;[m]</p>" . LF;

  	$p_ranges = $_observatory->get_precipitation_ranges();
  	$p_range = array_search($_observatory->get_field("obs_precipitation"), $p_ranges['id']);
  	if ($p_ranges['range'][$p_range] != "---")
  		print "<p><b>Precipitation range:</b>&nbsp;" . $p_ranges['range'][$p_range] . "&nbsp;[mm/Y]</p>" . LF;

  	$c_ranges = $_observatory->get_clearnights_ranges();
  	$c_range = array_search($_observatory->get_field("obs_clear_nights"), $c_ranges['id']);
  	if ($c_ranges['range'][$c_range] != "---")
  		print "<p><b>Clear nights:</b>&nbsp;" . $c_ranges['range'][$c_range] . "&nbsp;[D]</p>" . LF;

  	$timezones = $_observatory->get_timezones();
  	$timezone = array_search($_observatory->get_field("obs_timezone"), $timezones['id']);
  	print "<p><b>Timezone:</b>&nbsp;" . $timezones['timezone'][$timezone] . "&nbsp;[GMT+/-]</p>" . LF;

	if ($_observatory->get_field("obs_observatory_status"))
		print "<p><b>Observatory Status:</b>&nbsp;" . $_observatory->get_field("obs_observatory_status") . "</p>" . LF;

	if ($_observatory->get_field("obs_partner_observatories"))
  		print "<p><b>Partner observatories:</b>&nbsp;" . $_observatory->get_field("obs_partner_observatories") . "</p>" . LF;
  	print "</fieldset>" . LF;

	//OBSERVATORY Scientific Contacts:
  	print "<fieldset class='report'><legend><b>Scientific Contacts:</b></legend>" . LF;
  	print "<table class='view'>" . LF;
  	if($_observatory->get_hidden_field("scientific_contacts"))
  		"<tr><td><font color='#FF0000'>Not Displayed</font></td></tr>";
  	else
  		if(is_array($_observatory->get_has_many("scientific_contacts", NULL)))
      		foreach($_observatory->get_has_many("scientific_contacts", NULL) as $key => $value)
      		{
				print "<tr>";
				print "<td><b>Name:</b>&nbsp;" . $_observatory->get_scientific_contact("sci_con_name", $key)  . "</td>";
				print "<td><b>Email:</b>&nbsp;<a href='mailto:" . $_observatory->get_scientific_contact("sci_con_email", $key) . "'>" .
				  					$_observatory->get_scientific_contact("sci_con_email", $key) . "</a></td>";
				print "<td><b>Institution:</b>&nbsp;" . $_observatory->get_scientific_contact("sci_con_institution", $key) . "</td>";
				print "</tr>";
      		}
    print "</table>";
  	print "</fieldset>" . LF;

  	//OBSERVATORY Research Areas:
  	print "<fieldset class='report'><legend><b>Research Areas:</b></legend><ul>" . LF;
	$research_areas = $_observatory->get_research_areas();
    foreach($research_areas['id'] as $key => $value)
    	if(is_array($_observatory->get_has_many("research_areas", NULL)))
        	if (in_array($value, $_observatory->get_has_many("research_areas", NULL)))
          		print "<li>" . $research_areas['name'][$key] . "</li>";
	print "</ul></fieldset>" . LF;

	//OBSERVATORY Targets:
	print "<fieldset class='report'><legend><b>Targets:</b></legend><ul>" . LF;
	$targets = $_observatory->get_targets();
    foreach($targets['id'] as $key => $value)
    	if(is_array($_observatory->get_has_many("targets", NULL)))
        	if (in_array($value, $_observatory->get_has_many("targets", NULL)))
          		print "<li>" . $targets['target_family'][$key] . " - " . $targets['target_name'][$key] . "</li>";
    print "</ul></fieldset>" . LF;

    //OBSERVATORY Telescopes:
    $telescope_types = $_observatory->get_telescope_types();
    $antenna_types = $_observatory->get_antenna_types();
    $instrument_types = $_observatory->get_instrument_types();
    $wavelength_units = $_observatory->get_wavelength_units();
    if(is_array($_observatory->get_has_many("telescopes", NULL)))
      	foreach($_observatory->get_has_many("telescopes", NULL) as $key => $telescope_id)
	    {
	    	print "<fieldset class='report'><legend><b>Telescope:&nbsp;" . $_observatory->get_telescope("telescope_name", $key) . "</b></legend>" . LF;
	    	print "<p><b>Telescope Name:&nbsp;</b>" . $_observatory->get_telescope("telescope_name", $key) . "</p>" . LF;
	    	//print "<p><b>Telescope Type:</b> " . $telescope_types['name'][$_observatory->get_telescope("telescope_type", $key) - 1] . "</p>" . LF;
	    	print "<p><b>Telescope Type:&nbsp;</b>" . $telescope_types['name'][$_observatory->get_telescope("telescope_type", $key)] . "</p>" . LF;
	    	if ($_observatory->get_telescope("telescope_elements", $key))
	    		print "<p><b>Telescope Elements:&nbsp;</b>" . $_observatory->get_telescope("telescope_elements", $key) . "</p>" . LF;
	    	if ($_observatory->get_telescope("diameter_m", $key))
	    		print "<p><b>Diameter:&nbsp;</b>" . clean_num($_observatory->get_telescope("diameter_m", $key)) . "&nbsp;[m]</p>" . LF;
	    	if ($_observatory->get_telescope("focallength_m", $key))
	    		print "<p><b>Focallength:&nbsp;</b>" . $_observatory->get_telescope("focallength_m", $key) . "&nbsp;[m]</p>" . LF;
	    	if ($antenna_types['antenna_type'][$_observatory->get_telescope("antenna_type", $key)] != "---")
	    		print "<p><b>Antenna Type:&nbsp;</b>" . $antenna_types['antenna_type'][$_observatory->get_telescope("antenna_type", $key)] . "</p>" . LF;
	    	if ($_observatory->get_telescope("wavelength_begin", $key))
	    		print "<p><b>Wavelength Begin:&nbsp;</b>" . clean_num($_observatory->get_telescope("wavelength_begin", $key)) . " " .
	    			  $wavelength_units['wavelength_unit'][$_observatory->get_telescope("wavelength_b_unit", $key)] . "</p>" . LF;
	    	if ($_observatory->get_telescope("wavelength_end", $key))
	    		print "<p><b>Wavelength End:&nbsp;</b>" . clean_num($_observatory->get_telescope("wavelength_end", $key)) . " " .
	    			  $wavelength_units['wavelength_unit'][$_observatory->get_telescope("wavelength_e_unit", $key)] . "</p>" . LF;
			if ($_observatory->get_telescope("comments", $key))
	    		print "<p><b>Telescope Comments:&nbsp;</b>" . nl2br($_observatory->get_telescope("comments", $key)) . "</p>" . LF;

	    	//OBSERVATORY Instruments:
	    	if(is_array($_observatory->get_has_many("instruments", $telescope_id)))
      			foreach($_observatory->get_has_many("instruments", $telescope_id) as $key2 => $instrument_id)
	    		{
	    			print "<fieldset><legend><b>Instrument:&nbsp;" . $_observatory->get_instrument("instrument_name", $telescope_id, $key2) . "</b></legend>" . LF;
	    			print "<p><b>Instrument Name:&nbsp;</b>" . $_observatory->get_instrument("instrument_name", $telescope_id, $key2) . "</p>" . LF;
//	    			print "<p><b>Instrument Type:&nbsp;</b>" . $instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2) - 1] . "</p>" . LF;
					print "<p><b>Instrument Type:&nbsp;</b>" . $instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2)] . "</p>" . LF;
	    			if ($_observatory->get_instrument("focal_position", $telescope_id, $key2))
						print "<p><b>Focal Position:&nbsp;</b>" . $_observatory->get_instrument("focal_position", $telescope_id, $key2) . "</p>" . LF;
					if ($_observatory->get_instrument("wavelength", $telescope_id, $key2))
	    				print "<p><b>Wavelength:&nbsp;</b>" . $_observatory->get_instrument("wavelength", $telescope_id, $key2) . "</p>" . LF;
	    			if ($_observatory->get_instrument("wavelength_begin", $telescope_id, $key2))
	    				print "<p><b>Wavelength Begin:&nbsp;</b>" . clean_num($_observatory->get_instrument("wavelength_begin", $telescope_id, $key2)) . " " .
	    					  //$wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $key2) - 1] . "</p>" . LF;
	    					  $wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $key2)] . "</p>" . LF;
	    			if ($_observatory->get_instrument("wavelength_end", $telescope_id, $key2))
	    				print "<p><b>Wavelength End:&nbsp;</b>" . clean_num($_observatory->get_instrument("wavelength_end", $telescope_id, $key2)) . " " .
	    					  //$wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $key2) - 1] . "</p>" . LF;
	    					  $wavelength_units['wavelength_unit'][$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $key2)] . "</p>" . LF;
	    			if ($_observatory->get_instrument("spatial_resolution", $telescope_id, $key2))
	    				print "<p><b>Spatial Resolution:&nbsp;</b>" . $_observatory->get_instrument("spatial_resolution", $telescope_id, $key2) . "</p>" . LF;
	    			if ($_observatory->get_instrument("spectral_resolution", $telescope_id, $key2))
	    				print "<p><b>Spectral Resolution:&nbsp;</b>" . $_observatory->get_instrument("spectral_resolution", $telescope_id, $key2) . "</p>" . LF;
	    			if ($_observatory->get_instrument("polarisation", $telescope_id, $key2))
	    				print "<p><b>Polarisation:&nbsp;</b>" . $_observatory->get_instrument("polarisation", $telescope_id, $key2) . "</p>" . LF;
	    			if ($_observatory->get_instrument("field_of_view", $telescope_id, $key2))
	    				print "<p><b>Field of View:&nbsp;</b>" . $_observatory->get_instrument("field_of_view", $telescope_id, $key2) . "</p>" . LF;

	    			if ($_observatory->get_instrument("max_frames_per_sec", $telescope_id, $key2))
	    				print "<p><b>MAX frames:&nbsp;</b>" . $_observatory->get_instrument("max_frames_per_sec", $telescope_id, $key2) . "&nbsp;[per second]</p>" . LF;
	    			if ($_observatory->get_instrument("frame_size", $telescope_id, $key2))
	    				print "<p><b>Frame size:&nbsp;</b>" . $_observatory->get_instrument("frame_size", $telescope_id, $key2) . "&nbsp;[pixel*pixel]</p>" . LF;
	    			if ($_observatory->get_instrument("max_exposure_time", $telescope_id, $key2))
	    				print "<p><b>MAX exposure time:&nbsp;</b>" . $_observatory->get_instrument("max_exposure_time", $telescope_id, $key2) . "&nbsp;[seconds]</p>" . LF;
	    			if ($_observatory->get_instrument("min_exposure_time‚", $telescope_id, $key2))
	    				print "<p><b>MIN exposure time:&nbsp;</b>" . $_observatory->get_instrument("min_exposure_time", $telescope_id, $key2) . "&nbsp;[seconds]</p>" . LF;
	    			/** distinction between B/W == 1 and Color chip == 0 */
	    			if($instrument_types['name'][$_observatory->get_instrument("instrument_type", $telescope_id, $key2)] == "Camera")
	    				if ($_observatory->get_instrument("color_bw_chip", $telescope_id, $key2) == 0)
	    					print "<p><b>B/W or Color chip:&nbsp;</b>Color chip</p>" . LF;
	    				else if ($_observatory->get_instrument("color_bw_chip", $telescope_id, $key2) == 1)
	    					print "<p><b>B/W or Color chip:&nbsp;</b>B/W chip</p>" . LF;
	    			if ($_observatory->get_instrument("ccd_chip_type", $telescope_id, $key2))
	    				print "<p><b>CCD chip type:&nbsp;</b>" . $_observatory->get_instrument("ccd_chip_type", $telescope_id, $key2) . "</p>" . LF;

	    			if ($_observatory->get_instrument("comments", $telescope_id, $key2))
	    				print "<p><b>Instrument Comments:&nbsp;</b>" . nl2br($_observatory->get_instrument("comments", $telescope_id, $key2)) . "</p>" . LF;
	    			print "</fieldset>" . LF;
	    		}
	    	print "</fieldset>" . LF;
	    }

	    //OBSERVATORY Additional Information
	    print "<fieldset class='report'><legend><b>Additional Information:</b></legend>" . LF;
	    if ($_observatory->get_hidden_field('further_contacts'))
	    	print "<p><b>Further contacts:&nbsp;</b><font color='#FF0000'>Not Displayed</font></p>" . LF;
	    else if ($_observatory->get_add_info('further_contacts'))
	    	print "<p><b>Further contacts:&nbsp;</b>" . nl2br($_observatory->get_add_info('further_contacts')) . "</p>" . LF;
		if ($_observatory->get_add_info('instrument_comments'))
	    	print "<p><b>Instrument comments:&nbsp;</b>" . nl2br($_observatory->get_add_info('instrument_comments')) . "</p>" . LF;
	    if ($_observatory->get_add_info('additional_instruments'))
	    	print "<p><b>Additional instruments:&nbsp;</b>" . nl2br($_observatory->get_add_info('additional_instruments')) . "</p>" . LF;
	    if ($_observatory->get_add_info('array_description'))
	    	print "<p><b>Array description:&nbsp;</b>" . nl2br($_observatory->get_add_info('array_description')) . "</p>" . LF;
	    if ($_observatory->get_add_info('backend_description'))
	    	print "<p><b>Backend description:&nbsp;</b>" . nl2br($_observatory->get_add_info('backend_description')) . "</p>" . LF;
	    if ($_observatory->get_add_info('research_comments'))
	    	print "<p><b>Research comments:&nbsp;</b>" . nl2br($_observatory->get_add_info('research_comments')) . "</p>" . LF;
	    if ($_observatory->get_add_info('general_comments'))
	    	print "<p><b>General comments:&nbsp;</b>" . nl2br($_observatory->get_add_info('general_comments')) . "</p>" . LF;
		print "</fieldset>" . LF;
  
?>

</body>
</html>