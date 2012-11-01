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

session_start(); 

require_once ('../config.inc.php');
//require_once ('../lib/php/functions.php');
require_once ('../lib/php/orm/html.php');
include_once ('../lib/php/orm/DbConnector.php');
//require_once ('../models/Spacemission.php');
require_once ('../lib/php/orm/ModelDAO.php');

//DB CONNECTION:
$link = new DbConnector('');

$query = "SELECT mission_name FROM space_missions WHERE id=" . $_GET["id"];
$result = $link->query($query);
$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
mysqli_free_result($result);
$link->close();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
  <title>NA1-Matrix: <?php print $res["mission_name"]  ?></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="cache-control" content="no-cache, must-revalidate"/>
  <link rel="stylesheet" type="text/css" href="../css/style.css"/>
<!--    <script type="text/javascript" src="lib/js/jquery-1.4.2.min.js"></script>-->
<!--    <script type="text/javascript" src="lib/js/jquery.validate.min.js"></script>-->
<!--    <script type="text/javascript" src="js/functions.js"></script>-->
</head>

<body class='report'>

<?php
	
     if (isset($_SESSION["user_level"]) && $_SESSION["user_level"] >= 31)
	 {
	     print "<fieldset class='report'><legend><b class='red'>Administration Tool</b></legend>" . LF;
	     print "<p><a title='Click to edit' class='hand' target='_blank' " .
              		"href='./../index.php?page=add&amp;action=edit&amp;id={$_GET["id"]}" .
              		"&amp;res_type=spa&amp;edit=1" .
              		"'>EDIT ENTRY</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	     print "<a title='Click to refresh' class='hand' href='javascript:location.reload(true);'>REFRESH PAGE</a></p>";
		 print "</fieldset>" . LF;
	 }         

  	//CREATES ACCESS CLASS TO SPACE MISSIONS
  	//$_spacemission = new SpaceMissionDAO();
  	$_spacemission = ModelDAO::getFromName("Spacemission");
  	//GET SPACE MISSION
    $_spacemission->get_resource($_GET["id"]);

    //SPACE MISSION GENERAL:
  	print "<fieldset class='report'><legend><b>Space Mission General:</b></legend>" . LF;
	print "<p><b>Space Mission name:&nbsp;</b>" .	$_spacemission->get_field("spa_mission_name") . "</p>" . LF;
	$agencies = $_spacemission->get_agencies();
	print "<p><b>Agency:</b>&nbsp;<a href='" . $agencies['web_address'][$_spacemission->get_field("spa_mission_agency")] .
		  "' target='_blank'>" . $agencies['acronym'][$_spacemission->get_field("spa_mission_agency")] . "</a></p>" . LF;
	//SPICE ID (see: http://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/naif_ids.html)
	if($_spacemission->get_field("spa_spice_id"))
		print "<p><b>SPICE ID:&nbsp;</b>" . $_spacemission->get_field("spa_spice_id") . "</p>" . LF;
	print "<p><b>Launch Date:&nbsp;</b>" . $_spacemission->get_field("spa_launch_date") . "&nbsp;[YYYY-MM-DD]</p>" . LF;
	if($_spacemission->get_field("spa_death_date"))
		print "<p><b>Mission End:&nbsp;</b>" . $_spacemission->get_field("spa_death_date") . "&nbsp;[YYYY-MM-DD]</p>" . LF;
	print "<p><b>Web address:&nbsp;</b><a href='" . $_spacemission->get_field("spa_web_address") . "' target='_blank'>" . $_spacemission->get_field("spa_web_address") . "</a></p>" . LF;
	print "<p><b>Brief description:&nbsp;</b>" . nl2br(autolink($_spacemission->get_field("spa_brief_description"))) . "</p>" . LF;
	print "</fieldset>" . LF;

	//Research Areas:
	print "<fieldset class='report'><legend><b>Space Mission Research Areas:</b></legend><ul>";
	$research_areas = $_spacemission->get_research_areas();
    foreach($research_areas['id'] as $key => $value)
    	if(is_array($_spacemission->get_has_many("research_areas", NULL)))
        	if (in_array($value, $_spacemission->get_has_many("research_areas", NULL)))
          		print "<li>" . $research_areas['name'][$key] . "</li>";
	print "</ul>" . LF;
	if ($_spacemission->get_field('research_comments'))
		print "<p><b>Research Comments:&nbsp;</b><br/>" . nl2br(autolink($_spacemission->get_field('research_comments'))) . "</p>" . LF;
	print "</fieldset>" . LF;

	//Targets:
	if(is_array($_spacemission->get_has_many("targets", NULL)))
	{
		print "<fieldset class='report'><legend><b>Space Mission Targets:</b></legend><ul>";
  		$targets = $_spacemission->get_targets();
    	foreach($targets['id'] as $key => $value)
        	if (in_array($value, $_spacemission->get_has_many("targets", NULL)))
        	//print "<li>" . $targets['target_family'][$key] . " - " . $targets['target_name'][$key] . "</li>" . LF;
        		print "<li>" . $targets['target_name'][$key] . "</li>" . LF;
		print "</ul>" . LF;
		if ($_spacemission->get_field('target_comments'))
			print "<p><b>Target Comments:&nbsp;</b><br/>" . nl2br(autolink($_spacemission->get_field('target_comments'))) . "</p>" . LF;
		print "</fieldset>" . LF;
	}

	//Sensors:
	if(is_array($_spacemission->get_has_many("sensors", NULL)))
		foreach($_spacemission->get_has_many("sensors", NULL) as $sensor_count => $sensor_id)
		{
			print "<fieldset class='report'><legend><b>Space Mission Sensor:&nbsp;" . $_spacemission->get_sensor("sensor_name", $sensor_count) . "</b></legend>";
			print "<p><b>Sensor Name:&nbsp;</b>" . $_spacemission->get_sensor("sensor_name", $sensor_count) . "</p>" . LF;
			print "<p><b>Sensor Type:&nbsp;</b>" . trim($_spacemission->get_sensor("sensor_type", $sensor_count), ", ") . "</p>" . LF;
			if($_spacemission->get_sensor("diameter_m", $sensor_count))
				print "<p><b>Diameter:&nbsp;</b>" . $_spacemission->get_sensor("diameter_m", $sensor_count) . "&nbsp;[m]</p>" . LF;
			if ($_spacemission->get_sensor("wavelength", $sensor_count))
	    		print "<p><b>Wavelength Region:&nbsp;</b>" . trim($_spacemission->get_sensor("wavelength", $sensor_count), ", ") . LF;
			if($_spacemission->get_sensor("range_begin", $sensor_count))
				print "<p><b>Range Begin:&nbsp;</b>" . $_spacemission->get_sensor("range_begin", $sensor_count) . "</p>" . LF;
			if($_spacemission->get_sensor("range_end", $sensor_count))
				print "<p><b>Range End:&nbsp;</b>" . $_spacemission->get_sensor("range_end", $sensor_count) . "</p>" . LF;
			if($_spacemission->get_sensor("units", $sensor_count))
				print "<p><b>Units:&nbsp;</b>" . $_spacemission->get_sensor("units", $sensor_count) . "</p>" . LF;
			if($_spacemission->get_sensor("measured", $sensor_count))
				print "<p><b>Measured:&nbsp;</b>" . $_spacemission->get_sensor("measured", $sensor_count) . "</p>" . LF;
			if($_spacemission->get_sensor("resolution", $sensor_count))
				print "<p><b>Resolution:&nbsp;</b>" . $_spacemission->get_sensor("resolution", $sensor_count) . "</p>" . LF;
			if($_spacemission->get_sensor("field_of_view", $sensor_count))
				print "<p><b>Field of View:&nbsp;</b>" . $_spacemission->get_sensor("field_of_view", $sensor_count) . "&nbsp;[arcsec x arcsec] or [arcsec]</p>" . LF;
			if($_spacemission->get_sensor("web_address", $sensor_count))
				print "<p><b>Web Address:&nbsp;</b><a href='" . $_spacemission->get_sensor("web_address", $sensor_count) .
			 	"' target='_blank'>" . $_spacemission->get_sensor("web_address", $sensor_count) . "</a></p>" . LF;
			if($_spacemission->get_sensor("sensor_comments", $sensor_count))
				print "<p><b>Sensor Comments:&nbsp;</b>" . nl2br(autolink($_spacemission->get_sensor("sensor_comments", $sensor_count))) . "</p>" . LF;

			//Scientific Contacts:
			if(is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
			{
				print "<fieldset><legend><b>Scientific Contacts:</b></legend>";
				print "<table class='view'>";
			
				foreach ($_spacemission->get_has_many("scientific_contacts", $sensor_id) as $contact_count => $contact_id)
				{
					print "<tr>";
					print "<td><b>Name:&nbsp;</b>" . $_spacemission->get_scientific_contact("name", $sensor_id, $contact_count) . "</td>";
					if($_spacemission->get_scientific_contact("email", $sensor_id, $contact_count))
						print "<td><b>Email:&nbsp;</b><a href='mailto:" . $_spacemission->get_scientific_contact("email", $sensor_id, $contact_count) . "'>" .
						  	$_spacemission->get_scientific_contact("email", $sensor_id, $contact_count) . "</a></td>";
					else
						print "<td>&nbsp;</td>";
					if($_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count))
						print "<td><b>Institution:&nbsp;</b>" . $_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count) . "</td>";
					else
						print "<td>&nbsp;</td>";
					print "</tr>";
				}
				print "</table>";
				print "</fieldset>";
			}
			print "</fieldset>";
		}

?>

</body>
</html>