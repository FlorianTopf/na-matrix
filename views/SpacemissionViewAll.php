<?php 
/**
 * @file SpacemissionViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 * @todo refactor ALL uppercase TAGS
 */

print "<div><input type='hidden' name='page' value='browse'/></div>" . LF ;
//show_message();
	
/** @todo define new css rules for alternating BG color... */
print "<CENTER><P><TABLE border='1' cellpadding='4' class='rtable' width='100%'>" . LF;
print "<CAPTION><H3 align='center'>For details please click on Space Mission entry name</H3></CAPTION>" . LF;
print "<TR><TH>NAME</TH><TH>AGENCY</TH><TH>WEB</TH><TH>LAUNCH-DATE</TH><TH>DEATH-DATE</TH><TH>TARGETS</TH></TR>" . LF;

foreach($resources as $row)
{
	print "<TR align='center'>"; 
	print "<TD><SPAN title='Click for more details' onclick=\"return openwin('views/SpacemissionView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["mission_name"]) . "</SPAN></TD>";
	print "<TD><A href='" . $row["agency_web_address"] . "' target='_blank'>" . $row["agency"] . "</A></TD>";
	if(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) /** @todo check performance with more than 100 entries! */
		print "<TD><A href='" . $row["web_address"] . "' target='_blank'><img width='30' border='0' src='images/globe.png'></A></TD>";
	else
	print "<TD></TD>";
	print "<TD>" . $row["launch_date"] . "</TD>";
	print "<TD>" . (($row["death_date"] == "0000-00-00") ? "" : $row["death_date"]) . "</TD>";
	print "<TD>";
    foreach($row["targets"] as $target)
    {
    	print $target . "<br>";
    }
	print "</TD>";
    print "</TR>" . LF;
}

if(empty($resources))
	print "<H3 align='center'>There are no Space Mission entries</H3>" . LF;
	
print "</TABLE></P></CENTER>" . LF;

?>