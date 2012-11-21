<?php
/**
 * @file ObservatoryCreateUpdate.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 * 
 * NEW TOOLTIPS ADDED!!
 */

print "<div><input type='hidden' name='page' value='add'/>" . LF;
print "<input type='hidden' name='add_res_id' value='{$resource_id}'/>" . LF;
print "<input type='hidden' name='res_type' value='{$resource_type}'/></div>" . LF;
//show_message();

print "<h3 class='red'>The NA1 Matrix is currently in a testing phase. If you stumble upon any problems or errors, 
please feel free to inform the team listed at the bottom of this page.</h3>";
print "<h3>Important information:</h3>";
print "<p>Please be aware that every field in the input form below marked with a <b>red asterisk</b> (<b class='red'>*</b>) is a <b>mandatory</b> field, these are &quot;Facility name&quot;, 
&quot;Country&quot;, “Areas of Interest&quot;, and at least one telescope (&quot;Telescope Name&quot;, &quot;Telescope Type&quot;, “Wavelength Region&quot;, 
&quot;Diameter/Aperture&quot;).<br/> The facility can not be added until valid information is provided for each mandatory field! 
All other fields are optional. Only the fields you have entered will be shown in the details window of your entry.<br/>
By mouse over the name of the input-field (e.g. mouse over &quot;Facility name&quot;) tool tips and examples of potential 
inputs will appear. Please be aware that the standard formats of the inputs are Arabic numbers and Latin letters; 
in float numbers the decimal places should be separated with &quot;.&quot;, e.g. &quot;8.9&quot;.</p>";

print "<fieldset class='rfield'><legend>Ground-based Facility General</legend>" . LF;
print "<table class='create'>" . LF; 

//Observatory Name - MANDATORY / CHECK IF THE NAME ALREADY EXISTS!
/** @todo THIS IS A LITTLE HACK, WE DONT CHECK FOR EXISTING NAMES IF EDITING */
$name_tooltip = "Facility Name - Please fill in the name of your facility. Please be aware that this is a 
MANDATORY FIELD.<br/>If the facility is privately owned, and has no specific name, - you can simply 
fill in &quot;Privately owned&quot;.<br/><b>Example:</b> &quot;Observatory Kanzelh&ouml;he&quot;";
if($action == "edit")
	printInputTextRow("Facility Name", "update_obs_name", $_observatory->get_field("obs_name"), 
			80, NULL, NULL, TRUE, $name_tooltip);
else
	printInputTextRow("Facility Name", "add_obs_name", $_observatory->get_field("obs_name"), 
			80, NULL, NULL, TRUE, $name_tooltip);
			
//IAU Code (see: http://www.minorplanetcenter.net/iau/lists/ObsCodesF.html)
$iau_tooltip = "IAU Code - Please provide the IAU Code if available for the Observatory";
printInputTextRow("IAU Code", "add_obs_iau_code", $_observatory->get_field("obs_iau_code"), 
			10, NULL, NULL, FALSE, $iau_tooltip);

//Year Founded - check if it is a YEAR
$year_tooltip = "Year Founded - Please insert the year [YYYY] the facility was founded. 
<br/><b>Example:</b> &quot;1968&quot;";
printInputTextRow("Year Founded", "add_obs_founded", $_observatory->get_field("obs_founded"), 
			10, "[YYYY]", "add_obs_founded", FALSE, $year_tooltip);
//Institution
$institution_tooltip = "Institution - Please insert the institution/owner of the facility.<br/>
If it is privately owned, you can simply fill in &quot;privately owned facility&quot;. <br/><b>Example:</b> 
&quot;Space Research Institute, Austrian Academy of Sciences&quot;";
printInputTextRow("Institution", "add_obs_institution", $_observatory->get_field("obs_institution"),
			80, NULL, NULL, FALSE, $institution_tooltip);
//Web Address
$web_tooltip = "Web Address - Please insert the web address of the facility.<br/>
Please be aware that this has to be a valid URL.<br/><b>Example:</b> &quot;http://www.jach.hawaii.edu/JCMT/&quot;";
printInputTextRow("Web Address", "add_obs_web_address", $_observatory->get_field("obs_web_address"), 
			80, "[http://...]", NULL, FALSE, $web_tooltip);
//Address
$address_tooltip = "Address - Please insert the address of your facility.<br/> 
i.e. the street name and name number, the city/area, and the ZIP code.<br/>
<b>Example:</b> &quot;650 North A&#39;ohoku Place Hilo, 96720, Hawaii&quot;";
printInputTextRow("Address", "add_obs_address", $_observatory->get_field("obs_address"), 
			80, NULL, NULL, FALSE, $address_tooltip);
//Country - MANDATORY
$country_tooltip = "Country - Please insert the country name where the facility is located.<br/>
Please be aware that this is a MANDATORY FIELD.<br/>
<b>Example:</b> &quot;United Kingdom&quot;";
$countries = $_observatory->get_countries();
$options = array("<option value=''>Please choose...</option>");
printSelectListRowFromArray("Country", "add_obs_country_id", $_observatory->get_field("obs_country_id"), 
			$countries, "name", NULL, TRUE, $options, $country_tooltip);
//Phone
$phone_tooltip = "Phone - Please insert the phone-number in the following way:<br/>
[+XX-YYY-ZZZ-ZZZZ] with X=country code, Y=area code, Z=local number.<br/>
<b>Example:</b> &quot;+56-51-205-600&quot;";
printInputTextRow("Phone", "add_obs_phone", $_observatory->get_field("obs_phone"), 
			30, NULL, NULL, FALSE, $phone_tooltip);
//Email
$email_tooltip = "Email - Please insert your email-address<br/>
(or at least the email-address of the potential contact person).<br/> 
Please be aware that the email-address has to be valid.<br/>
<b>Example:</b> &quot;john.doe@example.com&quot;";
printInputTextRow("Email", "add_obs_email", $_observatory->get_field("obs_email"), 
			30, NULL, NULL, FALSE, $email_tooltip);

