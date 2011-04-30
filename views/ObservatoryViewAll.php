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
print "<TABLE class='viewall'>" . LF;
print "<CAPTION><H3 align='center'>For details please click on Observatory entry name</H3></CAPTION>" . LF;
print "<TR><TH>NAME</TH><TH>INSTITUTION</TH><TH>COUNTRY</TH><TH>E-MAIL</TH><TH>WEB</TH><TH>TELESCOPE-TYPE <i>(WAVELENGTH)</i></TH></TR>" . LF;

foreach($resources as $row)
{
	print "<TR align='center'>";
	print "<TD><SPAN title='Click for more details' onclick=\"return openwin('views/ObservatoryView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["name"]) . "</SPAN></TD>";
    print "<TD>" . $row["institution"] . "</TD>";
	print "<TD>" . $row["country"] . "</TD>";
	if($row["hide_email"])
    	print "<TD><font color='#FF0000'>Not Displayed</font></TD>";
    else
       	print "<TD><A href='mailto:" . $row["email"] . "'>" . $row["email"] . "</A></TD>";
	if($row["hide_web_address"])
		print "<TD><font color='#FF0000'>Not Displayed</font></TD>";
    elseif(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) /** @todo check performance with more than 100 entries! */
    	print "<TD><A href='" . $row["web_address"] . "' target='_blank'><img width='30' border='0' src='images/globe.png'></A></TD>";
    else
    	print "<TD></TD>";
    print "<TD>";
    foreach($row["telescope_types"] as $key => $type)
    {	
    	print $type;
        if($row["wavelengths"][$key] != '')
        	print " (<i>" . $row["wavelengths"][$key] . "</i>)";
		print "<br>";
   	}
	print "</TD>";
	print "</TR>" . LF;
}

if(empty($resources))
	print "<TR><H3>There are no Observatory entries</H3></TR>" . LF;

print "</TABLE>" . LF;
		
?>