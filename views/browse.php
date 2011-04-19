<?php
/**
 * @file browse.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 */

	print "<INPUT type='hidden' name='page' value='browse'>" . LF ;
 	$link = dbiSelect();
	//show_message();

//-----------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------

//RESOURCE SELECTION
	print "<FIELDSET class='rfield'><LEGEND>Resource Selection:</LEGEND>" . LF;
    print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;

   	print "<TR><TD align='center' width='45%'>" .
          "<INPUT type='radio' name='add_res_type' value='obs'";
   	if ($_POST["add_res_type"] == "obs") print " checked";
    print " id='sel_obs' onchange=\"document.main_form.submit()\">" .
          " <LABEL for='sel_obs'><B>Observatory</B></LABEL></TD>" . LF;

   	print "<TD align='center' width='45%'>" .
          "<INPUT type='radio' name='add_res_type' value='spa'";
    if ($_POST["add_res_type"] == "spa") print " checked";
    print " id='sel_spa' onchange=\"document.main_form.submit()\">" .
          " <LABEL for='sel_spa'><B>Space Mission</B></LABEL></TD></TR>" . LF;
    print "</TABLE></FIELDSET>";


	//OBSERVATORIES
    if($_POST["add_res_type"] == "obs")
    {
    	/** @todo define new css rules for alternating BG color... */
    	print "<CENTER><P><TABLE border='1' cellpadding='4' width='100%' class='rtable'>" . LF;
    	print "<CAPTION><H3 align='center'>For details please click on Observatory entry name</H3></CAPTION>" . LF;
    	print "<TR><TH>NAME</TH><TH>INSTITUTION</TH><TH>COUNTRY</TH><TH>E-MAIL</TH><TH>WEB</TH><TH>TELESCOPE-TYPE <i>(WAVELENGTH)</i></TH></TR>" . LF;

		$query = "SELECT id, name, institution, web_address, country_id, email FROM observatories ORDER BY name";
		$result = mysqli_query($link, $query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			//Hidden Fields
			$query2 = "SELECT web_address, email FROM hidden_fields WHERE id=" . $row["id"];
			$result2 = mysqli_query($link, $query2);
			$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
			$hide_web_address = $row2["web_address"];
			$hide_email = $row2["email"];
			mysqli_free_result($result2);

			//Country
			$query2 = "SELECT name FROM countries WHERE id=" . $row["country_id"];
			$result2 = mysqli_query($link, $query2);
			$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
			$country = $row2["name"];
			mysqli_free_result($result2);

			//Telescope Types
			$telescope_types = array();
			$wavelengths = array();
			$query2 = "SELECT telescope_id FROM observatory_to_telescopes WHERE observatory_id=" . $row["id"];
			$result2 = mysqli_query($link, $query2);
			while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC))
			{
				$query3 = "SELECT telescope_type, wavelength FROM telescopes WHERE id=" . $row2["telescope_id"];
				$result3 = mysqli_query($link, $query3);
				$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
				$telescope_type_id = $row3["telescope_type"];
				$wavelengths[] = $row3["wavelength"];
				mysqli_free_result($result3);

				$query3 = "SELECT name FROM telescope_types WHERE id=" . $telescope_type_id;
				$result3 = mysqli_query($link, $query3);
				$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
				$telescope_types[] = $row3["name"];
				mysqli_free_result($result3);
			}
			mysqli_free_result($result2);

			//HTML
			print "<TR align='center'>";
			print "<TD><SPAN title='Click for more details' onclick=\"return openwin('views/show.php?" .
            	  "id=" . $row["id"] . "&res_type=observatories')\" class='hand'>" . stripslashes($row["name"]) . "</SPAN></TD>";
            //print "<TD><SPAN title='Click for more details' class='hand'>" . stripslashes($row["name"]) . "</SPAN></TD>";
            print "<TD>" . $row["institution"] . "</TD>";
            print "<TD>" . $country . "</TD>";
            if($hide_email)
            	print "<TD><font color='#FF0000'>Not Displayed</font></TD>";
            else
            	print "<TD><A href='mailto:" . $row["email"] . "'>" . $row["email"] . "</A></TD>";
			if($hide_web_address)
				print "<TD><font color='#FF0000'>Not Displayed</font></TD>";
            elseif(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) /** @todo check performance with more than 100 entries! */
            	print "<TD><A href='" . $row["web_address"] . "' target='_blank'><img width='30' border='0' src='images/globe.png'></A></TD>";
            else
            	print "<TD></TD>";
            print "<TD>";
            	foreach($telescope_types as $key => $type)
            	{
            		print $type;
            		if($wavelengths[$key] != '')
            			print " (<i>" . $wavelengths[$key] . "</i>)";
					print "<br>";
            	}
            print "</TD>";
            /*print "<TD>";
            	foreach($wavelengths as $wavelength)
            	{
            		print $wavelength . "<br>";
            	}
            print "</TD>";*/
            print "</TR>" . LF;
		}
		if(!$result)
			print "<TR><H3>There are no Observatory entries</H3></TR>" . LF;
		mysqli_free_result($result);
		print "</TABLE></P></CENTER>" . LF;

    }

    //SPACE MISSIONS
    elseif($_POST["add_res_type"] == "spa")
    {
    	/** @todo define new css rules for alternating BG color... */
    	print "<CENTER><P><TABLE border='1' cellpadding='4' class='rtable' width='100%'>" . LF;
    	print "<CAPTION><H3 align='center'>For details please click on Space Mission entry name</H3></CAPTION>" . LF;
    	print "<TR><TH>NAME</TH><TH>AGENCY</TH><TH>WEB</TH><TH>LAUNCH-DATE</TH><TH>DEATH-DATE</TH><TH>TARGETS</TH></TR>" . LF;

		$query = "SELECT id, mission_name, mission_agency, launch_date, death_date, web_address FROM space_missions ORDER BY mission_name";
		$result = mysqli_query($link, $query);
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
			//Mission Agency
			$query2 = "SELECT acronym, web_address FROM agencies WHERE id=" . $row["mission_agency"];
			$result2 = mysqli_query($link, $query2);
			$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
			$agency = $row2["acronym"];
			$agency_web_address = $row2["web_address"];
			mysqli_free_result($result2);

			//Targets
			$targets = array();
			$query2 = "SELECT target_id FROM space_mission_to_targets WHERE space_mission_id=" . $row["id"];
			$result2 = mysqli_query($link, $query2);
			while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC))
			{
				$query3 = "SELECT target_name FROM targets WHERE id=" . $row2["target_id"];
				$result3 = mysqli_query($link, $query3);
				$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
				$targets[] = $row3["target_name"];
				mysqli_free_result($result3);
			}
			mysqli_free_result($result2);

			//HTML
			print "<TR align='center'>"; 
			print "<TD><SPAN title='Click for more details' onclick=\"return openwin('views/show.php?" .
            	  "id=" . $row["id"] . "&res_type=space_missions')\" class='hand'>" . stripslashes($row["mission_name"]) . "</SPAN></TD>";
            //print "<TD><SPAN title='Click for more details' class='hand'>" . stripslashes($row["mission_name"]) . "</SPAN></TD>";
			print "<TD><A href='" . $agency_web_address . "' target='_blank'>" . $agency . "</A></TD>";
			if(isValidURL($row["web_address"]))
				print "<TD><A href='" . $row["web_address"] . "' target='_blank'><img width='30' border='0' src='images/globe.png'></A></TD>";
			else
				print "<TD></TD>";
			print "<TD>" . $row["launch_date"] . "</TD>";
			print "<TD>" . (($row["death_date"] == "0000-00-00") ? "" : $row["death_date"]) . "</TD>";
			print "<TD>";
            foreach($targets as $target)
            {
            	print $target . "<br>";
            }
            print "</TD>";
            print "</TR>" . LF;
		}
		if(!$result)
			print "<H3 align='center'>There are no Space Mission entries</H3>" . LF;
		mysqli_free_result($result);
		print "</TABLE></P></CENTER>" . LF;
    }
    else
    {
    	print "<H3 align='center'>Please select a resource type</H3>" . LF;
    }


?>