//Latitude			
$gps_tooltip = "Please insert the geographic position of the facility,<br/> 
ideally in World Geodetic System 1984 (WGS84) format.<br/>
If the geographic position is in any other format, <br/>the position on the map can differ up to more than 100 m.<br/>
Both, latitude & longitude should be entered in Degree (&deg;), Minutes (&#39;),<br/> Seconds (&#39;&#39;), and hundredths of a Second (.&#39;&#39;).<br/>
So if you want to enter 56&deg;21&#39;23.1&#39;&#39; &#8212; [56]&deg; [21]&#39; [23]. [10]&#39;&#39";
$lat_tooltip = "Latitude - " . $gps_tooltip;
print "<tr>";
printInputTitleCol("Latitude", NULL, FALSE, $lat_tooltip);
print "<td align='left'>";
printSimpleSelectListFromArray("add_obs_latitude[prefix]", $_observatory->get_field_array("obs_latitude", "prefix"),
	$_observatory->_latitudePrefixes);
ws(4);
printInputText("add_obs_latitude[degree]", $_observatory->get_field_array("obs_latitude", "degree"), 3, "digits", "&deg;");
ws(4);
printInputText("add_obs_latitude[minutes]", $_observatory->get_field_array("obs_latitude", "minutes"), 2, "digits", "'");
ws(4);
printInputText("add_obs_latitude[seconds]", $_observatory->get_field_array("obs_latitude", "seconds"), 2, "digits", ".");
ws(1);
printInputText("add_obs_latitude[cent]", $_observatory->get_field_array("obs_latitude", "cent"), 2, "digits", "''");
print "</td></tr>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<tr><td></td><td>";
print "<label for='add_obs_latitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "</td></tr>";

//Longitude
$long_tooltip = "Longitude - " . $gps_tooltip; 
print "<tr>";
printInputTitleCol("Longitude", NULL, FALSE, $long_tooltip);
print "<td align='left'>";
printSimpleSelectListFromArray("add_obs_longitude[prefix]", $_observatory->get_field_array("obs_longitude", "prefix"),
	$_observatory->_longitudePrefixes);
ws(5);
printInputText("add_obs_longitude[degree]", $_observatory->get_field_array("obs_longitude", "degree"), 3, "digits", "&deg;");
ws(4);
printInputText("add_obs_longitude[minutes]", $_observatory->get_field_array("obs_longitude", "minutes"), 2, "digits", "'");
ws(4);
printInputText("add_obs_longitude[seconds]", $_observatory->get_field_array("obs_longitude", "seconds"), 2, "digits", ".");
ws(1);
printInputText("add_obs_longitude[cent]", $_observatory->get_field_array("obs_longitude", "cent"), 2, "digits", "''");
print "</td></tr>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<tr><td></td><td>";
print "<label for='add_obs_longitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "</td></tr>";

//Approximate position
$pos_tooltip = "Approximate Position - Please insert an approximate position of the facility.<br/>
This is a good option if you do not want to publish the exact position of the <br/>
facility in geographic coordinates (see input above) for any reason.<br/>
The approximate position should be some local information, <br/>
like a city or region where the facility is located.<br/>
An approximate position for the Observatory Lustb&uuml;hel near Graz, Austria<br/> would therefore e.g. be the city of Graz.<br/>
If you have a mobile observing facility, then you can also state this here.<br/> <b>Example:</b> &quot;Mobile facility, generally located near Graz.&quot;";
printInputTextRow("Approximate Position", "add_obs_position", $_observatory->get_field("obs_approx_position"), 
			80, NULL, NULL, FALSE, $pos_tooltip);
//Sealevel
$sealevel_tooltip = "Altitude - Please insert the altitude of the facility (in meters above sea level).<br/>
<b>Example:</b> &quot;353&quot;";
printInputTextRow("Altitude", "add_obs_sealevel", $_observatory->get_field("obs_sealevel_m"), 
			10, "[m]", NULL, FALSE, $sealevel_tooltip);
//Precipitation range
$p_tooltip = "Precipitation Range - Please choose the precipitation range of the region of your facility,<br/>
i.e. the precipitation per year in millimeters. If it is not given, unclear, <br/>
or you just mean it is not worth being displayed, please leave the default value (&quot;---&quot;).";
$p_ranges = $_observatory->get_precipitation_ranges();
printSelectListRowFromArray("Precipitiation Range", "add_obs_precip_id", $_observatory->get_field("obs_precipitation"), 
			$p_ranges, "range", "[mm/Y]", FALSE, array(), $p_tooltip);
//Clear nights
$c_tooltip = "Clear Nights - Please choose the clear nights of the region of your facility,<br/>
i.e. nights (or days in case of e.g. solar observatories)<br/> in which reasonable observations are possible.
If it is not given, unclear, <br/>or you just mean it is not worth being displayed, please leave the default value (&quot;---&quot;).";
$c_ranges = $_observatory->get_clearnights_ranges();
printSelectListRowFromArray("Clear Nights", "add_obs_clearnights_id", $_observatory->get_field("obs_clear_nights"), 
			$c_ranges, "range", "[D]", FALSE, array(), $c_tooltip);
//Timezone
$time_tooltip = "Timezone - Please select the timezone of the region of your facility. <br/>
Please be aware that the timezone is in Greenwich Mean Time (GMT) plus/minus hours, <br/>
i.e. originally the mean solar time at Royal Observatory London in Greenwich, UK.<br/>
So the Royal Observatory’s timezone is &quot;GMT+00&quot;.";
$timezones = $_observatory->get_timezones();
printSelectListRowFromArray("Timezone", "add_obs_timezone_id", $_observatory->get_field("obs_timezone"),
			$timezones, "timezone", "[GMT+/-]", FALSE, array(), $time_tooltip);
//Facility Status
$status_tooltip = "Facility Status - Please insert the status, of your facility, i.e. if it is active in research, <br/>
just for public outreach, inoperative, or anything else.<br/>
<b>Example:</b> &quot;Currently under construction&quot;";
printInputTextRow("Facility Status", "add_obs_status", $_observatory->get_field("obs_observatory_status"), 
			80, NULL, NULL, FALSE, $status_tooltip);
//Partner Facilities
$partner_tooltip = "Partner/Umbrella Facilities - Please insert potential partner observatories/facilities and/or partner institutions.<br/>
If there are more than one, please separate them with commas and a blank character.<br/>
<b>Example:</b> &quot;Observatory Kanzelh&ouml;he&quot;;<br/>
<b>Example for more than one partner observatory:</b> &quot;Observatory Kanzelh&ouml;he,<br/>
Observatory Hvar, Observatory Lustb&uuml;hel";
printInputTextRow("Partner/Umbrella Facilities", "add_obs_partner", $_observatory->get_field("obs_partner_observatories"),
			80, NULL, "partner", FALSE, $partner_tooltip);
//General comments
$comm_tooltip = "General Comments - Please feel free to write any general comments in this box. There are no format conventions.<br/>
<b>Examples:</b> &quot;Any feedbacks are highly welcome!&quot; or &quot;My facility is a mobile one!&quot;";
printInputTextfieldRow("General Comments", "add_obs_gen_com", $_observatory->get_add_info('general_comments'),
			70, 4, NULL, FALSE, $comm_tooltip);
print "</table></fieldset>" . LF;

//SCIENTIFIC CONTACTS
//maybe improve this tooltip a bit!
$contact_tooltip = "Scientific Contacts - Please insert a scientific contact of the facility,<br/>
i.e. someone who should be contacted for scientific purposes,<br/>
like participation in an observation campaign. <br/>Please be aware that the email-address has to be valid.<br/>
You can add 1 to N scientific contacts by clicking ADD.<br/>
Removing an entry is handled by clicking DEL<br/> (only appears after one has clicked on ADD)<br/>
or clearing the fields of the added entry manually.<br/>
<b>Example:</b> Name &quot;John Doe&quot;, Email &quot;john.doe@example.com&quot;,<br/> Institution &quot;Fantasia Institute&quot;";
print "<fieldset class='rfield'><legend class='help' title='". $contact_tooltip ."'>Scientific Contacts:</legend>" . LF;
print "<table class='create'>" . LF;
print "<tr><th class='help' title='". $contact_tooltip ."'></th><th class='help ui-widget-header' title='". $contact_tooltip ."'>";
print "Name</th><th class='ui-widget-header'>Email</th><th class='ui-widget-header'>Institution</th></tr>";
if(!is_array($_observatory->get_has_many("scientific_contacts")))
	$_observatory->init_has_many("scientific_contacts");
//PROOF IF THERE IS AN ARRAY!
if(is_array($_observatory->get_has_many("scientific_contacts")))
	foreach($_observatory->get_has_many("scientific_contacts") as $contact_count => $contact_id)
	{
		print "<tr>";
		printAddRemoveButton($contact_count, $_observatory->get_has_many("scientific_contacts"), "contact", FALSE);
		printInputTextCol("add_obs_sci_con_name[{$contact_count}]",
			$_observatory->get_scientific_contact("sci_con_name", $contact_count), 30, "align='center'");
		printInputTextCol("add_obs_sci_con_email[{$contact_count}]",
			$_observatory->get_scientific_contact("sci_con_email", $contact_count), 30, "align='center'");
		printInputTextCol("add_obs_sci_con_institution[{$contact_count}]",
			$_observatory->get_scientific_contact("sci_con_institution", $contact_count), 30, "align='center'");
		print "</tr>" .
			//TRANSPORT THE OLD NUMBER OF SCIENTIFIC CONTACTS VIA POST
            "<tr><td colspan='4'><input type='hidden' name='add_obs_sci_con_ids[" . $contact_count . "]' value='". $contact_id . "'/></td></tr>";
	}
print "</table><table class='create'>";
//Further contacts
$furcon_tooltip = "Further Contacts - Please feel free to write any sort of contact information text in this box.<br/>
There are no format conventions.<br/>
<b>Example:</b> &quot;For data enquiries, please visit our website: http://www.example.com/data&quot;";
printInputTextfieldRow("Further Contacts", "add_obs_fur_con", $_observatory->get_add_info('further_contacts'),
			65, 3, NULL, FALSE, $furcon_tooltip);
print "</table></fieldset>" . LF;

//HIDDEN FIELDS:
//maybe improve this tooltip a bit!
$hidden_tooltip = "Hidden Fields - In case you want to hide some of the contact information you have<br/> entered above, 
please click on the relevant boxes below.<br/>
<b>Example:</b> By clicking on &quot;Email&quot;, the email-address WILL NOT<br/>
be displayed in the public database, even if you have filled out<br/>
the corresponding input-field &quot;Email&quot; above.<br/>
In that case, only the administrators of the matrix will have<br/> the knowledge of the email-address.";
print "<fieldset class='rfield'><legend class='help' title='". $hidden_tooltip . "'>Hidden Fields: You may want to hide some contact information</legend>" . LF;
print "<table class='create'>" . LF;
printMultipleCheckBoxRow("add_obs_hide", $_observatory->get_hidden_fields());
print "</table></fieldset>" . LF;

//RESEARCH AREAS - MANDATORY
$research_tooltip = "Areas of Interest - Please select research areas of interest. If interested in every research field,
or if research in every<br/> field is potentially possible with the facility please choose &quot;General Astronomy&quot;,<br/>
which subsumes every research area, i.e. if choosing &quot;General Astronomy&quot; the facility will<br/> appear under every search via &quot;Filter by Areas of Research&quot;.<br/>
Choosing more than one area of interest is possible by adding them with clicking on the <b>[+]</b> button,<br/> deleting an already chosen area by clicking on the <b>[-]</b>.<br/>
You can also search for specific topics via the input field at the top of the available &quot;Area of Interest&quot; box.<br/>
&quot;Areas of Interest&quot; are intending two different purposes:<br/>
<b>i)</b> <i>Mainly for observatories hosted by scientific institutions:</i><br/> &quot;Areas of Interest&quot; is virtually identical to &quot;Research Areas&quot;,
i.e. the scientific area for <br/>which the facility is intended and viable.<br/>
<b>ii)</b> <i>Mainly for privately owned facilities:</i><br/>
&quot;Areas of Interest&quot; represents (besides potential &quot;Research Areas&quot;) scientific fields,<br/> in which the owner is &quot;interested&quot;.<br/>
<b>Example:</b> If you want to observe exoplanets you are advised to add &quot;Exoplanetary Research&quot; to<br/> your &quot;Areas of Interest&quot;. 
If someone is planning to organize combined observations of exoplanets,<br/>
this person can search for potentially interested persons via the search engine of the matrix,<br/> will find you and maybe contact you to participate.";
print "<fieldset class='rfield'><legend class='help' title='{$research_tooltip}'>Areas of Interest:</legend>" . LF;
print "<table id='research_areas' class='create'>" . LF;
//print "<table class='create'>" . LF;
$research_areas = $_observatory->get_research_areas();

