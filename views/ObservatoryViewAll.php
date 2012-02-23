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
print "<td class='filter' colspan='4'><select name='obs_filters[diameter_sign]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
print "<option value='>=2'";
if(isset($filters["diameter_sign"]))
	if ($filters["diameter_sign"] == ">=2") print " selected";
print ">>= 2 m";
print "</option>";
print "<option value='<2'";
if(isset($filters["diameter_sign"]))
	if ($filters["diameter_sign"] == "<2") print " selected";
print ">< 2 m";
print "</option></select>";
/** @todo integrate textfield => ajax call */
//print "<input name='obs_filters[diameter_m]'" .
//	(isset($filters["diameter_m"]) ? "value='" . $filters["diameter_m"] . "'" : "value=''") . 
//	" size='20'/>";
print "</td></tr>" . LF; 
//----
//Wavelength Ranges Filter
$wavelength_ranges = $_observatory->get_wavelength_ranges();
print "<tr><td class='title' colspan='2'><b>Filter by Wavelength Ranges</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[wavelength_range]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($wavelength_ranges['id'] as $key => $value)
{
	print "<option value='" . $wavelength_ranges['acronym'][$key] . "'";
	if(isset($filters["wavelength_range"]))
		if ($wavelength_ranges['acronym'][$key] == $filters["wavelength_range"]) print " selected";
   	print ">" . $wavelength_ranges['acronym'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF; 
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
print "<tr><td><button class='submit' type='submit' name='reset_filters' value='Reset Filters' class='submit'>Reset Filters</button></td></tr>";
print "</table></center>";
//----

print "<table class='viewall'>" . LF;
print "<caption>For details please click on ground-based facility entry name</caption>" . LF;
//print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>E-MAIL</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGTH)</i></th></tr>" . LF;
print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGTH)</i></th></tr>" . LF;

$index = 0;
foreach($resources as $row)
{
	if($index % 2) 
		print "<tr class='even'>";
	else
		print "<tr class='odd'>";
	print "<td width='260px'><span title='Click for more details' onclick=\"return openwin('views/ObservatoryView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["name"]) . "</span></td>";
    print "<td width='150px'>" . stripslashes($row["institution"]) . "</td>";
	print "<td>" . stripslashes($row["country"]) . "</td>";
//	if($row["hide_email"])
//    	print "<td class='red'>Not Displayed</td>";
//    else
//       	print "<td><a href='mailto:" . $row["email"] . "'>" . $row["email"] . "</a></td>";
	if($row["hide_web_address"])
		print "<td class='red'>Not Displayed</td>";
	/** @todo check performance with more than 100 entries! */
    elseif(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) 
    	print "<td><a href='" . stripslashes($row["web_address"]) . "' target='_blank'><img width='30' src='images/globe.png' alt='globe'/></a></td>";
    else
    	print "<td></td>";
    print "<td>";
    foreach($row["telescope_types"] as $key => $type)
    {	
    	print "<b>";
		($row["diameter_m"][$key] != 0) ? print $row["diameter_m"][$key] : print " ";
    	print $type . "</b>";
       if($row["wavelengths"][$key] != ", " && $row["wavelengths"][$key] != "")
        	print " (<i>" . trim($row["wavelengths"][$key], ", ") . "</i>)";
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