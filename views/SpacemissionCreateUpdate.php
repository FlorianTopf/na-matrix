<?php 
/**
 * @file SpacemissionCreateUpdate.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */
	 
print "<INPUT type='hidden' name='page' value='add'>" . LF ;
print "<INPUT type='hidden' name='add_res_id' value='{$resource_id}'>" . LF ; 
print "<INPUT type='hidden' name='res_type' value='{$resource_type}'>" . LF ; 
//show_message();
      
print "<FIELDSET class='rfield'><LEGEND>Space Mission General:</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;

//Space mission name - MANDATORY / CHECK IF THE NAME ALREADY EXISTS!
/** @todo THIS IS A LITTLE HACK, WE DONT CHECK FOR EXISTING NAMES IF EDITING */
if($action == "edit")
{
//	  	print "<TR><TD align='left'>" .
//            "<B><FONT color='red'>*</FONT> Space Mission name:</B></TD>";
//      	print "<TD align='left'><INPUT name='update_spa_name' value='" .
//            $_spacemission->get_field("spa_mission_name") . "' size='80'></TD></TR>" . LF;
	printInputTextRow("Space Mission name", "update_spa_name", $_spacemission->get_field("spa_mission_name"), 80, NULL, NULL, TRUE);
}
else
{
//	  	print "<TR><TD align='left'>" .
//            "<B><FONT color='red'>*</FONT> Space Mission name:</B></TD>";
//      	print "<TD align='left'><INPUT name='add_spa_name' value='" .
//            $_spacemission->get_field("spa_mission_name") . "' size='80'></TD></TR>" . LF;
	printInputTextRow("Space Mission name", "add_spa_name", "", 80, NULL, NULL, TRUE);
}

//Mission agency - MANDATORY
//      print "<TR><TD align='left'>" .
//      		"<B><FONT color='red'>*</FONT> Mission Agency:</B></TD>";
//      print "<TD align='left'><SELECT name='add_spa_agency_id'>" . LF;
//      print "<OPTION value=''>Please choose...</OPTION";
$agencies = $_spacemission->get_agencies();
//      foreach ($agencies['id'] as $key => $value)
//      {
//        print "<OPTION value='" . $value . "'";
//        if ($value == $_spacemission->get_field("spa_mission_agency")) print " selected";
//        print ">" . $agencies['acronym'][$key] . " (" . $agencies['name'][$key] . ")</OPTION>" . LF;
//      }
//      print "</SELECT></TD></TR>" . LF;
$options = array("<OPTION value=''>Please choose...</OPTION");
printSelectListRowFromArray("Mission Agency", "add_spa_agency_id", $_spacemission->get_field("spa_mission_agency"), 
	$agencies, array("acronym", "name"), NULL, TRUE, $options);

//Launch date - FORMAT: YYYY-MM-DD - MANDATORY
//      print "<TR><TD align='left'>" .
//            "<B><FONT color='red'>*</FONT> Launch Date:</B> [YYYY-MM-DD]</TD>";
//      print "<TD align='left'><INPUT name='add_spa_launch' value='" .
//            $_spacemission->get_field("spa_launch_date") . "' size='12'></TD></TR>" . LF;
printInputTextRow("Launch Date", "add_spa_launch", $_spacemission->get_field("spa_launch_date"), 12, "[YYYY-MM-DD]", NULL, TRUE);

//Death date - FORMAT: YYYY-MM-DD
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Death Date:</B> [YYYY-MM-DD]</TD>";
//      print "<TD align='left'><INPUT name='add_spa_death' id='add_spa_death' value='" .
//            $_spacemission->get_field("spa_death_date") . "' size='12'></TD></TR>" . LF;
printInputTextRow("Death Date", "add_spa_death", $_spacemission->get_field("spa_death_date"), 12, "[YYYY-MM-DD]", NULL, FALSE);