//// ---------------- Questionnaire Start ----------------------
//if ($_SESSION["user_level"] <= 11)
//	$options = array("<option value=''>Please choose one or several by holding CTRL...</option>");
//else
//// ---------------- Questionnaire End ----------------------
//	$options = array("<option value=''>Please choose one or several by holding CTRL...</option>",
//		"<option id='add_other_area' value='100000'>Add other Research Area</option>");
printBigSelectListFromArray("Areas of Interest", "add_obs_res_are_ids[]",
	$_observatory->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, array() , $research_tooltip);
//Research comments
$rescomm_tooltip = "Research Comments - Please feel free to write any comments on your areas of interest. There are no format conventions.<br/>
<b>Example:</b> &quot;Involved in the Stellar Occultation Network&quot;";
printInputTextfieldRow("Research Comments", "add_obs_research_com", $_observatory->get_add_info('research_comments'),
			65, 4, NULL, FALSE, $rescomm_tooltip);
print "</table></fieldset>" . LF;
//ADD OTHER AREAS OF INTEREST
if ($_SESSION["user_level"] >= 31)
{
	print "<fieldset class='rfield'><legend><b class='red'>Administration Tool</b></legend>" . LF;
	print "<div id='add_other_area' style='margin:10px 0'><a class='ui-state-default ui-corner-all hand' id='add_other_area' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
	print "<span class='ui-icon ui-icon-plus' style='position:absolute;top:4px;left:1px'></span>" ;
	print "Add new Area of Interest</a></div>";
	print "</fieldset>" . LF;
}

