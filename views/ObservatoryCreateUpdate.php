<?php 
/**
 * @file ObservatoryCreateUpdate.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<INPUT type='hidden' name='page' value='add'>" . LF;  
print "<INPUT type='hidden' name='add_res_id' value='{$resource_id}'>" . LF; 
print "<INPUT type='hidden' name='res_type' value='{$resource_type}'>" . LF; 
//show_message();

print "<FIELDSET class='rfield'><LEGEND>Observatory General:</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;

//Observatory name - MANDATORY / CHECK IF THE NAME ALREADY EXISTS!
/** @todo THIS IS A LITTLE HACK, WE DONT CHECK FOR EXISTING NAMES IF EDITING */
if($action == "edit")
{
//	print "<TR><TD align='left'>" .
//		"<B><FONT color='red'>*</FONT>&nbsp;Observatory name:</B></TD>";
//	print "<TD align='left'><INPUT name='update_obs_name' value='" .
//		$_observatory->get_field("obs_name") . "' size='80'></TD></TR>" . LF;
	printInputTextRow("Observatory name", "update_obs_name", $_observatory->get_field("obs_name"), 80, NULL, NULL, TRUE);
}
else
{
//	print "<TR><TD align='left'>" .
//		"<B><FONT color='red'>*</FONT>&nbsp;Observatory name:</B></TD>";
//	print "<TD align='left'><INPUT name='add_obs_name' value=''" .
//		"' size='80'></TD></TR>" . LF;
	printInputTextRow("Observatory name", "add_obs_name", "", 80, NULL, NULL, TRUE);
}
//Year founded - check if is an YEAR
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Year founded:</B> [YYYY]</TD>";
//print "<TD align='left'><INPUT name='add_obs_founded' class='add_obs_founded' value='" .
//	$_observatory->get_field("obs_founded") . "' size='4'></TD></TR>" . LF;
printInputTextRow("Year founded", "add_obs_founded", $_observatory->get_field("obs_founded"), 4, "[YYYY]", "add_obs_founded");
//Institution
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Institution:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_institution' value='" .
//            $_observatory->get_field("obs_institution") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Institution", "add_obs_institution", $_observatory->get_field("obs_institution"));
//Web address
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Web address:</B> [http://...]</TD>";
//      print "<TD align='left'><INPUT name='add_obs_web_address' value='" .
//            $_observatory->get_field("obs_web_address") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Web address", "add_obs_web_address", $_observatory->get_field("obs_web_address"), 80, "[http://...]");
//Address
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Address:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_address' value='" .
//            $_observatory->get_field("obs_address") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Address", "add_obs_address", $_observatory->get_field("obs_address"));
//ZIP code
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;ZIP code:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_zip_code' value='" .
//            $_observatory->get_field("obs_zip_code") . "' size='10'></TD></TR>" . LF;
printInputTextRow("ZIP code", "add_obs_zip_code", $_observatory->get_field("obs_zip_code"), 10);
//City
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;City:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_city' value='" .
//           $_observatory->get_field("obs_city") . "' size='30'></TD></TR>" . LF;
printInputTextRow("City", "add_obs_city",  $_observatory->get_field("obs_city"), 30);
//Country - MANDATORY
$countries = $_observatory->get_countries();
$options = array("<OPTION value=''>Please choose...</OPTION>");
printSelectListRowFromArray("Country", "add_obs_country_id", 
	$_observatory->get_field("obs_country_id"), $countries, "name", NULL, TRUE, $options);
//print "<TR><TD align='left'>" .
//	"<B><FONT color='red'>*</FONT>&nbsp;Country:</B></TD>";
//print "<TD align='left'><SELECT name='add_obs_country_id'>" . LF;
//print "<OPTION value=''>Please choose...</OPTION>";
//foreach($countries['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//	if ($value == $_observatory->get_field("obs_country_id")) print " selected";
//    print ">" . $countries['name'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
//Phone
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Phone:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_phone' value='" .
//            $_observatory->get_field("obs_phone") . "' size='30'></TD></TR>" . LF;
printInputTextRow("Phone", "add_obs_phone", $_observatory->get_field("obs_phone"), 30);
//Email
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Email:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_email' value='" .
//            $_observatory->get_field("obs_email") . "' size='30'></TD></TR>" . LF;
printInputTextRow("Email", "add_obs_email", $_observatory->get_field("obs_email"), 30);

//Latitude
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Latitude:</B></TD>";
//print "<TD align='left'>" .
//	"<SELECT name='add_obs_latitude[prefix]'><OPTION value='North'";
//if($_observatory->get_field_array("obs_latitude", "prefix") == 'North') print " selected";
//print ">North</OPTION><OPTION value='South'";
//if($_observatory->get_field_array("obs_latitude", "prefix") == 'South') print " selected";
//print ">South</OPTION></SELECT>&nbsp;&nbsp;&nbsp;&nbsp;" .
// 	  "<INPUT name='add_obs_latitude[degree]' value='" . $_observatory->get_field_array("obs_latitude", "degree") .
//	  "' class='digits' size='3'>&nbsp;&deg&nbsp;&nbsp;&nbsp;&nbsp;" .
//	  "<INPUT name='add_obs_latitude[minutes]' value='" . $_observatory->get_field_array("obs_latitude", "minutes") .
//    "' class='digits' size='2'>&nbsp;<B>'</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//    "<INPUT name='add_obs_latitude[seconds]' value='" . $_observatory->get_field_array("obs_latitude", "seconds") .
//    "' class='digits' size='2'>&nbsp;<B>''</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//    "<INPUT name='add_obs_latitude[cent]' value='" . $_observatory->get_field_array("obs_latitude", "cent") .
//    "' class='digits' size='2'>&nbsp;<B>'''</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//    "</TD></TR>" . LF;
print "<TR>";
printInputTitleCol("Latitude");
print "<TD align='left'>";
printSimpleSelectListFromArray("add_obs_latitude[prefix]", $_observatory->get_field_array("obs_latitude", "prefix"),
	$_observatory->_latitudePrefixes);
ws(4);
printInputText("add_obs_latitude[degree]", $_observatory->get_field_array("obs_latitude", "degree"), 3, "digits", "&deg;");
ws(4);
printInputText("add_obs_latitude[minutes]", $_observatory->get_field_array("obs_latitude", "minutes"), 2, "digits", "'");
ws(4);
printInputText("add_obs_latitude[seconds]", $_observatory->get_field_array("obs_latitude", "seconds"), 2, "digits", "''");
ws(4);
printInputText("add_obs_latitude[cent]", $_observatory->get_field_array("obs_latitude", "cent"), 2, "digits", "'''");
print "</TD></TR>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<label for='add_obs_latitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";

//Longitude
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Longitude:</B></TD>";
//print "<TD align='left'>" .
//	"<SELECT name='add_obs_longitude[prefix]'><OPTION value='East'";
//if($_observatory->get_field_array("obs_longitude", "prefix") == 'East') print " selected";
//print ">East</OPTION><OPTION value='West'";
//if($_observatory->get_field_array("obs_longitude", "prefix") == 'West') print " selected";
//print ">West</OPTION></SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" .
//      "<INPUT name='add_obs_longitude[degree]' value='" . $_observatory->get_field_array("obs_longitude", "degree") .
//      "' class='digits' size='3'>&nbsp;&deg&nbsp;&nbsp;&nbsp;&nbsp;" .
//      "<INPUT name='add_obs_longitude[minutes]' value='" . $_observatory->get_field_array("obs_longitude", "minutes") .
//      "' class='digits' size='2'>&nbsp;<B>'</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//      "<INPUT name='add_obs_longitude[seconds]' value='" . $_observatory->get_field_array("obs_longitude", "seconds") .
//      "' class='digits' size='2'>&nbsp;<B>''</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//      "<INPUT name='add_obs_longitude[cent]' value='" . $_observatory->get_field_array("obs_longitude", "cent") .
//      "' class='digits' size='2'>&nbsp;<B>'''</B>&nbsp;&nbsp;&nbsp;&nbsp;" .
//      "</TD></TR>" . LF;
print "<TR>";
printInputTitleCol("Longitude");
print "<TD align='left'>";
printSimpleSelectListFromArray("add_obs_longitude[prefix]", $_observatory->get_field_array("obs_longitude", "prefix"),
	$_observatory->_longitudePrefixes);
ws(5);
printInputText("add_obs_longitude[degree]", $_observatory->get_field_array("obs_longitude", "degree"), 3, "digits", "&deg;");
ws(4);
printInputText("add_obs_longitude[minutes]", $_observatory->get_field_array("obs_longitude", "minutes"), 2, "digits", "'");
ws(4);
printInputText("add_obs_longitude[seconds]", $_observatory->get_field_array("obs_longitude", "seconds"), 2, "digits", "''");
ws(4);
printInputText("add_obs_longitude[cent]", $_observatory->get_field_array("obs_longitude", "cent"), 2, "digits", "'''");
print "</TD></TR>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<label for='add_obs_longitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";

//Approximate position
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Approximate position:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_position' value='" .
//            $_observatory->get_field("obs_approx_position") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Approximate position", "add_obs_position", $_observatory->get_field("obs_approx_position"));
//Sealevel
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Sealevel:</B>&nbsp;[m]</TD>";
//      print "<TD align='left'><INPUT name='add_obs_sealevel' value='" .
//            $_observatory->get_field("obs_sealevel_m") . "' size='10'></TD></TR>" . LF;
printInputTextRow("Sealevel", "add_obs_sealevel", $_observatory->get_field("obs_sealevel_m"), 10, "[m]");
//Precipitation range
$p_ranges = $_observatory->get_precipitation_ranges();
printSelectListRowFromArray("Precipitiation range", "add_obs_precip_id", $_observatory->get_field("obs_precipitation"), $p_ranges, "range", "[mm/Y]");
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Precipitation range:</B>&nbsp;[mm/Y]</TD>";
//print "<TD align='left'><SELECT name='add_obs_precip_id'>" . LF;
//foreach($p_ranges['id'] as $key => $value)
//{
//print "<OPTION value='" . $value . "'";
//if ($value == $_observatory->get_field("obs_precipitation")) print " selected";
//	print ">" . $p_ranges['range'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
//Clear nights
$c_ranges = $_observatory->get_clearnights_ranges();
printSelectListRowFromArray("Clear nights", "add_obs_clearnights_id", $_observatory->get_field("obs_clear_nights"), $c_ranges, "range", "[D]");
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Clear nights:</B>&nbsp;[D]</TD>";
//print "<TD align='left'><SELECT name='add_obs_clearnights_id'>" . LF;
//foreach($c_ranges['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//	if ($value == $_observatory->get_field("obs_clear_nights")) print " selected";
//	print ">" . $c_ranges['range'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
//Timezone
$timezones = $_observatory->get_timezones();
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Timezone:</B>&nbsp;[GMT+/-]</TD>";
//print "<TD align='left'><SELECT name='add_obs_timezone_id'>" . LF;
//
//foreach($timezones['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//	if ($value == $_observatory->get_field("obs_timezone")) print " selected";
//	print ">" . $timezones['timezone'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
printSelectListRowFromArray("Timezone", "add_obs_timezone_id", $_observatory->get_field("obs_timezone"), $timezones, "timezone", "[GMT+/-]");
//Observatory Status
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Observatory Status:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_status' value='" .
//            $_observatory->get_field("obs_observatory_status") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Observatory Status", "add_obs_status", $_observatory->get_field("obs_observatory_status"));
//Partner observatories
//      print "<TR><TD align='left'>" .
//            "<B>&nbsp;&nbsp;&nbsp;Partner observatories:</B></TD>";
//      print "<TD align='left'><INPUT name='add_obs_partner' value='" .
//            $_observatory->get_field("obs_partner_observatories") . "' size='80'></TD></TR>" . LF;
printInputTextRow("Partner Observatories", "add_obs_partner", $_observatory->get_field("obs_partner_observatories"));
print "</TABLE></FIELDSET>" . LF;

//SCIENTIFIC CONTACTS
print "<FIELDSET class='rfield'><LEGEND>Scientific Contacts:</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
print "<TR><TH></TH><TH>Name</TH><TH>Email</TH><TH>Institution</TH></TR>";
if(!is_array($_observatory->get_has_many("scientific_contacts")))
	$_observatory->init_has_many("scientific_contacts");
//PROOF IF THERE IS AN ARRAY!
if(is_array($_observatory->get_has_many("scientific_contacts")))
	foreach($_observatory->get_has_many("scientific_contacts") as $contact_count => $contact_id)
	{
		print "<TR>";
		PrintAddRemoveButton($contact_count, $_observatory->get_has_many("scientific_contacts"), "contact", FALSE);
//		print "<TD align='center'>";
//			"<INPUT name='add_obs_sci_con_name[" . $contact_count . "]' value='" .
//			$_observatory->get_scientific_contact("sci_con_name", $contact_count) . "' size='30'>" .
//			"</TD><TD align='center'>" .
//			"<INPUT name='add_obs_sci_con_email[" . $contact_count . "]' value='" .
//			$_observatory->get_scientific_contact("sci_con_email", $contact_count) . "' size='30'>" .
//			"</TD><TD align='center'>" .
//			"<INPUT name='add_obs_sci_con_institution[" . $contact_count . "]' value='" .
//			$_observatory->get_scientific_contact("sci_con_institution", $contact_count) . "' size='30'>" .
		printInputTextCol("add_obs_sci_con_name[{$contact_count}]", 
			$_observatory->get_scientific_contact("sci_con_name", $contact_count), 30, "align='center'");
		printInputTextCol("add_obs_sci_con_email[{$contact_count}]",
			$_observatory->get_scientific_contact("sci_con_email", $contact_count), 30, "align='center'");
		printInputTextCol("add_obs_sci_con_institution[{$contact_count}]", 
			$_observatory->get_scientific_contact("sci_con_institution", $contact_count), 30, "align='center'");
//		print "</TD></TR>" .
		print "</TR>";
			//TRANSPORT THE OLD NUMBER OF SCIENTIFIC CONTACTS VIA POST
            "<INPUT type='hidden' name='add_obs_sci_con_ids[" . $contact_count . "]' value='". $contact_id . "'>";
	}
//dynamically add rows for more scientific contacts
//print "<TR><td><a class='add_contact' href=''>Add</a></td><TD align='center'>" .
//	"<INPUT name='add_obs_sci_con_name[0]' value='' size='30'>" .
//    "</TD><TD align='center'>" .
//    "<INPUT name='add_obs_sci_con_email[0]' value='' size='30'>" .
//    "</TD><TD align='center'>" .
//    "<INPUT name='add_obs_sci_con_institution[0]' value='' size='30'>" .
//    "</TD>" .
//    "</TR>" ;
print "</TABLE></FIELDSET>" . LF;

//HIDDEN FIELDS:
print "<FIELDSET class='rfield'><LEGEND>Hidden Fields: You may want to hide some contact information</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
//print "<TR>";
////ITERATE THROUGH hidden_fields an print value
//$iterator = 0;
//foreach ($_observatory->get_hidden_fields() as $key => $value)
//{
//	print "<TD align='center'><B>". ucfirst(str_replace("_", " ", $key)) . "&nbsp;</B>" .
//		"<INPUT name='add_obs_hide_" . $iterator ."' type='checkbox' value='1' ";
//	if($value) print "checked='checked'";
//    print "'></TD>" . LF;
//    $iterator++;
//}
//print "</TR>";
printMultipleCheckBoxRow("add_obs_hide", $_observatory->get_hidden_fields());
print "</TABLE></FIELDSET>" . LF;


//RESEARCH AREAS - MANDATORY
print "<FIELDSET class='rfield'><LEGEND>Research Areas:</LEGEND>" . LF;
print "<TABLE id='research_areas' border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
$research_areas = $_observatory->get_research_areas();
$options = array("<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>",
	"<OPTION id='add_other_area' value='100000'>Add other Research Area</OPTION>");
printBigSelectListFromArray("Research Areas", "add_obs_res_are_ids[]", 
	$_observatory->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, $options);
//print "<TR><TD align='left' valign='middle'>" .
//	"<B><FONT color='red'>*</FONT> Research Areas:</B></TD>";
//print "<TD align='left'><SELECT name='add_obs_res_are_ids[]' " .
//	"multiple size='10'>" . LF; //[]
//print "<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>";
//print "<OPTION id='add_other_area' value='100000'>Add other Research Area</OPTION>";
//foreach($research_areas['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//    //PROOF IF THIS IS AN ARRAY!
//    if(is_array($_observatory->get_has_many("research_areas", NULL)))
//    	if(in_array($value, $_observatory->get_has_many("research_areas", NULL)))
//        	print " selected";
//       	print ">" . $research_areas['name'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
print "</TABLE></FIELDSET>" . LF;

//TARGETS: NOT MANDADORY
/** @todo add other targets */
print "<FIELDSET class='rfield'><LEGEND>Targets:</LEGEND>" . LF;
//print "<TABLE id='targets' border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
$targets = $_observatory->get_targets();
$options = array("<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>");
//$options = array("Please choose one or several by holding CTRL...", 
//"<OPTION id='other' value='100000'>Add other Target</OPTION>");
printBigSelectListFromArray("Targets", "add_obs_target_ids[]", $_observatory->get_has_many("targets"), 
	$targets, "target_name", NULL, FALSE, $options);
//print "<TR><TD align='left' valign='middle'>" .
//	"<B>Targets:</B></TD>";
//print "<TD align='left'><SELECT name='add_obs_target_ids[]' " .
//	"multiple size='10'>" . LF; //[]
//print "<OPTION value=''>Please choose one or several by holding CTRL...</OPTION>";
////print "<OPTION id='other' value='100000'>Add other Target</OPTION>";
//foreach($targets['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//    //PROOF IF THIS IS AN ARRAY!
//    if(is_array($_observatory->get_has_many("targets", NULL)))
//    	if (in_array($value, $_observatory->get_has_many("targets", NULL)))
//        	print " selected";
//        print ">" . $targets['target_name'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></TD></TR>" . LF;
print "</TABLE></FIELDSET>" . LF;

//TELESCOPES: at least 1 ENTRY MANDATORY! (JQUERY)
//getting all necessary types / units only calling them once
$telescope_types = $_observatory->get_telescope_types();
$antenna_types = $_observatory->get_antenna_types();
$instrument_types = $_observatory->get_instrument_types();
$wavelength_units = $_observatory->get_wavelength_units();
      
if(!is_array($_observatory->get_has_many("telescopes")))
	$_observatory->init_has_many("telescopes");

if(is_array($_observatory->get_has_many("telescopes")))
	foreach($_observatory->get_has_many("telescopes") as $telescope_count => $telescope_id)
	{
		/** @todo refactor the two hidden fields */
  		//TRANSPORT THE OLD NUMBER OF TELESCOPES VIA POST
	    print "<INPUT type='hidden' name='add_obs_telescope_ids[" . $telescope_count . "]' value='". $telescope_id . "'>" . LF;
	      
      	print "<FIELDSET class='rfield'><LEGEND>Telescope:</LEGEND>" . LF;
      	print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
      	
	    /** @todo refactor the two hidden fields */
      	//TRANSPORT THE NUMBER OF TELESCOPES FOR JQUERY
      	print "<TR><INPUT type='hidden' name='telescopes' class='telescopes' value='".
      		count($_observatory->get_has_many("telescopes")) . "'></TR>";
      	//echo "TELESCOPES: " . count($_observatory->get_has_many("telescopes")) . "<br>";

	    //Telescope Name
//	    	print "<TR><TD align='left'>" .
//	    		"<B>&nbsp;&nbsp;&nbsp;Telescope Name:</B> </TD>";
//	    	print "<TD align='left'><INPUT name='add_obs_telescope_name[" . $telescope_count . "]' value='" .
//	    		$_observatory->get_telescope("telescope_name", $telescope_count) . "' size='60'></TD></TR>" . LF;
		printInputTextRow("Telescope Name", "add_obs_telescope_name[{$telescope_count}]",
			 $_observatory->get_telescope("telescope_name", $telescope_count), 60);

		//Telescope Type
		$options = array("top" => "<OPTION value=''>Please select a Telescope Type</OPTION>",
			"bottom" => "<OPTION class='add_telescope_type' value='100000'>Add other Telescope Type</OPTION>");
		printTypeSelectListFromArray("Telescope Type", "add_obs_telescope_type_id[{$telescope_count}]",
		 $_observatory->get_telescope("telescope_type", $telescope_count), $telescope_types, "name", NULL, FALSE, $options);
//	    print "<TR><TD align='left'>" .
//	    	"<B>&nbsp;&nbsp;&nbsp;Telescope Type:</B> </TD>";
//	    print "<TD align='left'><SELECT name='add_obs_telescope_type_id[" . $telescope_count . "]'>" . LF;
//	    print "<OPTION value=''>Please select a Telescope Type</OPTION>";
//	    foreach($telescope_types['id'] as $key => $value)
//	    {
//	      	print "<OPTION value='" . $value . "'";
//	      	if ($value == $_observatory->get_telescope("telescope_type", $telescope_count)) print " selected";
//	       	print ">" . $telescope_types['name'][$key] . "</OPTION>" . LF;
//	    }
//	    print "<OPTION class='add_telescope_type' value='100000'>Add other Telescope Type</OPTION>";
//		print "</SELECT></TD></TR>" . LF;

	    //Telescope Elements
//	      	print "<TR><TD align='left'>" .
//	          	  "<B>&nbsp;&nbsp;&nbsp;Telescope Elements:</B> </TD>";
//	      	print "<TD align='left'><INPUT name='add_obs_telescope_elements[" . $telescope_count . "]' value='" .
//	        $_observatory->get_telescope("telescope_elements", $telescope_count) . "' size='10'></TD></TR>" . LF;
		printInputTextRow("Telescope Elements", "add_obs_telescope_elements[{$telescope_count}]", 
			$_observatory->get_telescope("telescope_elements", $telescope_count), 10);

	    //Diameter/Aperture
//	    print "<TR><TD align='left'>" .
//	    	"<B>&nbsp;&nbsp;&nbsp;Diameter/Aperture:</B> [m]</TD>";
//	    print "<TD align='left'><INPUT name='add_obs_diameter[". $telescope_count . "]' class='number' value='" .
//	    	$_observatory->get_telescope("diameter_m", $telescope_count) . "' size='10'></TD></TR>" . LF;
		printInputTextRow("Diameter/Aperture", "add_obs_diameter[{$telescope_count}]", 
			$_observatory->get_telescope("diameter_m", $telescope_count), 10, "[m]", "number");
			
	    //Focallength
//	      	print "<TR><TD align='left'>" .
//	              "<B>&nbsp;&nbsp;&nbsp;Focallength:</B> [m/F]</TD>";
//	      	//print "<TD align='center'><INPUT name='add_obs_focallength[" . $telescope_count . "]' class='number' value='" .
//	      	print "<TD align='left'><INPUT name='add_obs_focallength[" . $telescope_count . "]' value='" .
//	            $_observatory->get_telescope("focallength_m", $telescope_count) . "' size='10'></TD></TR>" . LF;
		//printInputTextRow("Focallength", "add_obs_focallength[{$telescope_count}]", 
		//	$_observatory->get_telescope("focallength_m", $telescope_count), 10, "[m]", "number");
		printInputTextRow("Focallength", "add_obs_focallength[{$telescope_count}]", 
			$_observatory->get_telescope("focallength_m", $telescope_count), 10, "[m/F]");

		//Antenna Type
		$options = array("bottom" => "<OPTION class='add_antenna_type' value='100000'>Add other Type</OPTION>");
		printTypeSelectListFromArray("Antenna Type", "add_obs_antenna_type_id[{$telescope_count}]", 
			$_observatory->get_telescope("antenna_type", $telescope_count), $antenna_types, "antenna_type", NULL, FALSE, $options);
//		print "<TR><TD align='left'>" .
//			"<B>&nbsp;&nbsp;&nbsp;Antenna Type:</B> </TD>";
//	    print "<TD align='left'><SELECT name='add_obs_antenna_type_id[" . $telescope_count . "]'>" . LF;
//	    foreach($antenna_types['id'] as $key => $value)
//	    {
//	      	print "<OPTION value='" . $value . "'";
//			if ($value == $_observatory->get_telescope("antenna_type", $telescope_count)) print " selected";
//	        print ">" . $antenna_types['antenna_type'][$key] . "</OPTION>" . LF;
//	     }
//	     print "<OPTION class='add_antenna_type' value='100000'>Add other Type</OPTION>";
//		 print "</SELECT></TD></TR>" . LF;

		//Wavelength
	    /** @todo add JQUERY/DB support for autocomplete */
		printInputTextRow("Wavelength", "add_obs_wavelength[{$telescope_count}]", 
			$_observatory->get_telescope("wavelength", $telescope_count), 40, NULL, "wavelength");
//	     print "<TR><TD align='left'>" .
//	     	"<B>&nbsp;&nbsp;&nbsp;Wavelength:</B> </TD>";
//	     print "<TD align='left'><INPUT name='add_obs_wavelength[" . $telescope_count . "]'  class='wavelength' value='" .
//	     	$_observatory->get_telescope("wavelength", $telescope_count) . "' size='40'></TD></TR>" . LF;

	    //Wavelength Begin	    	
//	    print "<TR><TD align='left'>" .
//	    	"<B>&nbsp;&nbsp;&nbsp;Wavelength Begin:</B> </TD>";
//	    print "<TD align='left'><INPUT name='add_obs_wavelength_b[". $telescope_count . "]' class='number' value='" .
//	     	$_observatory->get_telescope("wavelength_begin", $telescope_count) . "' size='10'>&nbsp;&nbsp;&nbsp;" .
//			"<SELECT name='add_obs_wavelength_b_unit[" . $telescope_count . "]'>";
//	    foreach($wavelength_units['id'] as $key => $value)
//	    {
//	    	print "<OPTION value='" . $value . "'";
//	        if ($value == $_observatory->get_telescope("wavelength_b_unit", $telescope_count)) print " selected";
//	        print ">" . $wavelength_units['wavelength_unit'][$key] . "</OPTION>" . LF;
//	    }
//		print "</SELECT></TD></TR>" . LF;
	    print "<TR>";
		printInputTitleCol("Wavelength Begin");
		print "<TD align='left'";
		printInputText("add_obs_wavelength_b[{$telescope_count}]", $_observatory->get_telescope("wavelength_begin", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_b_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_begin", $telescope_count), 
			$wavelength_units, "wavelength_unit");
		print "</TD></TR>" . LF;

		//Wavelength End
//	    print "<TR><TD align='left'>" .
//	    	"<B>&nbsp;&nbsp;&nbsp;Wavelength End:</B> </TD>";
//	    print "<TD align='left'><INPUT name='add_obs_wavelength_e[". $telescope_count . "]' class='number' value='" .
//	    $_observatory->get_telescope("wavelength_end", $telescope_count) . "' size='10'>&nbsp;&nbsp;&nbsp;" .
//		"<SELECT name='add_obs_wavelength_e_unit[" . $telescope_count . "]'>";
//		foreach($wavelength_units['id'] as $key => $value)
//	    {
//	    	print "<OPTION value='" . $value . "'";
//	        if ($value == $_observatory->get_telescope("wavelength_e_unit", $telescope_count)) print " selected";
//	        print ">" . $wavelength_units['wavelength_unit'][$key] . "</OPTION>" . LF;
//	    }
//		print "</SELECT></TD></TR>" . LF;
	    print "<TR>";
		printInputTitleCol("Wavelength End");
		print "<TD align='left'";
		printInputText("add_obs_wavelength_e[{$telescope_count}]", $_observatory->get_telescope("wavelength_end", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_e_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_e_unit", $telescope_count), 
			$wavelength_units, "wavelength_unit");
		print "</TD></TR>" . LF;

	    //Telescope Comments
//	    print "<TR><TD align='left'>" .
//	    	"<B>&nbsp;&nbsp;&nbsp;Telescope Comments:</B> </TD>";
//	    print "<TD align='left'><TEXTAREA name='add_obs_telescope_comments[" . $telescope_count . "]' type='text'" .
//	     	" cols='60' rows='2'>" . $_observatory->get_telescope("comments", $telescope_count) . "</TEXTAREA></TD></TR>" . LF;
		printInputTextfieldRow("Telescope Comments", "add_obs_telescope_comments[{$telescope_count}]", 
			$_observatory->get_telescope("comments", $telescope_count));

		/** @todo improve custom error labels, location in html */
	    /** @todo add custom error labels for all necessary inputs */
	    //custom error labels
	    print "<TR><label for='add_obs_diameter[". $telescope_count . "]' class='error' style='display: none;'>Please enter a float number!</label></TR>";
	    //print "<label for='add_obs_focallength[". $telescope_count . "]' class='error' style='display: none;'>Please enter a float number!</label>";
	    print "</TABLE>";
	        
	    //INSTRUMENTS
	    //echo "ADD TELESCOPE COUNT: " . $telescope_count . " ID: " . $telescope_id . "<br>";
      	if(!is_array($_observatory->get_has_many("instruments", $telescope_id)))
			$_observatory->init_has_many("instruments", $telescope_id);

      	if(is_array($_observatory->get_has_many("instruments", $telescope_id)))
      		foreach($_observatory->get_has_many("instruments", $telescope_id) as $instrument_count => $instrument_id)
	    	{
	    		//TRANSPORT THE OLD NUMBER OF INSTRUMENTS VIA POST
	       		//print "<INPUT type='hidden' name='add_obs_instrument_ids[" . $telescope_count . "][" . $instrument_count . "]' value='". $instrument_id . "'>" . LF;

	       		print "<FIELDSET class='rfield'><LEGEND>Instrument:</LEGEND>" . LF;
      			print "<TABLE><TR><td><a href='' class='toggle_instrument'>Show Inputs</a></td></TR></TABLE>";
      			/** this table has two classes!! class='rtable' */
      			//print "<TABLE class='rtable' border='0' cellspacing='4' cellpadding='4' width='100%'>" . LF;
      			print "<TABLE class='instrument rtable' border='0' cellspacing='4' cellpadding='4' width='100%'>" . LF;
      			//TRANSPORT THE NUMBER OF TELESCOPES FOR JQUERY
      			print "<TR><INPUT type='hidden' name='instruments' class='instruments' value='".
      				  count($_observatory->get_has_many("instruments", $telescope_id)) . "'></TR>";
      			//echo "INSTRUMENTS: " . count($_observatory->get_has_many("instruments", $telescope_id)) . "<br>";

				//Instrument Name
//	      			print "<TR><TD align='left'>" .
//	          	  		  "<B>&nbsp;&nbsp;&nbsp;Instrument Name:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_name[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        			  $_observatory->get_instrument("instrument_name", $telescope_id, $instrument_count) . "' size='60'></TD></TR>" . LF;
				printInputTextRow("Instrument Name", "add_obs_instrument_name[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("instrument_name", $telescope_id, $instrument_count), 60);

				//Instrument Type
				$options = array("top" => "<OPTION value=''>Please select an Instrument Type</OPTION>",
				"bottom" => "<OPTION class='add_instrument_type' value='100000'>Add other Instrument Type</OPTION>");
				printTypeSelectListFromArray("Instrument Type", "add_obs_instrument_type_id[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("instrument_type", $telescope_id, $instrument_count), $instrument_types, "name", NULL, FALSE, $options);
//	      		print "<TR><TD align='left'>" .
//					"<B>&nbsp;&nbsp;&nbsp;Instrument Type:</B> </TD>";
//	      		print "<TD align='left'><SELECT name='add_obs_instrument_type_id[" . $telescope_count . "][" . $instrument_count . "]'>" . LF;
//	      		print "<OPTION value=''>Please select an Instrument Type</OPTION>";
//	      		foreach($instrument_types['id'] as $key => $value)
//	      		{
//	        		print "<OPTION value='" . $value . "'";
//	        		if ($value == $_observatory->get_instrument("instrument_type", $telescope_id, $instrument_count)) print " selected";	
//	        		print ">" . $instrument_types['name'][$key] . "</OPTION>" . LF;
//	     		}
//	     		print "<OPTION class='add_instrument_type' value='100000'>Add other Instrument Type</OPTION>";
//		  		print "</SELECT></TD></TR>" . LF;

	      		//Focal Position
//					print "<TR><TD align='left'>" .
//						"<B>&nbsp;&nbsp;&nbsp;Focal Position:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_focal_position[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        		  	$_observatory->get_instrument("focal_position", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Focal Position", "add_obs_instrument_focal_position[{$telescope_count}][{$instrument_count}]",
					 $_observatory->get_instrument("focal_position", $telescope_id, $instrument_count), 40);

	        	//Wavelength
	        	/** @todo add JQUERY/DB support for autocomplete (with other class than for telescopes!) */
//	      			print "<TR><TD align='left'>" .
//						"<B>&nbsp;&nbsp;&nbsp;Wavelength:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_wavelength[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//						$_observatory->get_instrument("wavelength", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Wavelength", "add_obs_instrument_wavelength[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("wavelength", $telescope_id, $instrument_count), 40);

	        	/** @todo how to implement validation here? */
	        	//Wavelength Begin
//	      		print "<TR><TD align='left'>" .
//					"<B>&nbsp;&nbsp;&nbsp;Wavelength Begin:</B> </TD>";
//	      		print "<TD align='left'><INPUT name='add_obs_instrument_wavelength_b[". $telescope_count . "][" . 
//	      		  	$instrument_count . "]' class='number' value='" .
//					$_observatory->get_instrument("wavelength_begin", $telescope_id, $instrument_count) . "' size='10'>&nbsp;&nbsp;&nbsp;" .
//					"<SELECT name='add_obs_instrument_wavelength_b_unit[" . $telescope_count . "][" . $instrument_count . "]'>";
//	      		foreach($wavelength_units['id'] as $key => $value)
//	      		{
//	        		print "<OPTION value='" . $value . "'";
//	        		if ($value == $_observatory->get_instrument("wavelength_b_unit", $telescope_id, $instrument_count)) print " selected";
//	        		print ">" . $wavelength_units['wavelength_unit'][$key] . "</OPTION>" . LF;
//	     		}
//		  		print "</SELECT></TD></TR>" . LF;
		  		print "<TR>";
				printInputTitleCol("Wavelength Begin");
				print "<TD align='left'";
				printInputText("add_obs_instrument_wavelength_b[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("wavelength_begin", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_b_unit[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "</TD></TR>" . LF;

	      		/** @todo how to implement validation here? */
	      		//Wavelength End
//	      		print "<TR><TD align='left'>" .
//	      			"<B>&nbsp;&nbsp;&nbsp;Wavelength End:</B> </TD>";
//	      		print "<TD align='left'><INPUT name='add_obs_instrument_wavelength_e[". $telescope_count . "][" . 
//	      			$instrument_count . "]' class='number' value='" .
//	      			$_observatory->get_instrument("wavelength_end", $telescope_id, $instrument_count) . "' size='10'>&nbsp;&nbsp;&nbsp;" .
//					"<SELECT name='add_obs_instrument_wavelength_e_unit[" . $telescope_count . "][" . $instrument_count . "]'>";
//	    		foreach($wavelength_units['id'] as $key => $value)
//	      		{
//	        		print "<OPTION value='" . $value . "'";
//	        		if ($value == $_observatory->get_instrument("wavelength_e_unit", $telescope_id, $instrument_count)) print " selected";
//	        		print ">" . $wavelength_units['wavelength_unit'][$key] . "</OPTION>" . LF;
//	     		}
//		  		print "</SELECT></TD></TR>" . LF;
		  		print "<TR>";
				printInputTitleCol("Wavelength End");
				print "<TD align='left'";
				printInputText("add_obs_instrument_wavelength_e[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("wavelength_end", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_e_unit[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "</TD></TR>" . LF;

	        	//Spatial Resolution
//	      			print "<TR><TD align='left'>" .
//	          	  		  "<B>&nbsp;&nbsp;&nbsp;Spatial Resolution:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_spatial_resolution[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        			  $_observatory->get_instrument("spatial_resolution", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Spatial Resolution", "add_obs_instrument_spatial_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spatial_resolution", $telescope_id, $instrument_count), 40);
	        	//Spectral Resolution
//	      			print "<TR><TD align='left'>" .
//	          	  		  "<B>&nbsp;&nbsp;&nbsp;Spectral Resolution:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_spectral_resolution[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        			  $_observatory->get_instrument("spectral_resolution", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Spectral Resolution", "add_obs_instrument_spectral_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spectral_resolution", $telescope_id, $instrument_count), 40);
	        	//Polarisation
//	      			print "<TR><TD align='left'>" .
//	          	  		  "<B>&nbsp;&nbsp;&nbsp;Polarisation:</B>&nbsp;(Polarimeter) </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_polarisation[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        			  $_observatory->get_instrument("polarisation", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Polarisation", "add_obs_instrument_polarisation[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("polarisation", $telescope_id, $instrument_count), 40, "(Polarimeter)");	  
	        	//Field of View
//	      			print "<TR><TD align='left'>" .
//	          	  		  "<B>&nbsp;&nbsp;&nbsp;Field of View:</B> </TD>";
//	      			print "<TD align='left'><INPUT name='add_obs_instrument_field_of_view[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//	        			  $_observatory->get_instrument("field_of_view", $telescope_id, $instrument_count) . "' size='40'></TD></TR>" . LF;
				printInputTextRow("Field of View", "add_obs_instrument_field_of_view[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("field_of_view", $telescope_id, $instrument_count), 40);
		        //Max Frames per sec
//				    print "<TR><TD align='left'>" .
//				          "<B>&nbsp;&nbsp;&nbsp;MAX frames:</B>&nbsp;[per second]&nbsp;(Camera) </TD>";
//				    print "<TD align='left'><INPUT name='add_obs_instrument_max_frames[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//				          $_observatory->get_instrument("max_frames_per_sec", $telescope_id, $instrument_count) . "' size='10'></TD></TR>" . LF;
				printInputTextRow("MAX frames", "add_obs_instrument_max_frames[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("max_frames_per_sec", $telescope_id, $instrument_count), 10, "[per second]&nbsp;(Camera)");
				//Frame size
//				    print "<TR><TD align='left'>" .
//				          "<B>&nbsp;&nbsp;&nbsp;Frame size:</B>&nbsp;[pixel*pixel]&nbsp;(Camera) </TD>";
//				    print "<TD align='left'><INPUT name='add_obs_instrument_frame_size[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//				          $_observatory->get_instrument("frame_size", $telescope_id, $instrument_count) . "' size='20'></TD></TR>" . LF;
				printInputTextRow("Frame size", "add_obs_instrument_frame_size[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("frame_size", $telescope_id, $instrument_count), 20, "[pixel*pixel]&nbsp;(Camera)");
				//Max exposure time
//				   print "<TR><TD align='left'>" .
//				          "<B>&nbsp;&nbsp;&nbsp;MAX exposure time:</B>&nbsp;[seconds]&nbsp;(Camera) </TD>";
//				    print "<TD align='left'><INPUT name='add_obs_instrument_max_exposure[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//				          $_observatory->get_instrument("max_exposure_time", $telescope_id, $instrument_count) . "' size='10'></TD></TR>" . LF;
				printInputTextRow("MAX exposure time", "add_obs_instrument_max_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("max_exposure_time", $telescope_id, $instrument_count), 10, "[seconds]&nbsp;(Camera)");
				//Min exposure time
//				    print "<TR><TD align='left'>" .
//				          "<B>&nbsp;&nbsp;&nbsp;MIN exposure time:</B>&nbsp;[seconds]&nbsp;(Camera) </TD>";
//				    print "<TD align='left'><INPUT name='add_obs_instrument_min_exposure[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//				          $_observatory->get_instrument("min_exposure_time", $telescope_id, $instrument_count) . "' size='10'></TD></TR>" . LF;
				printInputTextRow("MIN exposure time", "add_obs_instrument_min_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("min_exposure_time", $telescope_id, $instrument_count), 10, "[seconds]&nbsp;(Camera)");
				//Color / B/W chip
//				    print "<TR><TD align='left'><B>&nbsp;&nbsp;&nbsp;Only B/W chip?</B>&nbsp;(Camera)</TD>" .
//				          "<TD align='left'><INPUT name='add_obs_instrument_bw_chip[" . $telescope_count . "][" . 
//				    	  $instrument_count . "]' type='checkbox' value='1' ";
//				          if($_observatory->get_instrument("color_bw_chip", $telescope_id, $instrument_count)) print "checked='checked'";
//				    print "'></TD></TR>" . LF;
				printCheckBoxRow("Only B/W chip?", "add_obs_instrument_bw_chip[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("color_bw_chip", $telescope_id, $instrument_count), "(Camera)");
				//CCD chip type
//				    print "<TR><TD align='left'>" .
//				          "<B>&nbsp;&nbsp;&nbsp;CCD chip type:</B>&nbsp;(Camera)</TD>";
//				    print "<TD align='left'><INPUT name='add_obs_instrument_chip_type[" . $telescope_count . "][" . $instrument_count . "]' value='" .
//				          $_observatory->get_instrument("ccd_chip_type", $telescope_id, $instrument_count) . "' size='50'></TD></TR>" . LF;
				printInputTextRow("CCD chip type", "add_obs_instrument_chip_type[{$telescope_count}][{$instrument_count}]", 
					$_observatory->get_instrument("ccd_chip_type", $telescope_id, $instrument_count), 50, "(Camera)");

				//Instrument Comments
//	      			print "<TR><TD align='left'>" .
//	              		  "<B>&nbsp;&nbsp;&nbsp;Instrument Comments:</B> </TD>";
//	      			print "<TD align='left'><TEXTAREA name='add_obs_instrument_comments[" . $telescope_count . "][" . $instrument_count . "]' type='text'" .
//	              		  " cols='50' rows='2'>" . $_observatory->get_instrument("comments", $telescope_id, $instrument_count) . "</TEXTAREA></TD>" .
//	              		  "</TR></TABLE>" . LF;
				printInputTextfieldRow("Instrument Comments", "add_obs_instrument_comments[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("comments", $telescope_id, $instrument_count), 50);

//				if($instrument_count == (count($_observatory->get_has_many("instruments", $telescope_id)) - 1))
//      				print "<TABLE class='instrument_button'><TR><td><a class='add_instrument' href=''>Add Instrument</a></td></TR></TABLE>";
//      			else
//      				print "<TABLE class='instrument_button'><TR><td><a href='' class='remove_instrument'>Delete Instrument</a></td></TR></TABLE>";
				PrintAddRemoveButton($instrument_count, $_observatory->get_has_many("instruments", $telescope_id), "instrument");
	      			
	      		/** @todo add custom error labels for all necessary inputs */
				print "</FIELDSET>" . LF;
	    	}
	    		
//	    if($telescope_count == (count($_observatory->get_has_many("telescopes")) - 1))
//      		print "<TABLE class='telescope_button'><TR><td><a class='add_telescope' href=''>Add Telescope</a></td></tr></TABLE>";
//      	else
//      		print "<TABLE class='telescope_button'><TR><td><a href='' class='remove_telescope'>Delete Telescope</a></td></tr></TABLE>";
		PrintAddRemoveButton($telescope_count, $_observatory->get_has_many("telescopes"), "telescope");

      	print "</FIELDSET>" . LF;
	}

//ADDITIONAL INFORMATION:
print "<FIELDSET class='rfield'><LEGEND>Additional Information</LEGEND>" . LF;
print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;
//Further contacts
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Further contacts:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_fur_con' type='text'" .
//	" cols='60' rows='2'>" . $_observatory->get_add_info('further_contacts') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Further contacts", "add_obs_fur_con", $_observatory->get_add_info('further_contacts'));
//Instrument comments
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Instrument comments:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_inst_com' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('instrument_comments') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Instrument comments", "add_obs_inst_com", $_observatory->get_add_info('instrument_comments'));
//Additional instruments
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Additional instruments:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_add_inst' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('additional_instruments') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Additional instruments", "add_obs_add_inst", $_observatory->get_add_info('additional_instruments'));
//Array description
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Array description:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_array_desc' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('array_description') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Array description", "add_obs_array_desc", $_observatory->get_add_info('array_description'));
//Backend description
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Backend description:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_backend_desc' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('backend_description') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Backend description", "add_obs_backend_desc", $_observatory->get_add_info('backend_description'));
//Research comments
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;Research comments:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_research_com' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('research_comments') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("Research comments", "add_obs_research_com", $_observatory->get_add_info('research_comments'));
//General comments
//print "<TR><TD align='left'>" .
//	"<B>&nbsp;&nbsp;&nbsp;General comments:</B></TD>";
//print "<TD align='left'><TEXTAREA name='add_obs_gen_com' type='text'" .
//	"' cols='60' rows='2'>" . $_observatory->get_add_info('general_comments') . "</TEXTAREA></TD></TR>" . LF;
printInputTextfieldRow("General comments", "add_obs_gen_com", $_observatory->get_add_info('general_comments'));
print "</TABLE></FIELDSET>" . LF;

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
PrintActionButton($action);

?>