<?php
/**
 * @file SpacemissionCreateUpdate.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<div><input type='hidden' name='page' value='add'/>" . LF ;
print "<input type='hidden' name='add_res_id' value='{$resource_id}'/>" . LF ;
print "<input type='hidden' name='res_type' value='{$resource_type}'/></div>" . LF ;
//show_message();

print "<fieldset class='rfield'><legend>Space Mission General:</legend>" . LF;
print "<table class='create'>" . LF;

//Space mission name - MANDATORY / CHECK IF THE NAME ALREADY EXISTS!
/** @todo THIS IS A LITTLE HACK, WE DONT CHECK FOR EXISTING NAMES IF EDITING */
if($action == "edit")
	printInputTextRow("Space Mission Name", "update_spa_name", $_spacemission->get_field("spa_mission_name"), 80, NULL, NULL, TRUE);
else
	printInputTextRow("Space Mission Name", "add_spa_name", $_spacemission->get_field("spa_mission_name"), 80, NULL, NULL, TRUE);

//Mission agency - MANDATORY
$agencies = $_spacemission->get_agencies();
$options = array("<option value=''>Please choose...</option>");
printSelectListRowFromArray("Mission Agency", "add_spa_agency_id", $_spacemission->get_field("spa_mission_agency"),
	$agencies, array("acronym", "name"), NULL, TRUE, $options);

//Launch date - FORMAT: YYYY-MM-DD - MANDATORY
printInputTextRow("Launch Date", "add_spa_launch", $_spacemission->get_field("spa_launch_date"), 12, "[YYYY-MM-DD]", NULL, TRUE);

//Death date - FORMAT: YYYY-MM-DD
printInputTextRow("Mission End", "add_spa_death", $_spacemission->get_field("spa_death_date"), 12, "[YYYY-MM-DD]", NULL, FALSE);

//Web address
printInputTextRow("Web Address", "add_spa_web_address", $_spacemission->get_field("spa_web_address"), 80, "[http://...]", NULL, FALSE);

//Brief Description
printInputTextfieldRow("Brief Description", "add_spa_brief_desc", $_spacemission->get_field("spa_brief_description"), 80, 6);
print "</table></fieldset>" . LF;

//RESEARCH AREAS - MANDATORY
print "<fieldset class='rfield'><legend>Research Areas:</legend>" . LF;
print "<table id='research_areas' class='create'>" . LF;
$research_areas = $_spacemission->get_research_areas();
//$options = array("<option value=''>Please choose one or several by holding CTRL...</option>",
//"<option id='add_other_area' value='100000'>Add other Research Area</option>");
printBigSelectListFromArray("Research Areas", "add_spa_res_are_ids[]",
	//$_spacemission->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, $options);
	$_spacemission->get_has_many("research_areas"), $research_areas, "name");
printInputTextfieldRow("Research Comments", "add_spa_research_com", $_spacemission->get_field('research_comments'),
			65, 4, NULL, FALSE);
print "</table></fieldset>" . LF;
//ADD OTHER RESEARCH AREAS
if ($_SESSION["user_level"] >= 31)
{
	print "<fieldset class='rfield'><legend><b class='red'>Administration Tool</b></legend>" . LF;
	print "<div id='add_other_area' style='margin:10px 0'><a class='ui-state-default ui-corner-all hand' id='add_other_area' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
	print "<span class='ui-icon ui-icon-plus' style='position:absolute;top:4px;left:1px'></span>" ;
	print "Add new Research Area</a></div>";
	print "</fieldset>" . LF;
}

//TARGETS
/** @todo add other implementieren, aber mit eigenem feld! (siehe oben) */
print "<fieldset class='rfield'><legend>Targets:</legend>" . LF;
print "<table class='create'>" . LF;
$targets = $_spacemission->get_targets();
//$options = array("<option value=''>Please choose one or several by holding CTRL...</option>");
printBigSelectListFromArray("Targets", "add_spa_target_ids[]", $_spacemission->get_has_many("targets"),
	//$targets, "target_name", NULL, FALSE, $options);
	$targets, "target_name", NULL, FALSE);
printInputTextfieldRow("Target Comments", "add_spa_target_com", $_spacemission->get_field('target_comments'),
			65, 4, NULL, FALSE);
print "</table></fieldset>" . LF;

