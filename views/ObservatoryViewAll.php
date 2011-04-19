<?php 
/**
 * @file ObservatoryViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 * @todo implement ObservatoryDAO usage
 */

print "<INPUT type='hidden' name='page' value='browse'>" . LF ;
$link = dbiSelect();
//show_message();
	
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
//	print "<TD>";
//	foreach($wavelengths as $wavelength)
//	{
//		print $wavelength . "<br>";
//	}
//	print "</TD>";
	print "</TR>" . LF;
}
if(!$result)
print "<TR><H3>There are no Observatory entries</H3></TR>" . LF;
mysqli_free_result($result);
print "</TABLE></P></CENTER>" . LF;
		
mysqli_close($link);
		
?>