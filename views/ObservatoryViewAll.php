<?php 
/**
 * @file ObservatoryViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 * @todo refactor ALL uppercase TAGS
 */

print "<div><input type='hidden' name='page' value='browse'/></div>" . LF ;
//show_message();
	
/** @todo define new css rules for alternating BG color... */
print "<table class='viewall'>" . LF;
print "<caption>For details please click on Observatory entry name</caption>" . LF;
print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>E-MAIL</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGth)</i></th></tr>" . LF;

foreach($resources as $row)
{
	print "<tr>";
	print "<td><span title='Click for more details' onclick=\"return openwin('views/ObservatoryView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["name"]) . "</span></td>";
    print "<td>" . htmlentities($row["institution"]) . "</td>";
	print "<td>" . htmlentities($row["country"]) . "</td>";
	if($row["hide_email"])
    	print "<td class='red'>Not Displayed</td>";
    else
       	print "<td><a href='mailto:" . $row["email"] . "'>" . $row["email"] . "</a></td>";
	if($row["hide_web_address"])
		print "<td class='red'>Not Displayed</td>";
    elseif(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) /** @todo check performance with more than 100 entries! */
    	print "<td><a href='" . htmlentities($row["web_address"]) . "' target='_blank'><img width='30' src='images/globe.png' alt='globe'/></a></td>";
    else
    	print "<td></td>";
    print "<td>";
    foreach($row["telescope_types"] as $key => $type)
    {	
    	print $type;
        if($row["wavelengths"][$key] != '')
        	print " (<i>" . $row["wavelengths"][$key] . "</i>)";
		print "<br/>";
   	}
	print "</td>";
	print "</tr>" . LF;
}

if(empty($resources))
	print "<tr><h3>There are no Observatory entries</h3></tr>" . LF;

print "</table>" . LF;
		
?>