//SENSORS
//getting all necessary science goals only calling this once
//$science_goals = $_spacemission->get_science_goals();

if(!is_array($_spacemission->get_has_many("sensors")))
	$_spacemission->init_has_many("sensors");

if(is_array($_spacemission->get_has_many("sensors")))
{
	print "<div id='tabbed-sens'>"; /** add this to JS */
	print "<div style='margin:10px 5px'><a class='ui-state-default ui-corner-all add_sensor' href='' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
	print "<span class='ui-icon ui-icon-plus' style='position:absolute;top:4px;left:1px'></span>" ;
	print "Add new Sensor</a></div>";
	print "<ul>";
	foreach($_spacemission->get_has_many("sensors") as $sensor_count => $sensor_id)
	{
	
		if($_spacemission->get_sensor("sensor_name", $sensor_count))
		{	
			$sensor_name = explode(" - ", $_spacemission->get_sensor("sensor_name", $sensor_count));
			print "<li><a href='#sensor-{$sensor_count}'>" . $sensor_name[0] ."</a>";
		}
		else
			print "<li><a href='#sensor-{$sensor_count}'>Sensor " . ($sensor_count + 1) ."</a>";
			
		print " <span class='ui-icon ui-icon-close'>Remove Tab</span></li>";
	}
	print "</ul>";
	foreach($_spacemission->get_has_many("sensors") as $sensor_count => $sensor_id)
	{
		/** @todo refactor the two hidden fields */
      	//TRANSPORT THE OLD NUMBER OF SENSORS VIA POST
      	print "<input type='hidden' name='add_spa_sensor_ids[" . $sensor_count . "]' value='". $sensor_id . "'/>";
      	print "<div class='sensor' id='sensor-{$sensor_count}'>";
      	
      	print "<fieldset class='rfield'><legend>Sensor:</legend>" . LF;

      	print "<table class='create'>" . LF;

      	//Sensor Name:
      	/** @todo validate => MANDATORY, but we have a little problem here, you can leave the form empty! */
		printInputTextRow("Sensor Name", "add_spa_sen_name[{$sensor_count}]", $_spacemission->get_sensor("sensor_name", $sensor_count), 60);
      	//Sensor Type:
		printInputTextRow("Sensor Type", "add_spa_sen_type[{$sensor_count}]", $_spacemission->get_sensor("sensor_type", $sensor_count), 60, NULL, "sensor_type");
      	//Diameter:
		printInputTextRow("Diameter", "add_spa_sen_dia[{$sensor_count}]", $_spacemission->get_sensor("diameter_m", $sensor_count), 15, "[m]");
		//Wavelength:
		$wavelength_ranges = $_spacemission->get_wavelength_ranges();
		print "<tr>";
		printInputTitleCol("Wavelength Region");
		print "<td>";
		$ranges_array = explode(", ", $_spacemission->get_sensor("wavelength", $sensor_count));
		foreach($wavelength_ranges['id'] as $key => $value)
		{
			print "<b>{$wavelength_ranges['acronym'][$key]}</b>";
			if(in_array($wavelength_ranges['acronym'][$key], $ranges_array))
				printCheckBox("add_spa_sen_wavelength_{$key}[{$sensor_count}]", $wavelength_ranges['acronym'][$key]);
			else
				printCheckBox("add_spa_sen_wavelength_{$key}[{$sensor_count}]", false);
			ws(4);
			//just make a newline at the fourth checkbox
			if ($key == 4)
				nl();
		}
		print "</td>";
		print "</tr>";
      	//Range begin: @todo VALIDATION uses standard message, aufpassen hier dürfen nur 15 Stellen angegeben werden
		printInputTextRow("Range Begin", "add_spa_sen_range_beg[{$sensor_count}]", clean_num(number_format((float)$_spacemission->get_sensor("range_begin", $sensor_count), 15, '.', '')), 15, NULL, "number");
      	//Range end: @todo VALIDATION uses standard message, aufpassen hier dürfen nur 15 Stellen angegeben werden
		printInputTextRow("Range End", "add_spa_sen_range_end[{$sensor_count}]", clean_num(number_format((float)$_spacemission->get_sensor("range_end", $sensor_count), 15, '.', '')), 15, NULL, "number");
      	//Units:
		printInputTextRow("Units", "add_spa_sen_units[{$sensor_count}]", $_spacemission->get_sensor("units", $sensor_count), 15);
      	//Measured:
		printInputTextRow("Measured", "add_spa_sen_measured[{$sensor_count}]", $_spacemission->get_sensor("measured", $sensor_count), 60);
      	//Resolution:
		printInputTextRow("Resolution", "add_spa_sen_resolution[{$sensor_count}]", $_spacemission->get_sensor("resolution", $sensor_count), 25);
      	//Field of View:
		printInputTextRow("Field of View", "add_spa_sen_fov[{$sensor_count}]", $_spacemission->get_sensor("field_of_view", $sensor_count), 25, "[arcsec x arcsec] or [arcsec]");
        //Web address
		printInputTextRow("Web Address", "add_spa_sen_web[{$sensor_count}]", $_spacemission->get_sensor("web_address", $sensor_count), 60);
        //Sensor comments
		printInputTextfieldRow("Sensor Comments", "add_spa_sensor_com[{$sensor_count}]", $_spacemission->get_sensor("sensor_comments", $sensor_count), 60, 4);
 		print "</table>" . LF;

      	//Scientific Contacts
      	print "<fieldset class='rfield'><legend>Scientific Contacts:</legend>" . LF;
      	//print "<table class='create'>" . LF;
      	/** this table has two classes!! class='create' */
      	print "<table class='scientific_contacts create'>" . LF;
      	print "<tr><th></th><th class='ui-widget-header'>Name</th><th class='ui-widget-header'>Email</th><th class='ui-widget-header'>Institution</th></tr>";

   		if(!is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
			$_spacemission->init_has_many("scientific_contacts", $sensor_id);

   		if(is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
   			foreach($_spacemission->get_has_many("scientific_contacts", $sensor_id) as $contact_count => $contact_id)
   			{
				print "<tr>";
				printAddRemoveButton($contact_count, $_spacemission->get_has_many("scientific_contacts", $sensor_id), "contact", FALSE);

				printInputTextCol("add_spa_sci_con_name[{$sensor_count}][{$contact_count}]",
					$_spacemission->get_scientific_contact("name", $sensor_id, $contact_count), 30, "align='center'");
				printInputTextCol("add_spa_sci_con_email[{$sensor_count}][{$contact_count}]",
					$_spacemission->get_scientific_contact("email", $sensor_id, $contact_count), 30, "align='center'");
				printInputTextCol("add_spa_sci_con_institution[{$sensor_count}][{$contact_count}]",
					$_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count), 30, "align='center'");
            	//TRANSPORT THE OLD NUMBER OF SCIENTIFIC CONTACTS VIA POST
            	//"<input type='hidden' name='add_spa_sci_con_ids[" . $sensor_count . "][" . $contact_count . "]' value='". $contact_id . "'/>" .
				print "</tr>";
      		}
      	print "</table></fieldset>" . LF;
      	print "</fieldset>" . LF;
      	print "</div>" . LF;
	}
	print "</div>" . LF;
}

// Submit Button
//-----------------------------------------------------------------------------------------------------------
//printActionButton($action);
//Define the action buttons
print "<div class='actionbutton'>" . LF;
//IF ACTION IS ADD
if($action == "add")
	print "<button type='submit' name='push' value='Add Entry' class='submit'>Add Entry</button>" . LF;
//IF ACTION IS loadOldSpa
else if($action == "loadOldSpa")
{
   	print "<input type='hidden' name='is_old_res' value='1'>" . LF ;
   	print "<button type='submit' name='push' value='Add Entry' class='submit'>Add Entry</button>" . LF;
   	
   	if($_SESSION["user_level"] >= 31)
		print "&nbsp;&nbsp;&nbsp;&nbsp;<button type='submit' ". 
		"name='push' onclick='return show_confirm()' value='Delete Old Entry' class='submit'>Delete Old Entry</button>" . LF;
}
//IF ACTION IS EDIT
else if($action == "edit")
{
	print "<button type='submit' name='push' value='Update Entry' class='submit'>Update Entry</button>" . LF;
	
	if($_SESSION["user_level"] >= 31)
		print "&nbsp;&nbsp;&nbsp;&nbsp;<button type='submit' name='push' onclick='return show_confirm()' value='Delete Entry' " . 
		"class='submit'>Delete Entry</button>" . LF;
}
print "</div>" . LF;

?>