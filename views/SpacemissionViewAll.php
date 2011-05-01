<?php 
/**
 * @file SpacemissionViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 */

print "<div><input type='hidden' name='page' value='browse'/></div>" . LF ;
//show_message();
	
/** @todo define new css rules for alternating BG color... */
print "<table class='viewall'>" . LF;
print "<caption>For details please click on Space Mission entry name</caption>" . LF;
print "<tr><th>NAME</th><th>AGENCY</th><th>WEB</th><th>LAUNCH-DATE</th><th>DEATH-DATE</th><th>TARGETS</th></tr>" . LF;

foreach($resources as $row)
{
	print "<tr>"; 
	print "<td><span title='Click for more details' onclick=\"return openwin('views/SpacemissionView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["mission_name"]) . "</span></td>";
	print "<td><a href='" . htmlentities($row["agency_web_address"]) . "' target='_blank'>" . htmlentities($row["agency"]) . "</a></td>";
	if(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) /** @todo check performance with more than 100 entries! */
		print "<td><a href='" . htmlentities($row["web_address"]) . "' target='_blank'><img width='30' src='images/globe.png' alt='globe'/></a></td>";
	else
	print "<td></td>";
	print "<td>" . $row["launch_date"] . "</td>";
	print "<td>" . (($row["death_date"] == "0000-00-00") ? "" : $row["death_date"]) . "</td>";
	print "<td>";
    foreach($row["targets"] as $target)
    {
    	print $target . "<br/>";
    }
	print "</td>";
    print "</tr>" . LF;
}

if(empty($resources))
	print "<tr><td colspan='6'><h3>There are no Space Mission entries</h3></td></tr>" . LF;
	
print "</table>" . LF;

?>