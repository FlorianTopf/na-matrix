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
//Observatory Name Search (with autocompleter)
print "<tr><td class='title' colspan='2'><b>Search by Observatory Name</b></td>";
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
//Telescope Name Search (with autocompleter)
print "<tr><td class='title' colspan='2'><b>Search by Telescope Name</b></td>";
print "<td class='filter' colspan='4'><input name='obs_filters[t_name]' class='obs_t_name'" .
(isset($filters["t_name"]) ? "value='" . $filters["t_name"] . "'" : "value=''") . " size='80'/>" . LF;
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
//Mobile Station Filter
print "<tr><td class='title' colspan='2'><b>Show Mobile Stations only</b></td>";
print "<td class='filter'><input name='obs_filters[mobile]' type='checkbox' value='1' onchange='this.form.submit()'";
	isset($filters["mobile"]) ? print " checked='checked'" : print "";
print "/></td></tr>";
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
print "<option value='<2 AND diameter_m>0'";
if(isset($filters["diameter_sign"]))
	if ($filters["diameter_sign"] == "<2 AND diameter_m>0") print " selected";
print ">< 2 m";
print "</option>";
print "<option value='=0'";
if(isset($filters["diameter_sign"]))
	if ($filters["diameter_sign"] == "=0") print " selected";
print ">NOT DEFINED";
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
//Instrument Type Filter
$instrument_types = $_observatory->get_instrument_types();
print "<tr><td class='title' colspan='2'><b>Filter by Instrument Type</b></td>";
print "<td class='filter' colspan='4'><select name='obs_filters[instrument_type]' onchange='this.form.submit()'>" . LF;
print "<option value=''>ALL</option>";
foreach($instrument_types['id'] as $key => $value)
{
	print "<option value='" . $value . "'";
	if(isset($filters["instrument_type"]))
		if ($value == $filters["instrument_type"]) print " selected";
   	print ">" . $instrument_types['name'][$key] . "</option>" . LF;
}
print "</select></td></tr>" . LF; 
//----
//Research Area Filter
$research_areas = $_observatory->get_research_areas();
print "<tr><td class='title' colspan='2'><b>Filter by Area of Interest</b></td>";
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

// We go through the results for creating a JSON object and the MAP
 $filterJSON = array();
foreach($resources as $row)
{
	array_push($filterJSON, array("id" => $row['id'], 
	    "name" => strip_tags($row['name']), 
    	"lat" => $row['latitude'],
    	"lng" => $row['longitude']));
} 
print "<div><p><a href='' class='ui-state-default ui-corner-all toggle_map' style='padding:6px 6px 6px 6px;text-decoration:none;'>Show Map</a></p></div>";
print "<div id='map' class='map' style='width: 775px; height: 450px'></div>" . LF ;
print "<script>$(document).trigger('filterMapIsReady', '" . json_encode($filterJSON,JSON_HEX_TAG|JSON_HEX_APOS|JSON_HEX_QUOT|JSON_HEX_AMP) . "');</script>" . LF;

print "<table id='browsesorter' class='viewall tablesorter'>" . LF;
print "<caption>For details please click on ground-based facility entry name</caption>" . LF;
print "<thead>";
//print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>E-MAIL</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGTH)</i></th></tr>" . LF;
print "<tr><th>NAME</th><th>INSTITUTION</th><th>COUNTRY</th><th>WEB</th><th>TELESCOPE-TYPE <i>(WAVELENGTH)</i></th></tr>" . LF;
print "</thead>";

print "<tbody>";
$index = 0;
foreach($resources as $row)
{
	if($index % 2) 
		print "<tr class='even'>";
	else
		print "<tr class='odd'>";
	print "<td width='220px'><span title='Click for more details' onclick=\"return openwin('views/ObservatoryView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["name"]) . "</span></td>";
	//print "<td width='260px'><span title='Click for more details' onclick=\"showUrlInDialog('views/ObservatoryView.php?id=" . 
	//	$row["id"] . "'); return false;\" class='hand'>" . stripslashes($row["name"]) ."</span></td>";
    print "<td width='120px'>" . stripslashes($row["institution"]) . "</td>";
	print "<td width='90px'>" . stripslashes($row["country"]) . "</td>";
//	if($row["hide_email"])
//    	print "<td class='red'>Not Displayed</td>";
//    else
//       	print "<td><a href='mailto:" . $row["email"] . "'>" . $row["email"] . "</a></td>";
	if($row["hide_web_address"])
		print "<td width='10px'class='red'>Not Displayed</td>";
	/** @todo check performance with more than 100 entries! */
    elseif(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) 
    	print "<td width='10px'><a href='" . stripslashes($row["web_address"]) . "' target='_blank'><img width='30' src='images/globe.png' alt='globe'/></a></td>";
    else
    	print "<td width='10px'></td>";
    print "<td width='250px'>";
    //sort function for telescope diameter within one entry (indexes are still correct)
    arsort($row["diameter_m"], SORT_NUMERIC);
    //foreach($row["telescope_types"] as $key => $type)
    foreach($row["diameter_m"] as $key => $diameter) 
    {	
    	print "<b>";
		//($row["diameter_m"][$key] != 0) ? print $row["diameter_m"][$key] : print " ";
		($diameter != 0) ? print $diameter : print " ";
    	//print $type . "</b>";
    	print $row["telescope_types"][$key] . "</b>";
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

print "</tbody>";
print "</table>" . LF;
		
?>