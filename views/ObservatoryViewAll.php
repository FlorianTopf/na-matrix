<?php 
/**
 * @file ObservatoryViewAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 *
 * @todo add sort functionality on each column
 */

print "<div><input type='hidden' name='page' value='browse'/></div>" . LF ;
//show_message();

print "<h2>There are " . $resources_count . " ground-based facilities listed in the matrix</h2>" . LF;
print "<table class='filter'>" . LF;
print "<caption>Filter the content by selecting one of the dropdown menus or type a facility name to search</caption>" . LF;
//----
//Name Search (with autocompleter)
print "<tr><td class='title' colspan='2'><b>Search by Name</b></td>";
print "<td class='filter' colspan='4'><input name='obs_filters[name]' class='obs_name'" .
(isset($filters["name"]) ? "value='" . $filters["name"] . "'" : "value=''") . " size='80'/>" . LF;
/** this value is manipulated by jquery */
print "<input name='obs_filters[id]' class='obs_id' type='hidden'" . 
(isset($filters["id"]) ? "value='" . $filters["id"] . "'" : "value=''") . "/>";
print "</td></tr>" . LF;
//----
//Country Filter
$countries = $_observatory->get_countries();
print "<tr><td class='title' colspan='2'><b>Filter by Country</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[country]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($countries['id'] as $key => $value)
{
	print "<option value='" . $value . "'";
	if(isset($filters["country"]))
		if ($value == $filters["country"]) print " selected";
   	print ">" . $countries['name'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF;
//----
//Telescope Type Filter
$telescope_types = $_observatory->get_telescope_types();
print "<tr><td class='title' colspan='2'><b>Filter by Telescope Type</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[telescope_type]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($telescope_types['id'] as $key => $value)
{
	print "<option value='" . $value . "'";
	if(isset($filters["telescope_type"]))
		if ($value == $filters["telescope_type"]) print " selected";
   	print ">" . $telescope_types['name'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF; 
//----
//Diameter Filter
print "<tr><td class='title' colspan='2'><b>Filter by Telescope Diameter</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[diameter_m]' onchange='this.form.submit()'>" . LF;
print "<option value='greater'>>=";
if(isset($filters["diameter_m"]))
	if ($filters["diameter_m"] == "greater") print " selected";
print "</option>";
print "<option value='smaller'><";
if(isset($filters["diameter_m"]))
	if ($filters["diameter_m"] == "smaller") print " selected";
print "</option>";
print "</select>";
//print "<input name='obs_filters[diameter_m]'" .
//	(isset($filters["diameter_m"]) ? "value='" . $filters["diameter_m"] . "'" : "value=''") . 
//	" size='20'/>"
print "</td></tr>" . LF; 
//----
//Research Area Filter
$research_areas = $_observatory->get_research_areas();
print "<tr><td class='title' colspan='2'><b>Filter by Research Area</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[research_area]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($research_areas['id'] as $key => $value)
{
	print "<option value='" . $value . "'";
	if(isset($filters["research_area"]))
		if ($value == $filters["research_area"]) print " selected";
   	print ">" . $research_areas['name'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF; 
//----
//Target Filter
$targets = $_observatory->get_targets();
print "<tr><td class='title' colspan='2'><b>Filter by Target</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[target]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($targets['id'] as $key => $value)
{
	print "<option value='" . $value . "'";
	if(isset($filters["target"]))
		if ($value == $filters["target"]) print " selected";
   	print ">" . $targets['target_name'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF; 
print "</table>";
//----
print "<center><table>";
print "<tr><td><input type='submit' name='reset_filters' value='Reset Filters' class='submit'></td></tr>";
print "</table></center>";
//----

print "<table class='viewall'>" . LF;
print "<caption>For details please click on ground-based facility entry name</caption>" . LF;
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
	print "<tr><td colspan='6'><h3>There are no ground-based facility entries</h3></td></tr>" . LF;

print "</table>" . LF;
		
?>