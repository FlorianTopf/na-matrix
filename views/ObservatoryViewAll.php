<?php 
/**
 * @file ObservatoryViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add filter & sort functionality & detailed view (show entry) & customised css table definition
 */

print "<div><input type='hidden' name='page' value='browse'/></div>" . LF ;
//show_message();
	
print "<table class='filter'>" . LF;
print "<caption>Filter the content by selecting one of the Dropdown menus</caption>" . LF;
//Country Filter
$countries = $_observatory->get_countries();
print "<tr><td class='title' colspan='2'><b>Filter by Country</b></td>";
print "<td class='filter' colspan='4'><SELECT name='obs_filters[country]' onchange='this.form.submit()'>" . LF;
print "<OPTION value=''>ALL</OPTION>";
foreach($countries['id'] as $key => $value)
{
	print "<OPTION value='" . $value . "'";
	if(isset($filters["country"]))
		if ($value == $filters["country"]) print " selected";
   	print ">" . $countries['name'][$key] . "</OPTION>" . LF;
}
print "</SELECT></td></tr>" . LF;
//----
//Telescope Type Filter
$telescope_types = $_observatory->get_telescope_types();
print "<tr><td class='title' colspan='2'><b>Filter by Telescope Type</b></td>";
print "<td class='filter' colspan='4'><SELECT name='obs_filters[telescope_type]' onchange='this.form.submit()'>" . LF;
print "<OPTION value=''>ALL</OPTION>";
foreach($telescope_types['id'] as $key => $value)
{
	print "<OPTION value='" . $value . "'";
	if(isset($filters["telescope_type"]))
		if ($value == $filters["telescope_type"]) print " selected";
   	print ">" . $telescope_types['name'][$key] . "</OPTION>" . LF;
}
print "</SELECT></td></tr>" . LF; 
//----
//Research Area Filter
//$research_areas = $_observatory->get_research_areas();
//print "<tr><td class='title' colspan='2'><b>Filter by Research Area</b></td>";
//print "<td class='filter' colspan='4'><SELECT name='obs_filters[research_area]' onchange='this.form.submit()'>" . LF;
//print "<OPTION value=''>ALL</OPTION>";
//foreach($research_areas['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//	if(isset($filters["research_area"]))
//		if ($value == $filters["research_area"]) print " selected";
//   	print ">" . $research_areas['name'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></td></tr>" . LF; 
//----
//Target Filter
//$targets = $_observatory->get_targets();
//print "<tr><td class='title' colspan='2'><b>Filter by Target</b></td>";
//print "<td class='filter' colspan='4'><SELECT name='obs_filters[target]' onchange='this.form.submit()'>" . LF;
//print "<OPTION value=''>ALL</OPTION>";
//foreach($targets['id'] as $key => $value)
//{
//	print "<OPTION value='" . $value . "'";
//	if(isset($filters["target"]))
//		if ($value == $filters["target"]) print " selected";
//   	print ">" . $targets['target_name'][$key] . "</OPTION>" . LF;
//}
//print "</SELECT></td></tr>" . LF; 
print "</table>";
//----
print "<center><table>";
print "<tr><td><input type='submit' name='reset_filters' value='Reset Filters' class='submit'></td></tr>";
print "</table></center>";
//----

/** @todo define new css rules for alternating BG color... */
print "<table class='viewall'>" . LF;
print "<caption>For details please click on Observatory entry name</caption>" . LF;
print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>E-MAIL</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGTH)</i></th></tr>" . LF;

$index = 0;
foreach($resources as $row)
{
	if($index % 2) 
		print "<tr class='even'>";
	else
		print "<tr class='odd'>";
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
	
	$index++;
}

if(empty($resources))
	print "<tr><td colspan='6'><h3>There are no Observatory entries</h3></td></tr>" . LF;

print "</table>" . LF;
		
?>