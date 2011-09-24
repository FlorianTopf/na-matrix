<?php
/**
 * @file ObservatoryCreateUpdate.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<div><input type='hidden' name='page' value='add'/>" . LF;
print "<input type='hidden' name='add_res_id' value='{$resource_id}'/>" . LF;
print "<input type='hidden' name='res_type' value='{$resource_type}'/></div>" . LF;
//show_message();

print "<fieldset class='rfield'><legend>Observatory General:</legend>" . LF;
print "<table class='create'>" . LF;


//Observatory name - MANDATORY / CHECK IF THE NAME ALREADY EXISTS!
/** @todo THIS IS A LITTLE HACK, WE DONT CHECK FOR EXISTING NAMES IF EDITING */
if($action == "edit")
	printInputTextRow("Observatory name", "update_obs_name", $_observatory->get_field("obs_name"), 80, NULL, NULL, TRUE);
else
	printInputTextRow("Observatory name", "add_obs_name", $_observatory->get_field("obs_name"), 80, NULL, NULL, TRUE);

//Year founded - check if is an YEAR
printInputTextRow("Year founded", "add_obs_founded", $_observatory->get_field("obs_founded"), 4, "[YYYY]", "add_obs_founded");
//Institution
printInputTextRow("Institution", "add_obs_institution", $_observatory->get_field("obs_institution"));
//Web address
printInputTextRow("Web address", "add_obs_web_address", $_observatory->get_field("obs_web_address"), 80, "[http://...]");
//Address
printInputTextRow("Address", "add_obs_address", $_observatory->get_field("obs_address"));
//ZIP code
printInputTextRow("ZIP code", "add_obs_zip_code", $_observatory->get_field("obs_zip_code"), 10);
//City
printInputTextRow("City", "add_obs_city",  $_observatory->get_field("obs_city"), 30);
//Country - MANDATORY
$countries = $_observatory->get_countries();
$options = array("<option value=''>Please choose...</option>");
printSelectListRowFromArray("Country", "add_obs_country_id",
	$_observatory->get_field("obs_country_id"), $countries, "name", NULL, TRUE, $options);
//Phone
printInputTextRow("Phone", "add_obs_phone", $_observatory->get_field("obs_phone"), 30);
//Email
printInputTextRow("Email", "add_obs_email", $_observatory->get_field("obs_email"), 30);

//Latitude
print "<tr>";
printInputTitleCol("Latitude");
print "<td align='left'>";
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
print "</td></tr>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<tr><td colspan='2'>";
print "<label for='add_obs_latitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_latitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "</td></tr>";

//Longitude
print "<tr>";
printInputTitleCol("Longitude");
print "<td align='left'>";
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
print "</td></tr>" . LF;
/** @todo improve custom error labels, location in html */
//custom error labels
print "<tr><td colspan='2'>";
print "<label for='add_obs_longitude[degree]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[minutes]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[seconds]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "<label for='add_obs_longitude[cent]' class='error' style='display: none;'>Please enter a decimal number!</label>";
print "</td></tr>";

//Approximate position
printInputTextRow("Approximate position", "add_obs_position", $_observatory->get_field("obs_approx_position"));
//Sealevel
printInputTextRow("Sealevel", "add_obs_sealevel", $_observatory->get_field("obs_sealevel_m"), 10, "[m]");
//Precipitation range
$p_ranges = $_observatory->get_precipitation_ranges();
printSelectListRowFromArray("Precipitiation range", "add_obs_precip_id", $_observatory->get_field("obs_precipitation"), $p_ranges, "range", "[mm/Y]");
//Clear nights
$c_ranges = $_observatory->get_clearnights_ranges();
printSelectListRowFromArray("Clear nights", "add_obs_clearnights_id", $_observatory->get_field("obs_clear_nights"), $c_ranges, "range", "[D]");
//Timezone
$timezones = $_observatory->get_timezones();
printSelectListRowFromArray("Timezone", "add_obs_timezone_id", $_observatory->get_field("obs_timezone"), $timezones, "timezone", "[GMT+/-]");
//Observatory Status
printInputTextRow("Observatory Status", "add_obs_status", $_observatory->get_field("obs_observatory_status"));
//Partner observatories
printInputTextRow("Partner Observatories", "add_obs_partner", $_observatory->get_field("obs_partner_observatories"));
//General comments
printInputTextfieldRow("General comments", "add_obs_gen_com", $_observatory->get_add_info('general_comments'));
print "</table></fieldset>" . LF;

//SCIENTIFIC CONTACTS
print "<fieldset class='rfield'><legend>Scientific Contacts:</legend>" . LF;
print "<table class='create'>" . LF;
print "<tr><th></th><th>Name</th><th>Email</th><th>Institution</th></tr>";
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
printInputTextfieldRow("Further contacts", "add_obs_fur_con", $_observatory->get_add_info('further_contacts'));
print "</table></fieldset>" . LF;