//TARGETS: NOT MANDADORY
/** @todo add other implementieren, aber mit eigenem feld! (siehe oben) */
$target_tooltip = "Planetary Science Targets - Please select planetary science targets. If interested in every target, or if observation for every<br/> target category 
is potentially possible with the facility, please choose &quot;ALL&quot;,<br/> which subsumes every target; i.e. if choosing &quot;ALL&quot; the facility will appear 
under every search via<br/> &quot;Filter by Targets&quot;. Choosing more than one target is possible by adding them with clicking 
on the <br/><b>[+]</b> button, deleting an already chosen target by clicking on the <b>[-]</b> button.<br/> You can also search for 
specific topics via the input field just at the top of the<br/> &quot;Planetary Science Targets&quot; box.";
print "<fieldset class='rfield'><legend class='help' title='{$target_tooltip}'>Planetary Science Targets:</legend>" . LF;
//print "<table id='targets' class='create'>" . LF;
print "<table class='create'>" . LF;
$targets = $_observatory->get_targets();
//$options = array("<option value=''>Please choose one or several by holding CTRL...</option>");
//$options = array("Please choose one or several by holding CTRL...",
//"<option id='other' value='100000'>Add other Target</option>");
printBigSelectListFromArray("Targets", "add_obs_target_ids[]", $_observatory->get_has_many("targets"),
	$targets, "target_name", NULL, FALSE, array(), $target_tooltip);
//Target comments
$targetcomm_tooltip = "Target Comments - Please feel free to write any comments on your planetary science targets. There are no format conventions.";
printInputTextfieldRow("Target Comments", "add_obs_target_com", $_observatory->get_add_info('target_comments'),
			65, 4, NULL, FALSE, $targetcomm_tooltip);
print "</table></fieldset>" . LF;

//TELESCOPES: at least 1 ENTRY MANDATORY! (JQUERY)
//getting all necessary types / units only calling them once
$telescope_types = $_observatory->get_telescope_types();
$antenna_types = $_observatory->get_antenna_types();
$instrument_types = $_observatory->get_instrument_types();
$wavelength_units = $_observatory->get_wavelength_units();

if(!is_array($_observatory->get_has_many("telescopes")))
	$_observatory->init_has_many("telescopes");

