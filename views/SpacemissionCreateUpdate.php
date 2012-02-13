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
printInputTextfieldRow("Brief Description", "add_spa_brief_desc", $_spacemission->get_field("spa_brief_description"), 65);
print "</table></fieldset>" . LF;

//RESEARCH AREAS - MANDATORY
print "<fieldset class='rfield'><legend>Research Areas:</legend>" . LF;
print "<table id='research_areas' class='create'>" . LF;
$research_areas = $_spacemission->get_research_areas();
$options = array("<option value=''>Please choose one or several by holding CTRL...</option>",
"<option id='add_other_area' value='100000'>Add other Research Area</option>");
printBigSelectListFromArray("Research Areas", "add_spa_res_are_ids[]",
	$_spacemission->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, $options);
print "</table></fieldset>" . LF;

//TARGETS - MANDATORY
/** @todo add other targets */
print "<fieldset class='rfield'><legend>Targets:</legend>" . LF;
print "<table class='create'>" . LF;
$targets = $_spacemission->get_targets();
$options = array("<option value=''>Please choose one or several by holding CTRL...</option>");
printBigSelectListFromArray("Targets", "add_spa_target_ids[]", $_spacemission->get_has_many("targets"),
	$targets, "target_name", NULL, FALSE, $options);
print "</table></fieldset>" . LF;

//SENSORS
//getting all necessary science goals only calling this once
$science_goals = $_spacemission->get_science_goals();

if(!is_array($_spacemission->get_has_many("sensors")))
	$_spacemission->init_has_many("sensors");

if(is_array($_spacemission->get_has_many("sensors")))
	foreach($_spacemission->get_has_many("sensors") as $sensor_count => $sensor_id)
	{
		/** @todo refactor the two hidden fields */
      	//TRANSPORT THE OLD NUMBER OF SENSORS VIA POST
      	print "<input type='hidden' name='add_spa_sensor_ids[" . $sensor_count . "]' value='". $sensor_id . "'/>";
      	print "<fieldset class='rfield'><legend>Sensor:</legend>" . LF;

		printAddRemoveButton($sensor_count, $_spacemission->get_has_many("sensors"), "sensor");

      	print "<table class='create'>" . LF;
       	/** @todo refactor the two hidden fields */
      	/** @todo make the same approach as with telescope count */
      	//TRANSPORT THE NUMBER OF SENSORS FOR JQUERY
      	print "<tr><td></td><td><input type='hidden' name='sensors' class='sensors' value='". count($_spacemission->get_has_many("sensors", NULL)) . "'/></td></tr>";

      	//Sensor Name:
      	/** @todo validate => MANDATORY, but we have a little problem here, you can leave the form empty! */
		printInputTextRow("Sensor Name", "add_spa_sen_name[{$sensor_count}]", $_spacemission->get_sensor("sensor_name", $sensor_count));
      	//Sensor Type:
		printInputTextRow("Sensor Type", "add_spa_sen_type[{$sensor_count}]", $_spacemission->get_sensor("sensor_type", $sensor_count));
      	//Underlying Instrumentation:
		printInputTextRow("Underlying Instrumentation", "add_spa_sen_under[{$sensor_count}]", $_spacemission->get_sensor("underlying", $sensor_count));
      	//Range begin: VALIDATION uses standard message
		printInputTextRow("Range Begin", "add_spa_sen_range_beg[{$sensor_count}]", $_spacemission->get_sensor("range_begin", $sensor_count), 10, NULL, "number");
      	//Range end: VALIDATION uses standard message
		printInputTextRow("Range End", "add_spa_sen_range_end[{$sensor_count}]", $_spacemission->get_sensor("range_end", $sensor_count), 10, NULL, "number");
      	//Units:
		printInputTextRow("Units", "add_spa_sen_units[{$sensor_count}]", $_spacemission->get_sensor("units", $sensor_count), 30);
      	//Measured:
		printInputTextRow("Measured", "add_spa_sen_measured[{$sensor_count}]", $_spacemission->get_sensor("measured", $sensor_count), 60);
      	//Resolution:
		printInputTextRow("Resolution", "add_spa_sen_resolution[{$sensor_count}]", $_spacemission->get_sensor("resolution", $sensor_count), 60);
      	//Field of View:
		printInputTextRow("Field of View", "add_spa_sen_fov[{$sensor_count}]", $_spacemission->get_sensor("field_of_view", $sensor_count), 60);
        //Web address
		printInputTextRow("Web Address", "add_spa_sen_web[{$sensor_count}]", $_spacemission->get_sensor("web_address", $sensor_count));
        //Sensor comments
		printInputTextfieldRow("Sensor Comments", "add_spa_sensor_com[{$sensor_count}]", $_spacemission->get_sensor("sensor_comments", $sensor_count), 65);
 		print "</table>" . LF;

		//Science Goals - COMMENTED ATM BECAUSE STILL IN DISCUSSION
//      		print "<fieldset class='rfield'><legend>Science Goals:</legend>" . LF;
      			/** this table has two classes!! class='create' */
//      		print "<table class='science_goals create'>" . LF;
//      		print "<tr><td align='left' valign='middle' width='150px'>" .
//            	  "<b class='red'>*</b><b>&nbsp;Science Goals:</b></td>";
//      		//print "<td align='left'><select name='add_spa_sci_goal_ids[]' id='add_spa_sci_goal_ids[]'" .
//      		//print "<td align='left'><select name='add_spa_sci_goal_ids[" . $sensor_count . "][]' id='add_spa_sci_goal_ids'" .
//      		print "<td align='left'><select name='add_spa_sci_goal_ids[" . $sensor_count . "][]' " .
//      			  "multiple='multiple' size='6'>" . LF;
//      		print "<option value=''>Please choose one or several by holding CTRL...</option>";
//      		print "<option class='add_other_goal' value='100000'>Add other Science Goal</option>";
//			foreach($science_goals['id'] as $key => $value)
//			{
//				print "<option value='" . $value . "'";
//        		if(is_array($_spacemission->get_has_many("science_goals", $sensor_id)))
//        			if (in_array($value, $_spacemission->get_has_many("science_goals", $sensor_id)))
//          				print " selected";
//        		print ">" . $science_goals['name'][$key] . "</option>" . LF;
//			}
//      		print "</select></td></tr>" . LF;
//      		print "</table></fieldset>" . LF;

      	//Scientific Contacts
      	print "<fieldset class='rfield'><legend>Scientific Contacts:</legend>" . LF;
      	//print "<table class='create'>" . LF;
      	/** this table has two classes!! class='create' */
      	print "<table class='scientific_contacts create'>" . LF;
      	print "<tr><th></th><th>Name</th><th>Email</th><th>Institution</th></tr>";

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
	}

// Submit Button
//-----------------------------------------------------------------------------------------------------------
//printActionButton($action);
//Define the action buttons
print "<div class='actionbutton'>" . LF;
//IF ACTION IS ADD
if ($action == "add")
	print "<input type='submit' name='push' value='Add Entry' class='submit'/>" . LF;
//IF ACTION IS loadOldObs
else if($action == "loadOldSpa")
{
   	print "<input type='hidden' name='is_old_res' value='1'>" . LF ;
   	print "<input type='submit' name='push' value='Add Entry' class='submit'>" . LF;
}
//IF ACTION IS EDIT
else if ($action == "edit")
	print "<input type='submit' name='push' value='Update Entry'/>" . LF;
print "</div>" . LF;

?>