//Web address
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Web address:</B> [http://...]</TD>";
//      print "<TD align='left'><INPUT name='add_spa_web_address' value='" .
//            $_spacemission->get_field("spa_web_address") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Web address", "add_spa_web_address", $_spacemission->get_field("spa_web_address"), 80, "[http://...]", NULL, FALSE);

//Brief Description
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Brief description:</B></TD>";
//      print "<TD align='left'><TEXTAREA name='add_spa_brief_desc' type='text'" .
//            "' cols='65' rows='3'>" . $_spacemission->get_field("spa_brief_description") . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Brief description", "add_spa_brief_desc", $_spacemission->get_field("spa_brief_description"), 65);
print "</TABLE></FIELDSET>" . LF;

//RESEARCH AREAS - MANDATORY
print "<FIELDSET class='rfield'><LEGEND>Research Areas:</LEGEND>" . LF;
print "<TABLE id='research_areas' border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
//      print "<TR><TD align='left' valign='middle'>" .
//            "<B><FONT color='red'>*</FONT> Research Areas:</B></TD>";
//      //print "<TD align='left'><SELECT name='add_spa_res_are_ids[]' id='add_obs_res_are_ids[]'" .
//      print "<TD align='left'><SELECT name='add_spa_res_are_ids[]' " .
//      		"multiple size='10'>" . LF; //[]
//      print "<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>";
//      print "<OPTION id='add_other_area' value='100000'>Add other Research Area</OPTION>";
$research_areas = $_spacemission->get_research_areas();
//      foreach($research_areas['id'] as $key => $value)
//      {
//       print "<OPTION value='" . $value . "'";
//        if(is_array($_spacemission->get_has_many("research_areas", NULL)))
//        	if (in_array($value, $_spacemission->get_has_many("research_areas", NULL)))
//          		print " selected";
//        print ">" . $research_areas["name"][$key] . "</OPTION>" . LF;
//      }
//      print "</SELECT></TD></TR>" . LF;
$options = array("<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>",
"<OPTION id='add_other_area' value='100000'>Add other Research Area</OPTION>");
printBigSelectListFromArray("Research Areas", "add_spa_res_are_ids[]", 
	$_spacemission->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, $options);
print "</TABLE></FIELDSET>" . LF;

//TARGETS - MANDATORY
/** @todo add other targets */
print "<FIELDSET class='rfield'><LEGEND>Targets:</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
//      print "<TR><TD align='left' valign='middle'>" .
//            "<B><FONT color='red'>*</FONT> Targets:</B></TD>";
//      //print "<TD align='left'><SELECT name='add_spa_target_ids[]' id='add_spa_target_ids[]'" .
//      print "<TD align='left'><SELECT name='add_spa_target_ids[]' " .
//      		"multiple size='10'>" . LF; //[]
//      print "<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>";
$targets = $_spacemission->get_targets();
//      foreach($targets['id'] as $key => $value)
//      {
//        print "<OPTION value='" . $value . "'";
//		if(is_array($_spacemission->get_has_many("targets", NULL)))
//        	if (in_array($value, $_spacemission->get_has_many("targets", NULL)))
//          		print " selected";
//        print ">" . $targets['target_name'][$key] . "</OPTION>" . LF;
//      }
//      print "</SELECT></TD></TR>" . LF;
$options = array("<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>");
printBigSelectListFromArray("Targets", "add_spa_target_ids[]", $_spacemission->get_has_many("targets"), 
	$targets, "target_name", NULL, FALSE, $options);
print "</TABLE></FIELDSET>" . LF;

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
      	print "<INPUT type='hidden' name='add_spa_sensor_ids[" . $sensor_count . "]' value='". $sensor_id . "'>";
      	print "<FIELDSET class='rfield'><LEGEND>Sensor:</LEGEND>" . LF;
//      	if($sensor_count == (count($_spacemission->get_has_many("sensors")) - 1))
//      		print "<TABLE class='sensor_button'><TR><td><a class='add_sensor' href=''>Add Sensor</a></td></tr></TABLE>";
//      	else
//      		print "<TABLE class='sensor_button'><TR><td><a href='' class='remove_sensor'>Delete Sensor</a></td></tr></TABLE>";
		printAddRemoveButton($sensor_count, $_spacemission->get_has_many("sensors"), "sensor");
      	print "<TABLE border='1' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
       	/** @todo refactor the two hidden fields */
      	//TRANSPORT THE NUMBER OF SENSORS FOR JQUERY
      	print "<TR><INPUT type='hidden' name='sensors' class='sensors' value='". count($_spacemission->get_has_many("sensors", NULL)) . "'></TR>";
      	//Sensor Name:
      	/** @todo validate => MANDATORY, but we have a little problem here, you can leave the form empty! */
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Sensor name:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_name[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("sensor_name", $sensor_count) . "' size='80'></TD></TR>" . LF;
		printInputTextRow("Sensor name", "add_spa_sen_name[{$sensor_count}]", $_spacemission->get_sensor("sensor_name", $sensor_count));
      	//Sensor Type:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Sensor type:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_type[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("sensor_type", $sensor_count) . "' size='80'></TD></TR>" . LF;
		printInputTextRow("Sensor type", "add_spa_sen_type[{$sensor_count}]", $_spacemission->get_sensor("sensor_type", $sensor_count));
      	//Underlying Instrumentation:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Underlying:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_under[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("underlying", $sensor_count) . "' size='80'></TD></TR>" . LF;
		printInputTextRow("Underlying Instrumentation", "add_spa_sen_under[{$sensor_count}]", $_spacemission->get_sensor("underlying", $sensor_count));
      	//Range begin: VALIDATION uses standard message
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Range begin:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_range_beg[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("range_begin", $sensor_count) . "' class='number' size='10'></TD></TR>" . LF;
		printInputTextRow("Range begin", "add_spa_sen_range_beg[{$sensor_count}]", $_spacemission->get_sensor("range_begin", $sensor_count), 10, NULL, "number");
      	//Range end: VALIDATION uses standard message
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Range end:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_range_end[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("range_end", $sensor_count) . "' class='number' size='10'></TD></TR>" . LF;
		printInputTextRow("Range end", "add_spa_sen_range_end[{$sensor_count}]", $_spacemission->get_sensor("range_end", $sensor_count), 10, NULL, "number");
      	//Units:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Units:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_units[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("units", $sensor_count) . "' size='30'></TD></TR>" . LF;
		printInputTextRow("Units", "add_spa_sen_units[{$sensor_count}]", $_spacemission->get_sensor("units", $sensor_count), 30);
      	//Measured:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Measured:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_measured[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("measured", $sensor_count) . "' size='60'></TD></TR>" . LF;
		printInputTextRow("Measured", "add_spa_sen_measured[{$sensor_count}]", $_spacemission->get_sensor("measured", $sensor_count), 60);
      	//Resolution:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Resolution:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_resolution[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("resolution", $sensor_count) . "' size='60'></TD></TR>" . LF;
		printInputTextRow("Resolution", "add_spa_sen_resolution[{$sensor_count}]", $_spacemission->get_sensor("resolution", $sensor_count), 60);
      	//Field of View:
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Field of View:</B></TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_fov[" . $sensor_count . "]' value='" .
//            	  $_spacemission->get_sensor("field_of_view", $sensor_count) . "' size='60'></TD></TR>" . LF;
		printInputTextRow("Field of View", "add_spa_sen_fov[{$sensor_count}]", $_spacemission->get_sensor("field_of_view", $sensor_count), 60);
        //Web address
//      		print "<TR><TD align='left'>" .
//            	  "<B>&nbsp;&nbsp;&nbsp;&nbsp;Web address:</B> [http://...]</TD>";
//      		print "<TD align='left'><INPUT name='add_spa_sen_web[" . $sensor_count . "]' value='" .
//				  $_spacemission->get_sensor("web_address", $sensor_count) . "' size='80'></TD></TR>" . LF;
		printInputTextRow("Web address", "add_spa_sen_web[{$sensor_count}]", $_spacemission->get_sensor("web_address", $sensor_count));
        //Sensor comments
//      		print "<TR><TD align='left'>" .
//            	"<B>&nbsp;&nbsp;&nbsp;&nbsp;Sensor comments:</B></TD>";
//      		print "<TD align='left'><TEXTAREA name='add_spa_sensor_com[" . $sensor_count . "]' type='text'" .
//            	"' cols='65' rows='2'>" . $_spacemission->get_sensor("sensor_comments", $sensor_count) . "</TEXTAREA></TD></TR>" . LF;
		printInputTextfieldRow("Sensor comments", "add_spa_sensor_com[{$sensor_count}]", $_spacemission->get_sensor("sensor_comments", $sensor_count), 65);
 		print "</TABLE>" . LF;

		//Science Goals - COMMENTED ATM BECAUSE STILL IN DISCUSSION
//      		print "<FIELDSET class='rfield'><LEGEND>Science Goals:</LEGEND>" . LF;
//      		print "<TABLE class='science_goals' border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
//      		print "<TR><TD align='left' valign='middle' width='150px'>" .
//            	  "<B><FONT color='red'>*</FONT> Science Goals:</B></TD>";
//      		//print "<TD align='left'><SELECT name='add_spa_sci_goal_ids[]' id='add_spa_sci_goal_ids[]'" .
//      		//print "<TD align='left'><SELECT name='add_spa_sci_goal_ids[" . $sensor_count . "][]' id='add_spa_sci_goal_ids'" .
//      		print "<TD align='left'><SELECT name='add_spa_sci_goal_ids[" . $sensor_count . "][]' " .
//      			  "multiple size='6'>" . LF;
//      		print "<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>";
//      		print "<OPTION class='add_other_goal' value='100000'>Add other Science Goal</OPTION>";
//			foreach($science_goals['id'] as $key => $value)
//			{
//				print "<OPTION value='" . $value . "'";
//        		if(is_array($_spacemission->get_has_many("science_goals", $sensor_id)))
//        			if (in_array($value, $_spacemission->get_has_many("science_goals", $sensor_id)))
//          				print " selected";
//        		print ">" . $science_goals['name'][$key] . "</OPTION>" . LF;
//			}
//      		print "</SELECT></TD></TR>" . LF;
//      		print "</TABLE></FIELDSET>" . LF;

      	//Scientific Contacts
      	print "<FIELDSET class='rfield'><LEGEND>Scientific Contacts:</LEGEND>" . LF;
      	//print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
      	/** this table has two classes!! class='rtable' */
      	print "<TABLE class='scientific_contacts rtable' border='0' cellspacing='4' cellpadding='4' width='100%'>" . LF;
      	print "<TR><TH></TH><TH>Name</TH><TH>Email</TH><TH>Institution</TH></TR>";
      	
   		if(!is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
			$_spacemission->init_has_many("scientific_contacts", $sensor_id);

   		if(is_array($_spacemission->get_has_many("scientific_contacts", $sensor_id)))
   			foreach($_spacemission->get_has_many("scientific_contacts", $sensor_id) as $contact_count => $contact_id)
   			{
//   				print "<TR><TD>";
//   				if($contact_count == (count($_spacemission->get_has_many("scientific_contacts", $sensor_id)) - 1))
//   					print "<a class='add_contact' href=''>Add</a>";
//   				else
//   					print "<a class='remove_contact' href=''>Del</a>";
//   				print "</TD>";
				print "<TR>";
				printAddRemoveButton($contact_count, $_spacemission->get_has_many("scientific_contacts", $sensor_id), "contact", FALSE);
//				print "</td><TD align='center'>" .
//       			"<INPUT name='add_spa_sci_con_name[" . $sensor_count . "][" . $contact_count . "]' value='" .
//    				$_spacemission->get_scientific_contact("name", $sensor_id, $contact_count) . "' size='30'>" .
//           		"</TD><TD align='center'>" .
				printInputTextCol("add_spa_sci_con_name[{$sensor_count}][{$contact_count}]", 
					$_spacemission->get_scientific_contact("name", $sensor_id, $contact_count), 30, "align='center'");
//        		"<INPUT name='add_spa_sci_con_email[" . $sensor_count . "][" . $contact_count . "]' value='" .
//        			$_spacemission->get_scientific_contact("email", $sensor_id, $contact_count) . "' size='30'>" .
//            	"</TD><TD align='center'>" .
				printInputTextCol("add_spa_sci_con_email[{$sensor_count}][{$contact_count}]", 
					$_spacemission->get_scientific_contact("email", $sensor_id, $contact_count), 30, "align='center'");
//        		"<INPUT name='add_spa_sci_con_institution[" . $sensor_count . "][" . $contact_count . "]' value='" .
//        	 		$_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count) . "' size='30'>" .
				printInputTextCol("add_spa_sci_con_institution[{$sensor_count}][{$contact_count}]", 
					$_spacemission->get_scientific_contact("institution", $sensor_id, $contact_count), 30, "align='center'");
            	//TRANSPORT THE OLD NUMBER OF SCIENTIFIC CONTACTS VIA POST
            	//"<INPUT type='hidden' name='add_spa_sci_con_ids[" . $sensor_count . "][" . $contact_count . "]' value='". $contact_id . "'>" .
//            	print "</TD></TR>";
				print "</TR>";
      		}
      	print "</TABLE></FIELDSET>" . LF;
      	print "</FIELDSET>" . LF;
	}
	
// Submit Button
//-----------------------------------------------------------------------------------------------------------
//Define the action buttons
//print "<P><CENTER><TABLE>" . LF;
////IF ACTION IS ADD 
//if ($action == "add")
//	print "<TR><TD><INPUT type='submit' name='push' value='Add Entry' class='submit'></TD></TR>" . LF;
////IF ACTION IS EDIT
//else if ($action == "edit")
//	print "<TR><TD><INPUT type='submit' name='push' value='Update Entry'></TD></TR>" . LF;
//print "</TABLE></CENTER>" . LF;
printActionButton($action);

?>