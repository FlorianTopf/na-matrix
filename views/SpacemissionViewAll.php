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

print "<h2>There are " . $resources_count . " space missions listed in the matrix</h2>" . LF;
print "<table class='filter'>" . LF;
print "<caption>Filter the content by selecting one of the dropdown menus or type a mission name to search</caption>" . LF;
//----
//Name Search (with autocompleter)
print "<tr><td class='title' colspan='2'><b>Search by Name</b></td>";
print "<td class='filter' colspan='4'><input name='spa_filters[name]' class='spa_name'" .
(isset($filters["name"]) ? "value='" . $filters["name"] . "'" : "value=''") . " size='80'/>" . LF;
/** this value is manipulated by jquery */
print "<input name='spa_filters[id]' class='spa_id' type='hidden'" . 
(isset($filters["id"]) ? "value='" . $filters["id"] . "'" : "value=''") . "/>";
print "</td></tr>" . LF;
//----
//Space Agency Filter
$agencies = $_spacemission->get_agencies();
print "<tr><td class='title' colspan='2'><b>Filter by Space Agency</b></td>";
print "<td class='filter' colspan='4'><SELECT name='spa_filters[agency]' onchange='this.form.submit()'>" . LF;
print "<OPTION value=''>ALL</OPTION>";
foreach($agencies['id'] as $key => $value)
{
	print "<OPTION value='" . $value . "'";
	if(isset($filters["agency"]))
		if ($value == $filters["agency"]) print " selected";
   	print ">" . $agencies['acronym'][$key] . " (" . $agencies['name'][$key]. ")" . "</OPTION>" . LF;
}
print "</SELECT></td></tr>" . LF;
//----
//Research Area Filter
$research_areas = $_spacemission->get_research_areas();
print "<tr><td class='title' colspan='2'><b>Filter by Area of Interest</b></td>";
print "<td class='filter' colspan='4'><SELECT name='spa_filters[research_area]' onchange='this.form.submit()'>" . LF;
print "<OPTION value=''>ALL</OPTION>";
foreach($research_areas['id'] as $key => $value)
{
	print "<OPTION value='" . $value . "'";
	if(isset($filters["research_area"]))
		if ($value == $filters["research_area"]) print " selected";
   	print ">" . $research_areas['name'][$key] . "</OPTION>" . LF;
}
print "</SELECT></td></tr>" . LF; 
//----
//Target Filter
$targets = $_spacemission->get_targets();
print "<tr><td class='title' colspan='2'><b>Filter by Target</b></td>";
print "<td class='filter' colspan='4'><SELECT name='spa_filters[target]' onchange='this.form.submit()'>" . LF;
print "<OPTION value=''>ALL</OPTION>";
foreach($targets['id'] as $key => $value)
{
	print "<OPTION value='" . $value . "'";
	if(isset($filters["target"]))
		if ($value == $filters["target"]) print " selected";
   	print ">" . $targets['target_name'][$key] . "</OPTION>" . LF;
}
print "</SELECT></td></tr>" . LF; 
print "</table>";
//----
print "<center><table>";
print "<tr><td><button class='submit' type='submit' name='reset_filters' value='Reset Filters' class='submit'>Reset Filters</button></td></tr>";
print "</table></center>";
//----

print "<table class='viewall'>" . LF;
print "<caption>For details please click on space mission entry name</caption>" . LF;
print "<tr><th>NAME</th><th>AGENCY</th><th>WEB</th><th>LAUNCH DATE</th><th>MISSION END</th><th>TARGETS</th></tr>" . LF;

$index = 0;
foreach($resources as $row)
{
	if($index % 2) 
		print "<tr class='even'>";
	else
		print "<tr class='odd'>";
	print "<td><span title='Click for more details' onclick=\"return openwin('views/SpacemissionView.php?" .
		"id=" . $row["id"] . "')\" class='hand'>" . stripslashes($row["mission_name"]) . "</span></td>";
	print "<td width='70px'><a href='" . stripslashes($row["agency_web_address"]) . "' target='_blank'>" . htmlentities($row["agency"]) . "</a></td>";
	/** @todo check performance with more than 100 entries! */
	if(isValidURL($row["web_address"])) //if(url_exists($row["web_address"])) 
		print "<td><a href='" . stripslashes($row["web_address"]) . "' target='_blank'><img width='30' src='images/globe.png' alt='globe'/></a></td>";
	else
		print "<td></td>";
	print "<td width='100px'>" . $row["launch_date"] . "</td>";
	print "<td width='100px'>" . (($row["death_date"] == "0000-00-00") ? "" : $row["death_date"]) . "</td>";
	print "<td width='120px'>";
    foreach($row["targets"] as $target)
    {
    	print $target . "<br/>";
    }
	print "</td>";
    print "</tr>" . LF;
    
    $index++;
}

if(empty($resources))
	print "<tr><td colspan='6'><h3>There are no space mission entries</h3></td></tr>" . LF;
	
print "</table>" . LF;

?>