//HIDDEN FIELDS:
print "<fieldset class='rfield'><legend>Hidden Fields: You may want to hide some contact information</legend>" . LF;
print "<table class='create'>" . LF;
printMultipleCheckBoxRow("add_obs_hide", $_observatory->get_hidden_fields());
print "</table></fieldset>" . LF;

//RESEARCH AREAS - MANDATORY
print "<fieldset class='rfield'><legend>Research Areas:</legend>" . LF;
/** @todo refactor id of table */
print "<table id='research_areas' class='create'>" . LF;
$research_areas = $_observatory->get_research_areas();
$options = array("<option value=''>Please choose one or several by holding CTRL...</option>",
	"<option id='add_other_area' value='100000'>Add other Research Area</option>");
printBigSelectListFromArray("Research Areas", "add_obs_res_are_ids[]",
	$_observatory->get_has_many("research_areas"), $research_areas, "name", NULL, TRUE, $options);
//Research comments
printInputTextfieldRow("Research comments", "add_obs_research_com", $_observatory->get_add_info('research_comments'));
print "</table></fieldset>" . LF;

//TARGETS: NOT MANDADORY
/** @todo add other targets */
print "<fieldset class='rfield'><legend>Targets:</legend>" . LF;
/** @todo refactor id of table */
//print "<table id='targets' class='create'>" . LF;
print "<table class='create'>" . LF;
$targets = $_observatory->get_targets();
$options = array("<option value=''>Please choose one or several by holding CTRL...</option>");
//$options = array("Please choose one or several by holding CTRL...",
//"<option id='other' value='100000'>Add other Target</option>");
printBigSelectListFromArray("Targets", "add_obs_target_ids[]", $_observatory->get_has_many("targets"),
	$targets, "target_name", NULL, FALSE, $options);
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
	foreach($_observatory->get_has_many("telescopes") as $telescope_count => $telescope_id)
	{
		/** @todo use this for determining deletion / update / add */
  		//TRANSPORT THE OLD NUMBER OF TELESCOPES VIA POST
	    print "<input type='hidden' name='add_obs_telescope_ids[" . $telescope_count . "]' value='". $telescope_id . "'/>" . LF;

      	print "<fieldset class='rfield'><legend>Telescope:</legend>" . LF;
      	print "<table class='create'>" . LF;

      	//TRANSPORT THE NUMBER OF TELESCOPES FOR JQUERY
      	//print "<tr><input type='hidden' name='telescopes' class='telescopes' value='".
      	//	count($_observatory->get_has_many("telescopes")) . "'/></tr>";
      	//echo "TELESCOPES: " . count($_observatory->get_has_many("telescopes")) . "<br>";

	    //Telescope Name
		printInputTextRow("Telescope Name", "add_obs_telescope_name[{$telescope_count}]",
			 $_observatory->get_telescope("telescope_name", $telescope_count), 60, NULL, "telescope");

		//Telescope Type
		$options = array("top" => "<option value=''>Please select a Telescope Type</option>",
			"bottom" => "<option class='add_telescope_type' value='100000'>Add other Telescope Type</option>");
		printTypeSelectListFromArray("Telescope Type", "add_obs_telescope_type_id[{$telescope_count}]",
		 $_observatory->get_telescope("telescope_type", $telescope_count), $telescope_types, "name", NULL, FALSE, $options);

	    //Telescope Elements
		printInputTextRow("Telescope Elements", "add_obs_telescope_elements[{$telescope_count}]",
			$_observatory->get_telescope("telescope_elements", $telescope_count), 10);

	    //Diameter/Aperture
		printInputTextRow("Diameter/Aperture", "add_obs_diameter[{$telescope_count}]",
			$_observatory->get_telescope("diameter_m", $telescope_count), 10, "[m]", "number");

	    //Focallength
		printInputTextRow("Focallength", "add_obs_focallength[{$telescope_count}]",
			$_observatory->get_telescope("focallength_m", $telescope_count), 10, "[m/F]");

		//Antenna Type
		$options = array("bottom" => "<option class='add_antenna_type' value='100000'>Add other Type</option>");
		printTypeSelectListFromArray("Antenna Type", "add_obs_antenna_type_id[{$telescope_count}]",
			$_observatory->get_telescope("antenna_type", $telescope_count), $antenna_types, "antenna_type", NULL, FALSE, $options);

		//Wavelength
		printInputTextRow("Wavelength", "add_obs_wavelength[{$telescope_count}]",
			$_observatory->get_telescope("wavelength", $telescope_count), 40, NULL, "wavelength");

	    //Wavelength Begin
	    print "<tr>";
		printInputTitleCol("Wavelength Begin");
		print "<td align='left'>";
		printInputText("add_obs_wavelength_b[{$telescope_count}]", $_observatory->get_telescope("wavelength_begin", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_b_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_begin", $telescope_count),
			$wavelength_units, "wavelength_unit");
		print "</td></tr>" . LF;

		//Wavelength End
	    print "<tr>";
		printInputTitleCol("Wavelength End");
		print "<td align='left'>";
		printInputText("add_obs_wavelength_e[{$telescope_count}]", $_observatory->get_telescope("wavelength_end", $telescope_count), 10, "number");
		ws(3);
		printSelectListFromArray("add_obs_wavelength_e_unit[{$telescope_count}]", $_observatory->get_telescope("wavelength_e_unit", $telescope_count),
			$wavelength_units, "wavelength_unit");
		print "</td></tr>" . LF;

	    //Telescope Comments
		printInputTextfieldRow("Telescope Comments", "add_obs_telescope_comments[{$telescope_count}]",
			$_observatory->get_telescope("comments", $telescope_count));

		/** @todo improve custom error labels, location in html */
	    /** @todo add custom error labels for all necessary inputs */
	    //custom error labels
	    print "<tr><td colspan='2'><label for='add_obs_diameter[". $telescope_count . "]' class='error' style='display: none;'>Please enter a float number!</label></td></tr>";
	    //print "<tr><td colspan='2'><label for='add_obs_focallength[". $telescope_count . "]' class='error' style='display: none;'>Please enter a float number!</label></td></tr>";
	    print "</table>";

	    //INSTRUMENTS
	    //echo "ADD TELESCOPE COUNT: " . $telescope_count . " ID: " . $telescope_id . "<br>";
      	if(!is_array($_observatory->get_has_many("instruments", $telescope_id)))
			$_observatory->init_has_many("instruments", $telescope_id);

      	if(is_array($_observatory->get_has_many("instruments", $telescope_id)))
      		foreach($_observatory->get_has_many("instruments", $telescope_id) as $instrument_count => $instrument_id)
	    	{
	    		//TRANSPORT THE OLD NUMBER OF INSTRUMENTS VIA POST
	       		//print "<input type='hidden' name='add_obs_instrument_ids[" . $telescope_count . "][" . $instrument_count . "]' value='". $instrument_id . "'/>" . LF;

	       		print "<fieldset class='rfield'><legend>Instrument:</legend>" . LF;
      			print "<table><tr><td><a href='' class='toggle_instrument'>Show Inputs</a></td></tr></table>";
      			/** this table has two classes!! class='create' */
      			//print "<table class='create'>" . LF;
      			print "<table class='instrument create'>" . LF;
      			//TRANSPORT THE NUMBER OF INSTRUMENT FOR JQUERY
//      			print "<tr><input type='hidden' name='instruments' class='instruments' value='".
//      				  count($_observatory->get_has_many("instruments", $telescope_id)) . "'/></tr>";
      			//echo "INSTRUMENTS: " . count($_observatory->get_has_many("instruments", $telescope_id)) . "<br>";

				//Instrument Name
				printInputTextRow("Instrument Name", "add_obs_instrument_name[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("instrument_name", $telescope_id, $instrument_count), 60, NULL, "instrument");

				//Instrument Type
				$options = array("top" => "<option value=''>Please select an Instrument Type</option>",
				"bottom" => "<option class='add_instrument_type' value='100000'>Add other Instrument Type</option>");
				printTypeSelectListFromArray("Instrument Type", "add_obs_instrument_type_id[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("instrument_type", $telescope_id, $instrument_count), $instrument_types, "name", NULL, FALSE, $options);

	      		//Focal Position
				printInputTextRow("Focal Position", "add_obs_instrument_focal_position[{$telescope_count}][{$instrument_count}]",
					 $_observatory->get_instrument("focal_position", $telescope_id, $instrument_count), 40);

	        	//Wavelength
				printInputTextRow("Wavelength", "add_obs_instrument_wavelength[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength", $telescope_id, $instrument_count), 40, NULL, "wavelength");

	        	/** @todo how to implement validation here? */
	        	//Wavelength Begin
		  		print "<tr>";
				printInputTitleCol("Wavelength Begin");
				print "<td align='left'>";
				printInputText("add_obs_instrument_wavelength_b[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_begin", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_b_unit[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_b_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "</td></tr>" . LF;

	      		/** @todo how to implement validation here? */
	      		//Wavelength End
		  		print "<tr>";
				printInputTitleCol("Wavelength End");
				print "<td align='left'>";
				printInputText("add_obs_instrument_wavelength_e[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_end", $telescope_id, $instrument_count), 10, "number");
				ws(3);
				printSelectListFromArray("add_obs_instrument_wavelength_e_unit[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("wavelength_e_unit", $telescope_id, $instrument_count), $wavelength_units, "wavelength_unit");
				print "</td></tr>" . LF;

	        	//Spatial Resolution
				printInputTextRow("Spatial Resolution", "add_obs_instrument_spatial_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spatial_resolution", $telescope_id, $instrument_count), 40);
	        	//Spectral Resolution
				printInputTextRow("Spectral Resolution", "add_obs_instrument_spectral_resolution[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("spectral_resolution", $telescope_id, $instrument_count), 40);
	        	//Polarisation
				printInputTextRow("Polarisation", "add_obs_instrument_polarisation[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("polarisation", $telescope_id, $instrument_count), 40, "(Polarimeter)");
	        	//Field of View
				printInputTextRow("Field of View", "add_obs_instrument_field_of_view[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("field_of_view", $telescope_id, $instrument_count), 40);
		        //Max Frames per sec
				printInputTextRow("MAX frames", "add_obs_instrument_max_frames[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("max_frames_per_sec", $telescope_id, $instrument_count), 10, "[per second]&nbsp;(Camera)");
				//Frame size
				printInputTextRow("Frame size", "add_obs_instrument_frame_size[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("frame_size", $telescope_id, $instrument_count), 20, "[pixel*pixel]&nbsp;(Camera)");
				//Max exposure time
				printInputTextRow("MAX exposure time", "add_obs_instrument_max_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("max_exposure_time", $telescope_id, $instrument_count), 10, "[seconds]&nbsp;(Camera)");
				//Min exposure time
				printInputTextRow("MIN exposure time", "add_obs_instrument_min_exposure[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("min_exposure_time", $telescope_id, $instrument_count), 10, "[seconds]&nbsp;(Camera)");
				//Color / B/W chip
				printCheckBoxRow("Only B/W chip?", "add_obs_instrument_bw_chip[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("color_bw_chip", $telescope_id, $instrument_count), "(Camera)");
				//CCD chip type
				printInputTextRow("CCD chip type", "add_obs_instrument_chip_type[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("ccd_chip_type", $telescope_id, $instrument_count), 50, "(Camera)");
				//Instrument Comments
				printInputTextfieldRow("Instrument Comments", "add_obs_instrument_comments[{$telescope_count}][{$instrument_count}]",
					$_observatory->get_instrument("comments", $telescope_id, $instrument_count), 50);
				print "</table>" . LF;

				printAddRemoveButton($instrument_count, $_observatory->get_has_many("instruments", $telescope_id), "instrument");

	      		/** @todo add custom error labels for all necessary inputs */
				print "</fieldset>" . LF;
	    	}

		printAddRemoveButton($telescope_count, $_observatory->get_has_many("telescopes"), "telescope");
      	print "</fieldset>" . LF;
	}

//ADDITIONAL INFORMATION:
print "<fieldset class='rfield'><legend>Additional Information</legend>" . LF;
print "<table class='create'>" . LF;
//Further contacts
//printInputTextfieldRow("Further contacts", "add_obs_fur_con", $_observatory->get_add_info('further_contacts'));
//Instrument comments
//printInputTextfieldRow("Instrument comments", "add_obs_inst_com", $_observatory->get_add_info('instrument_comments'));
//Additional instruments
printInputTextfieldRow("Additional instruments", "add_obs_add_inst", $_observatory->get_add_info('additional_instruments'));
//Array description
printInputTextfieldRow("Array description", "add_obs_array_desc", $_observatory->get_add_info('array_description'));
//Backend description
printInputTextfieldRow("Backend description", "add_obs_backend_desc", $_observatory->get_add_info('backend_description'));
//Research comments
//printInputTextfieldRow("Research comments", "add_obs_research_com", $_observatory->get_add_info('research_comments'));
//General comments
//printInputTextfieldRow("General comments", "add_obs_gen_com", $_observatory->get_add_info('general_comments'));
print "</table></fieldset>" . LF;

// Submit Button
//-----------------------------------------------------------------------------------------------------------
//Define the action buttons
print "<div class='actionbutton'>" . LF;
//IF ACTION IS ADD
if ($action == "add")
	print "<input type='submit' name='push' value='Add Entry' class='submit'>" . LF;
//IF ACTION IS loadTemp so we know it $_POST["is_user_res"] = 1
if ($action == "loadTemp")
{
	print "<input type='hidden' name='is_user_res' value='1'>" . LF ;
	print "<input type='submit' name='push' value='Add Entry' class='submit'>" . LF;
}
elseif($action == "loadOldObs")
{
    print "<input type='hidden' name='is_old_res' value='1'>" . LF ;
    print "<input type='submit' name='push' value='Add Entry' class='submit'>" . LF;
}
//IF ACTION IS EDIT
else if ($action == "edit")
	print "<input type='submit' name='push' value='Update Entry'>" . LF;
print "</div>" . LF;


?>