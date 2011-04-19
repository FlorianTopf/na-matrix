<?php
/**
 * @file ObservatoryView.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo improve if clauses when we want to hide fields which are not given
 * @todo improve includes a bit
 */

require_once ('../config.inc.php');
require_once ('../lib/php/functions.php');
include_once ('../lib/php/orm/DbConnector.php');
require_once ('../models/Spacemission.php');

//DB CONNECTION:
$link = new DbConnector();

$query = "SELECT mission_name FROM space_missions WHERE id=" . $_GET["id"];
$result = $link->query($query);
$res = mysqli_fetch_array($result, MYSQLI_ASSOC);
mysqli_free_result($result);
$link->close();

?>


<HTML class='report'>
<HEAD>
  <TITLE>NA1-Matrix: <?php print $res["mission_name"]  ?></TITLE>
  <META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <META http-equiv="cache-control" content="no-cache, must-revalidate">
  <LINK rel="stylesheet" type="text/css" href="../css/style.css">
<!--  <SCRIPT src="../lib/js/jquery-1.4.2.min.js"></SCRIPT>-->
<!--  <SCRIPT src="../lib/js/jquery.validate.min.js"></SCRIPT>-->
<!--  <SCRIPT src="../js/functions.js"></SCRIPT>-->
</HEAD>

<BODY class='report'>

<?php 

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
		
?>