if(is_array($_observatory->get_has_many("telescopes")))
{
	print "<div id='tabbed-tele'>";
	print "<div style='margin:10px 5px'><a class='ui-state-default ui-corner-all add_telescope' href='' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
	print "<span class='ui-icon ui-icon-plus' style='position:absolute;top:4px;left:1px'></span>" ;
	print "Add new Telescope</a></div>";
	print "<ul>";
	foreach($_observatory->get_has_many("telescopes") as $telescope_count => $telescope_id)
	{
	
		if($_observatory->get_telescope("telescope_name", $telescope_count))	
			print "<li><a href='#telescope-{$telescope_count}'>" . $_observatory->get_telescope("telescope_name", $telescope_count) ."</a>";
		else
			print "<li><a href='#telescope-{$telescope_count}'>Telescope " . ($telescope_count + 1) ."</a>";
			
		print " <span class='ui-icon ui-icon-close'>Remove Tab</span></li>";
	}
	print "</ul>";
	
	foreach($_observatory->get_has_many("telescopes") as $telescope_count => $telescope_id)
	{	
		/** @todo use this for determining deletion / update / add => MAYBE THIS IS THE SOURCE OF DUPLICATION SOMETIMES?*/
  		//TRANSPORT THE OLD NUMBER OF TELESCOPES VIA POST
	    print "<input type='hidden' name='add_obs_telescope_ids[" . $telescope_count . "]' value='". $telescope_id . "'/>" . LF;
		print "<div class='telescope' id='telescope-{$telescope_count}'>";
		
		$t_tooltip = "Telescope - You can add 1 to N telescopes to an entry by clicking &quot;Add new Telescope&quot;. - 
		By clicking on the ‘x’-button of a telescope-tab you can delete the corresponding telescope field. - 
		Please be aware that giving information on at least one telescope is MANDATORY - (&quot;Telescope Name&quot;, &quot;Telescope Type&quot;, 
		&quot;Wavelength Region&quot;, &quot;Diameter/Aperture&quot;), - i.e. at least one telescope-tab will always be visible.";
		
      	print "<fieldset class='rfield'><legend class='help' title='{$t_tooltip}'>Telescope:</legend>" . LF;
      	print "<table class='create'>" . LF;
      	
        /** @todo add custom error labels for all necessary inputs */

	    //Telescope Name
	    $t_name_tooltip ="Telescope Name - Please insert the name of the telescope or a common abbreviation of the telescope - 
	    (if possible with the full name after a hyphen). - Please be aware that this field supports auto-completion. <br/>There are no format conventions.
	    Please be aware that at least one telescope is - mandatory (including &quot;Telescope Name&quot;, &quot;Telescope Type&quot;, - 
	     &quot;Diameter/Aperture&quot;, and &quot;Wavelength Region&quot;). - 
	    <b>Examples:</b> &quot;ALMA 12 m telescope&quot; or &quot;APEX &ndash; Atacama Pathfinder EXperiment&quot;.";
		printInputTextRow("Telescope Name", "add_obs_telescope_name[{$telescope_count}]",
			 $_observatory->get_telescope("telescope_name", $telescope_count), 60, NULL, "telescope", TRUE, $t_name_tooltip);

		//Telescope Type
		$t_type_tooltip = "Telescope Type - Please choose the type of your telescope from the drop-down box. - 
		If the appropriate telescope type is not in the list, please choose the option &quot;Other&quot;. - 
		You can then specify your telescope under &quot;Telescope Comments&quot;. - 
		Please be aware that this ia a MANDATORY field.";
		//  ---------------- Questionnaire Start ----------------------
		if ($_SESSION["user_level"] <= 11)
			$options = array("top" => "<option value=''>Please select a Telescope Type</option>");
		else
		//  ---------------- Questionnaire End ----------------------
			$options = array("top" => "<option value=''>Please select a Telescope Type</option>",
				"bottom" => "<option class='add_telescope_type' value='100000'>Add other Telescope Type</option>");
		printTypeSelectListFromArray("Telescope Type", "add_obs_telescope_type_id[{$telescope_count}]",
		 $_observatory->get_telescope("telescope_type", $telescope_count), $telescope_types, "name", NULL, TRUE, $options, $t_type_tooltip);
		 
		//Mobile Flag
		$t_mobile_flag = "Mobile Station? - Please click on the check box if this telescope is a mobile station.";
		printCheckBoxRow("Mobile Station?", "add_obs_mobile_flag[{$telescope_count}]",
			$_observatory->get_telescope("mobile_flag", $telescope_count), NULL, FALSE, $t_mobile_flag);

	    //Telescope Elements
	    $t_elem_tooltip = "Telescope Elements - Please insert the number of elements of the telescope, if more than one. - 
	    This field is particularly of interest if the telescope is an array (of any kind). - 
	    If it is a telescope consisting of only one element (e.g. a normal Newton-telescope), - please insert nothing. <b>Example:</b> &quot;12&quot;";
		printInputTextRow("Telescope Elements", "add_obs_telescope_elements[{$telescope_count}]",
			$_observatory->get_telescope("telescope_elements", $telescope_count), 15, NULL, NULL, FALSE, $t_elem_tooltip);

	    //Diameter/Aperture
	    $t_dia_tooltip = "Diameter/Aperture - Please insert the diameter/aperture of the telescope in meters. - 
	    If the diameter/aperture is not defined, please enter the diameter as 0 (zero). - 
	    The inserted value will be added to the database as a float value. - 
	    Please be aware that this is a MANDATORY field. - <b>Examples:</b> &quot;2&quot; or &quot;1.42&quot;";
		printInputTextRow("Diameter/Aperture", "add_obs_diameter[{$telescope_count}]",
			$_observatory->get_telescope("diameter_m", $telescope_count), 15, "[m]", "number", TRUE, $t_dia_tooltip);

	    //Focallength
	    $t_focal_tooltip = "Focallength - Please insert the focal length of the telescope (in meters) or f-number. - 
	    For the f-number please insert with format f/.... <b>Examples:</b> &quot;1.5&quot; or &quot;f/1.4&quot;";
		printInputTextRow("Focallength", "add_obs_focallength[{$telescope_count}]",
			$_observatory->get_telescope("focallength_m", $telescope_count), 15, "[m] or [f-number]", NULL, FALSE, $t_focal_tooltip);

		//  ---------------- Questionnaire Start ----------------------
		$t_antenna_tooltip = "Antenna Type - Please choose the type of your antenna from the drop-down box if relevant. - 
		Otherwise keep &quot;---&quot;. - 
		If the appropriate antenna type is not in the list, please choose the option &quot;Other&quot;. - 
		You can then specify your antenna under - &quot;Telescope Comments&quot; or &quot;Array Description&quot;.";
		if ($_SESSION["user_level"] <= 11)
			$options = array();
		//Antenna Type
	    else
	    //  ---------------- Questionnaire End ----------------------
			$options = array("bottom" => "<option class='add_antenna_type' value='100000'>Add other Type</option>");
		printTypeSelectListFromArray("Antenna Type", "add_obs_antenna_type_id[{$telescope_count}]",
			$_observatory->get_telescope("antenna_type", $telescope_count), $antenna_types, "antenna_type", NULL, FALSE, $options, $t_antenna_tooltip);

		//Wavelength
		$wavelength_ranges = $_observatory->get_wavelength_ranges();
		$t_wave_tooltip = "Wavelength Region - Please click on the wavelength region(s) of your telescope. - 
		You can also choose more than one wavelength region. - 
		Please be aware that this is a MANDATORY field.";
//		printInputTextRow("Wavelength Region", "add_obs_wavelength[{$telescope_count}]",
//			$_observatory->get_telescope("wavelength", $telescope_count), 40, NULL, "wavelength", TRUE, $wave_tooltip);
		print "<tr>";
		printInputTitleCol("Wavelength Region", NULL, true, $t_wave_tooltip);
		print "<td>";
		$ranges_array = explode(", ", $_observatory->get_telescope("wavelength", $telescope_count));
		foreach($wavelength_ranges['id'] as $key => $value)
		{
			print "<b>{$wavelength_ranges['acronym'][$key]}</b>";
			if(in_array($wavelength_ranges['acronym'][$key], $ranges_array))
				printCheckBox("add_obs_wavelength_{$key}[{$telescope_count}]", $wavelength_ranges['acronym'][$key]);
			else
				printCheckBox("add_obs_wavelength_{$key}[{$telescope_count}]", false);
			ws(4);
			//just make a newline at the fourth checkbox
			if ($key == 4)
				nl();
		}
		print "</td>";
		print "</tr>";

	    //Wavelength/Freq Begin
	    $wave_begin_tooltip ="Wavelength or Freq. Begin - Please insert the beginning of the wavelength or frequency range. - 
	    The appropriate wavelength or frequency units should be selected - from the adjacent drop-down box. - 
	    Please note that if a numerical value is entered, then the units field - becomes mandatory. - 
	    <b>Example:</b> &quot;83.0&quot; &quot;GHz&quot;";
	    print "<tr>";
		printInputTitleCol("Wavelength or Freq. Begin", NULL, FALSE, $wave_begin_tooltip);
		print "<td align='left'>";
		printInputText("add_obs_wavelength_b[{$telescope_count}]", $_observatory->get_telescope("wavelength_begin", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_b_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_b_unit", $telescope_count),
			$wavelength_units, "wavelength_unit");
		print "<label for='add_obs_wavelength_b[{$telescope_count}]' class='error' style='display: none;'>Please enter a float number!</label>";
		print "</td></tr>" . LF;

		//Wavelength/Freq End
		$wave_end_tooltip = "Wavelength or Freq. End - Please insert the end of the wavelength or frequency range. - 
	    The appropriate wavelength or frequency units should be selected - from the adjacent drop-down box. - 
	    Please note that if a numerical value is entered, then the units field - becomes mandatory. - 
	    <b>Example:</b> &quot;83.0&quot; &quot;GHz&quot;";
	    print "<tr>";
		printInputTitleCol("Wavelength or Freq. End", NULL, FALSE, $wave_end_tooltip);
		print "<td align='left'>";
		printInputText("add_obs_wavelength_e[{$telescope_count}]", $_observatory->get_telescope("wavelength_end", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_e_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_e_unit", $telescope_count),
			$wavelength_units, "wavelength_unit");
		print "<label for='add_obs_wavelength_e[{$telescope_count}]' class='error' style='display: none;'>Please enter a float number!</label>";
		print "</td></tr>" . LF;

	    //Telescope Comments
	    $t_comm_tooltip = "Telescope Comments - 
	    Please feel free to write any additional information about your telescope in this box. - 
	    You can e.g. display the link to the manufacturer of the telescope. - 
	    There are no format conventions. - 
	    <b>Examples:</b> &quot;New telescope will be installed soon.&quot;, - 
	    &quot;Antenna Type: Half-Wave Dipole&quot;, or - 
	    &quot;Details on the telescope: http://www.telescopedetails.com&quot;";
		printInputTextfieldRow("Telescope Comments", "add_obs_telescope_comments[{$telescope_count}]",
			$_observatory->get_telescope("comments", $telescope_count), 60, 4, NULL, FALSE, $t_comm_tooltip);
	    print "</table>";
	    
	    print "<div style='margin:10px 0'><a class='ui-state-default ui-corner-all add_instrument' href='' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
		print "<span class='ui-icon ui-icon-plus' style='position:absolute;top:4px;left:1px'></span>" ;
		print "Add new Instrument</a></div>";

	    //INSTRUMENTS
	    //echo "ADD TELESCOPE COUNT: " . $telescope_count . " ID: " . $telescope_id . "<br>";
      	if(!is_array($_observatory->get_has_many("instruments", $telescope_id)))
			$_observatory->init_has_many("instruments", $telescope_id);

      	if(is_array($_observatory->get_has_many("instruments", $telescope_id)))
      		foreach($_observatory->get_has_many("instruments", $telescope_id) as $instrument_count => $instrument_id)
	    	{
	    		//TRANSPORT THE OLD NUMBER OF INSTRUMENTS VIA POST
	       		//print "<input type='hidden' name='add_obs_instrument_ids[" . $telescope_count . "][" . $instrument_count . "]' value='". $instrument_id . "'/>" . LF;
	       		
	    		$i_tooltip = "Instrument - You can add additional 1 to N instruments to a telescope by clicking &quot;Add new Instrument&quot;. - 
	    		By clicking &quot;Remove Instrument&quot; at the corresponding instrument field, - you can remove the instrument.
	    		Additionally you can hide the inputs of an instrument by - clicking &quot;Hide Input Fields&quot;. 
	    		The inputs will not be erased by clicking &quot;Hide Inputs&quot;. - 
	    		By clicking &quot;Show Input Fields&quot; they will appear again.";

	       		print "<fieldset class='rfield'><legend class='help' title='{$i_tooltip}'>Instrument:</legend>" . LF;
      			print "<div style='margin:10px 0'><a href='' class='ui-state-default ui-corner-all toggle_instrument' style='padding:6px 6px 6px 6px;text-decoration:none;'>Show Input Fields</a>";
      			
      			print "&nbsp;&nbsp;&nbsp;&nbsp;<a class='ui-state-default ui-corner-all remove_instrument' href='' style='padding:6px 6px 6px 17px;text-decoration:none;position:relative'>";
				print "<span class='ui-icon ui-icon-minus' style='position:absolute;top:4px;left:1px'></span>" ;
				print "Remove Instrument</a></div>";
      			
      			/** this table has two classes!! class='create' */
      			//print "<table class='create'>" . LF;
      			print "<table class='instrument create'>" . LF;
      			//TRANSPORT THE NUMBER OF INSTRUMENT FOR JQUERY
//      			print "<tr><input type='hidden' name='instruments' class='instruments' value='".
//      				  count($_observatory->get_has_many("instruments", $telescope_id)) . "'/></tr>";
      			//echo "INSTRUMENTS: " . count($_observatory->get_has_many("instruments", $telescope_id)) . "<br>";
      			
      			/** @todo add custom error labels for all necessary inputs */

				//Instrument Name
				$i_name_tooltip = "Instrument Name - Please insert the name of the instrument or a common abbreviation - 
				of the instrument (if possible with the full name after a hyphen). - 
				Please be aware that this field supports auto-completion. - There are no format conventions. - 
				<b>Example:</b> &quot;Apogee Alta U900 camera&quot;";
				printInputTextRow("Instrument Name", "add_obs_instrument_name[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("instrument_name", $telescope_id, $instrument_count), 60, NULL, "instrument", FALSE, $i_name_tooltip);

				//Instrument Type
				$i_type_tooltip = "Instrument Type - Please choose the type of your instrument from the drop-down box. - 
				If the appropriate instrument type is not in the list, - please choose the option &quot;Other&quot;. - 
				You can then specify your instrument under &quot;Instrument Comments&quot;.";
				//  ---------------- Questionnaire Start ----------------------
				if ($_SESSION["user_level"] <= 11)
					$options = array("top" => "<option value=''>Please select an Instrument Type</option>");
				else
				//  ---------------- Questionnaire End ----------------------
					$options = array("top" => "<option value=''>Please select an Instrument Type</option>",
						"bottom" => "<option class='add_instrument_type' value='100000'>Add other Instrument Type</option>");
				printTypeSelectListFromArray("Instrument Type", "add_obs_instrument_type_id[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("instrument_type", $telescope_id, $instrument_count), $instrument_types, "name", NULL, FALSE, $options, $i_type_tooltip);

	      		//Focal Position
	      		$i_focal_tooltip = "Focal Position - Please insert any special focal point of your instrument, - 
	      		the focal-length (in meters) or the f-number (f/... in meters) of - your instrument. 
	      		There are no format conventions, - but you should include the unit if specifying the focal-length. - 
	      		<b>Examples:</b> &quot;Nasmyth Focus&quot;, &quot;1.4 m&quot; or &quot;f/9&quot;";
				printInputTextRow("Focal Position", "add_obs_instrument_focal_position[{$telescope_count}][{$instrument_count}]",
					 $_observatory->get_instrument("focal_position", $telescope_id, $instrument_count), 25, NULL, NULL, FALSE, $i_focal_tooltip);

	        	//Wavelength
	        	$i_wave_tooltip = "Wavelength Region - Please insert the wavelength of your telescope in text format. - 
				You can also choose more than one wavelength region. - 
				Please be aware that this field supports auto-completion. - 
				<b>Examples:</b> &quot;infrared&quot;, &quot;optical&quot;, &quot;radiowave&quot;";
				printInputTextRow("Wavelength Region", "add_obs_instrument_wavelength[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength", $telescope_id, $instrument_count), 50, NULL, "wavelength", FALSE, $i_wave_tooltip);

	        	//Wavelength Begin
	        	//tooltip from telescopes
		  		print "<tr>";
				printInputTitleCol("Wavelength or Freq. Begin", NULL, FALSE, $wave_begin_tooltip);
				print "<td align='left'>";
				printInputText("add_obs_instrument_wavelength_b[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_begin", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_b_unit[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "<label for='add_obs_instrument_wavelength_b[{$telescope_count}][{$instrument_count}]' " .
						"class='error' style='display: none;'>Please enter a float number!</label>";
				print "</td></tr>" . LF;

	      		//Wavelength End
	      		//tooltip from telescopes
		  		print "<tr>";
				printInputTitleCol("Wavelength or Freq. End", NULL, FALSE, $wave_end_tooltip);
				print "<td align='left'>";
				printInputText("add_obs_instrument_wavelength_e[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_end", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_e_unit[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "<label for='add_obs_instrument_wavelength_e[{$telescope_count}][{$instrument_count}]' " . 
						"class='error' style='display: none;'>Please enter a float number!</label>";
				print "</td></tr>" . LF;

	        	//Spatial Resolution
	        	$i_spatial_tooltip = "Spatial Resolution - Please insert the spatial resolution of 
	        	your instrument in - arc-seconds per pixel. There are no format conventions. - 
	        	<b>Example:</b> &quot;0.58&quot;";
				printInputTextRow("Spatial Resolution", "add_obs_instrument_spatial_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spatial_resolution", $telescope_id, $instrument_count), 15, "[arcsec/pixel]", NULL, FALSE, $i_spatial_tooltip);
	        	//Spectral Resolution
	        	$i_spectral_tooltip = "Spectral Resolution - Please insert the spectral resolution of your instrument in Angstrom - or as Resolving Power, R. - 
	        	This can either be one or more resolution ranges or a fixed resolution, - depending on the instrument. 
	        	There are no format conventions. - 
	        	<b>Example:</b> &quot;3200 &ndash; 10200&quot;";
				printInputTextRow("Spectral Resolution", "add_obs_instrument_spectral_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spectral_resolution", $telescope_id, $instrument_count), 15, "[&Aring;] or [R]", NULL, FALSE, $i_spectral_tooltip);
	        	//Polarisation
	        	$i_polar_tooltip = "Polarisation - Please insert the polarisation of your instrument. - 
	        	There are no format conventions. - <b>Example:</b> &quot;single linear polarization only&quot;";
				printInputTextRow("Polarisation", "add_obs_instrument_polarisation[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("polarisation", $telescope_id, $instrument_count), 25, "(Polarimeter)", NULL, FALSE, $i_polar_tooltip);
	        	//Field of View
	        	$i_fov_tooltip = "Field of View - Please insert the field of view of your instrument in X x Y arcseconds, - 
	        	or in X arcseconds (in the case of a circular field of view). - 
	        	<b>Example:</b> &quot;143 x 212 arcsec&quot;";
				printInputTextRow("Field of View", "add_obs_instrument_field_of_view[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("field_of_view", $telescope_id, $instrument_count), 25, "[arcsec x arcsec] or [arcsec]", NULL, FALSE, $i_fov_tooltip);
		        //Max Frames per sec
		        $i_maxframes_tooltip = "Maximum Frames - Please insert the maximum frames per second of your instrument. - <b>Example:</b> &quot;8.9&quot;";
				printInputTextRow("MAX Frames", "add_obs_instrument_max_frames[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("max_frames_per_sec", $telescope_id, $instrument_count), 15, "[per second]&nbsp;(Camera)", NULL, FALSE, $i_maxframes_tooltip);
				//Frame size
				$i_framesize_tooltip = "Frame Size - Please insert the frame size of your instrument in pixel x pixel. - <b>Example:</b> &quot;1024 x 1024&quot;";
				printInputTextRow("Frame Size", "add_obs_instrument_frame_size[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("frame_size", $telescope_id, $instrument_count), 25, "[pixel x pixel]&nbsp;(Camera)", NULL, FALSE, $i_framesize_tooltip);
				//Max exposure time
				$i_maxexp_tooltip = "Maximum Exposure Time - Please insert the maximum exposure time of your instrument in seconds. - <b>Example:</b> &quot;0.01&quot;";
				printInputTextRow("MAX Exposure Time", "add_obs_instrument_max_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("max_exposure_time", $telescope_id, $instrument_count), 15, "[seconds]&nbsp;(Camera)", NULL, FALSE, $i_maxexp_tooltip);
				//Min exposure time
				$i_minexp_tooltip = "Minimum Exposure Time - Please insert the minimum exposure time of your instrument in seconds. - <b>Example:</b> &quot;0.01&quot;";
				printInputTextRow("MIN Exposure Time", "add_obs_instrument_min_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("min_exposure_time", $telescope_id, $instrument_count), 15, "[seconds]&nbsp;(Camera)", NULL, FALSE, $i_minexp_tooltip);
				//Color / B/W chip
				$i_bw_tooltip = "Only B/W Chip? - Please click on the check box if your camera chip is only operating in - black/white.";
				printCheckBoxRow("Only B/W Chip?", "add_obs_instrument_bw_chip[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("color_bw_chip", $telescope_id, $instrument_count), "(Camera)", FALSE, $i_bw_tooltip);
				//CCD chip type
				$i_ccd_tooltip = "CCD Chip type - Please insert the chip type of your CCD. - 
				There are no format conventions, so you can also provide the weblink - to the chip/manufactorer. - 
				<b>Example:</b> &quot;Sony EXview HAD CCD, Sensor (ICX429AKL)&quot;";
				printInputTextRow("CCD Chip Type", "add_obs_instrument_chip_type[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("ccd_chip_type", $telescope_id, $instrument_count), 50, "(Camera)", NULL, FALSE, $i_ccd_tooltip);
				//Instrument Comments
				$i_comm_tooltip = "Instrument Comments - Please feel free to write any additional information about - 
				your instrument in this comments field. If the instrument is (or can be) - mounted 
				on several telescopes you can mention this here. - 
				You can e.g. also insert the weblink to the manufacturer into - this comment field. There are no format conventions. - 
				<b>Examples:</b> &quot;http://www.company7.com/sbig/products/st6.html&quot;, - 
				&quot;Halpha and [SII] filters on order&quot;, or &quot;This instrument is also available for - use on the other observatory telescopes&quot;";
				printInputTextfieldRow("Instrument Comments", "add_obs_instrument_comments[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("comments", $telescope_id, $instrument_count), 60, 4, NULL, FALSE, $i_comm_tooltip);
				print "</table>" . LF;

				//printAddRemoveButton($instrument_count, $_observatory->get_has_many("instruments", $telescope_id), "instrument");
				print "</fieldset>" . LF;
	    	}  	
	
		//printAddRemoveButton($telescope_count, $_observatory->get_has_many("telescopes"), "telescope");
	    print "</fieldset>" . LF;
		print "</div>" . LF;
	}
	print "</div>" . LF;
}

//ADDITIONAL INFORMATION:
print "<fieldset class='rfield'><legend>Additional Information</legend>" . LF;
print "<table class='create'>" . LF;
//Additional instruments
$addinst_tooltip = "General Instrument Comments - Please insert any general comments regarding your instruments. - 
Additional instruments can also be entered here. There are no format conventions. - 
<b>Example:</b> &quot;Several spectrometers and photometers are used at each telescope&quot;";
printInputTextfieldRow("General Instrument Comments", "add_obs_add_inst", $_observatory->get_add_info('additional_instruments'), 65, 4, NULL, FALSE, $addinst_tooltip);
//Array description
$array_tooltip = "Array Description - Please insert any description of your array here. There are no format conventions. - 
<b>Examples:</b> &quot;66 High precision antennas operating at 0.3 to 9.6 mm.&quot;, - &quot;Fifty 12-m diameter antennas will be used for interferometry,  
four 12-m diameter - antennas for total power, and twelve 7-m diameter antennas for short spacings - interferometry.&quot; or &quot;All the ALMA antennas will [...]&quot;";
printInputTextfieldRow("Array Description", "add_obs_array_desc", $_observatory->get_add_info('array_description'), 65, 4, NULL, FALSE, $array_tooltip);
//Backend description
$backend_tooltip = "Backend Description - Please insert any further information regarding the facility backend equipment here. - 
There are no format conventions. - <b>Example:</b> &quot;Additional backend equipment will be ordered soon.&quot;";
printInputTextfieldRow("Backend Description", "add_obs_backend_desc", $_observatory->get_add_info('backend_description'), 65, 4, NULL, FALSE, $backend_tooltip);
print "</table></fieldset>" . LF;

//FEEDBACK for Administrators
print "<fieldset class='rfield'><legend>Feedback for Administrators</legend>" . LF;
print "<table class='create'>" . LF;
//Feedback
$feedback_tooltip = "Feedback - The team of the NA1 Matrix would be pleased if you could provide some feedback on 
the input form and - on the NA1 Matrix in general, so that we can continuously improve our 
database to provide a - helpful service for the community. - Please also inform us of potential bugs and 
missing input fields which should be implemented. - 
<b>Examples:</b> &quot;Observatory XY is missing in your database. Please provide some information on that.&quot;, - 
&quot;You should contact the amateur community xy and ask them to include their telescopes&quot;, or - &quot;There was a bug in ...&quot;";
printInputTextfieldRow("Feedback", "add_obs_feedback", $_observatory->get_add_info('feedback'), 70, 4, NULL, FALSE, $feedback_tooltip);
print "</table></fieldset>" . LF;

//ADMINISTRATION TOOL
if($_SESSION["user_level"] >= 31)
{
	print "<fieldset class='rfield'><legend><b class='red'>Administration Tool</b></legend>" . LF;
	print "<table class='create'>" . LF;
	$columns = array ("lname", "fname");
	$options = array("<option value='1'>---</option>");
	printSelectListRowFromArray("Assign Users", "add_obs_user_id", $_observatory->get_field("obs_user_id"), 
			 $_observatory->get_users(), $columns, NULL, false, $options);
	print "</table></fieldset>" . LF;
}
else
	print "<div><input type='hidden' name='add_obs_user_id' value='{$_observatory->get_field("obs_user_id")}'></div>"; 

// Submit Button
//-----------------------------------------------------------------------------------------------------------
//Define the action buttons
print "<div class='actionbutton'>" . LF;
//IF ACTION IS ADD
if($action == "add")
{
	print "<button type='submit' name='push' value='Save for Later' class='submit'>Save for Later</button>" . LF;
	print "<button type='submit' name='push' value='Add Entry' class='submit'>Add Entry</button>" . LF;
	print "<input type='hidden' name='is_add' value='1'>" . LF ;
}
//IF ACTION IS loadTemp
//else if($action == "loadTemp")
//{
//	print "<input type='hidden' name='is_user_res' value='1'>" . LF ;
//	print "<input type='submit' name='push' value='Add Entry' class='submit'>" . LF;
//}
//IF ACTION IS loadOldObs
else if($action == "loadOldObs")
{
	print "<button type='submit' name='push' value='Add Entry' class='submit'>Add Entry</button>" . LF;
    print "<input type='hidden' name='is_old_res' value='1'>" . LF ;
    print "<input type='hidden' name='is_add' value='1'>" . LF ;
    
    if($_SESSION["user_level"] >= 31)
		print "&nbsp;&nbsp;&nbsp;&nbsp;<button type='submit' ". 
		"name='push' onclick='return show_confirm()' value='Delete Old Entry' class='submit'>Delete Old Entry</button>" . LF;
}
//IF ACTION IS EDIT
else if($action == "edit")
{
	/** @todo a little hack with GET here! => we need to improve this procedure*/
	// The edit pages for admins
	if($_SESSION["user_level"] >= 31)
	{
		if(($_SESSION["user_id"] == $_observatory->get_field("obs_user_id")) || 
  									($_observatory->get_field("obs_user_id") == 1))
			print "<button type='submit' name='push' value='Save for Later' class='submit'>Save for Later</button>" . LF;
		else
			print "<button type='submit' name='push' value='Submit to User' class='submit'>Submit to User</button>" . LF;
		
		// If we are approving
		if(isset($_GET["approve"]))
			print "<button type='submit' name='push' value='Add to Database' class='submit'>Add to Database</button>" . LF;		
		else
			print "<button type='submit' name='push' value='Update Entry' class='submit'>Update Entry</button>" . LF;
	}	
	// The edit page for the user!
	else if($_SESSION["user_level"] == 11)
	{	
		print "<button type='submit' name='push' value='Save for Later' class='submit'>Save for Later</button>" . LF;
		print "<button type='submit' name='push' value='Update Entry' class='submit'>Update Entry</button>" . LF;
	}
		
	print "<input type='hidden' name='is_edit' value='1'>" . LF ;
	
	if($_SESSION["user_level"] >= 31)
		print "&nbsp;&nbsp;&nbsp;&nbsp;<button type='submit' name='push' onclick='return show_confirm()' value='Delete Entry' " . 
		"class='submit'>Delete Entry</button>" . LF;
}

print "</div>" . LF;

?>