<?php 
/**
 * @file SpacemissionViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 * @todo implement SpacemissionDAO usage
 */

print "<INPUT type='hidden' name='page' value='browse'>" . LF ;
//show_message();
	
/** @todo define new css rules for alternating BG color... */
print "<CENTER><P><TABLE border='1' cellpadding='4' class='rtable' width='100%'>" . LF;
print "<CAPTION><H3 align='center'>For details please click on Space Mission entry name</H3></CAPTION>" . LF;
print "<TR><TH>NAME</TH><TH>AGENCY</TH><TH>WEB</TH><TH>LAUNCH-DATE</TH><TH>DEATH-DATE</TH><TH>TARGETS</TH></TR>" . LF;

$query = "SELECT id, mission_name, mission_agency, launch_date, death_date, web_address FROM space_missions ORDER BY mission_name";
//$result = mysqli_query($link, $query);
$result = $link->query($query);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
	//Mission Agency
	$query2 = "SELECT acronym, web_address FROM agencies WHERE id=" . $row["mission_agency"];
	//$result2 = mysqli_query($link, $query2);
	$result2 = $link->query($query2);
	$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC);
	$agency = $row2["acronym"];
	$agency_web_address = $row2["web_address"];
	mysqli_free_result($result2);

	//Targets
	$targets = array();
	$query2 = "SELECT target_id FROM space_mission_to_targets WHERE space_mission_id=" . $row["id"];
	//$result2 = mysqli_query($link, $query2);
	$result2 = $link->query($query2);
	while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC))
	{
		$query3 = "SELECT target_name FROM targets WHERE id=" . $row2["target_id"];
		//$result3 = mysqli_query($link, $query3);
		$result3 = $link->query($query3);
		$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC);
		$targets[] = $row3["target_name"];
		mysqli_free_result($result3);
	}
	mysqli_free_result($result2);

	//HTML
	print "<TR align='center'>"; 
	print "<TD><SPAN title='Click for more details' onclick=\"return openwin('views/SpacemissionView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["mission_name"]) . "</SPAN></TD>";
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

?>