<?php
/**
 * @file ObservatoryEditAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<div><input type='hidden' name='page' value='edit'/></div>" . LF ;
//show_message();

// standard values for below!
$name = "ground-based facility";
$type = "obs";

//Observatories
// can anyway only be done by admins
if ($action == "approve")
{	
	if (empty($resources))
		print "<h3>There are no {$name} entries to edit.</h3>" . LF;	
	else
	{	
		print "<table id='editsorter' class='viewall tablesorter'>" . LF;
    	print "<caption>To edit please click on the name of the {$name}</caption>" . LF;
    	print "<thead>";
    	print "<tr><th>ID</th><th>NAME</th><th>CREATION DATE</th><th>OWNER</th><th>MODIFICATION DATE</th><th>EDITOR</th><th>SAVED FOR LATER</th></tr>" . LF;
    	print "</thead>";
    	print "<tbody>";
    	$index = 0;
    	foreach ($resources as $entry)
    	{
   			if($index % 2) 
				print "<tr class='even'>";
			else
				print "<tr class='odd'>";
   			print "<td width='40px'>" . $entry["id"] . "</td>";

   			print "<td><a title='Click to edit' class='hand' " .
              	"href='index.php?page=add&amp;action=edit&amp;id={$entry["id"]}" .
              	"&amp;res_type={$type}&amp;{$action}=1" .
              	"'>" . $entry["name"] . "</a></td>";

        	print "<td width='100px'>" . $entry["creation_date"] . "</td>";
        	print "<td width='90px'>" . $users["fname"][$entry["user_id"]] . " " . $users["lname"][$entry["user_id"]] . "</td>";
        	print "<td width='120px'>" . $entry["modification_date"] . "</td>";
        	print "<td width='90px'>" . $users["fname"][$entry["last_saved_by"]] . " " . $users["lname"][$entry["last_saved_by"]] . "</td>"; 
        	print "<td width='70px'><b class='red'>" . ($entry["saved_for_later"] ? "YES" : "NO") . "</b></td>";
        	print "</tr>" . LF;
        	
        	$index++;
    	}
    	print "</tbody>";
    	print "</table>" . LF;
	}	
}
else {
	//for anonymous user (all not associated entries), we give empty values
	$users['fname']['1'] = "";
	$users['lname']['1'] = "";
	
	if (empty($resources))
	{
		print "<h3>There are no {$name} entries to edit.</h3>" . LF;	
		if($userlevel >= 31 && isset($filters["user_id"]))
		{
			print "<center><table>";
			print "<tr><td><button class='submit' type='submit' name='reset_filters' value='Reset Filters' class='submit'>Reset Filters</button></td></tr>";
			print "</table></center>";
		}	
	}
	else
	{		
		if($userlevel >= 31)
		{
			print "<h2>There are " . count($resources) . " {$name} entries to edit.</h2>" . LF;
			
			print "<table class='filter'>" . LF;
			print "<caption>Filter the content by typing a facility name to search</caption>" . LF;
			//Name Search (with autocompleter)	
			print "<tr><td class='title' colspan='2'><b>Search by Name</b></td>";
			print "<td class='filter' colspan='4'><input name='obs_filters[name]' class='obs_name'" .
			(isset($filters["name"]) ? "value='" . $filters["name"] . "'" : "value=''") . " size='80'/>" . LF;
			/** this value is manipulated by jquery */
			print "<input name='obs_filters[id]' class='obs_id' type='hidden'" . 
			(isset($filters["id"]) ? "value='" . $filters["id"] . "'" : "value=''") . "/>";
			print "</td></tr>" . LF;
			//User Name filter
			print "<tr><td class='title' colspan='2'><b>Filter by Owner</b></td>";
			print "<td class='filter' colspan='4'>";
			print "<select name='obs_filters[user_id]' onchange='this.form.submit()'>";
			print "<option value=''>ALL</option>";
			foreach($users['id'] as $key => $value)
			{
				print "<option value='{$value}'" .
				((isset($filters["user_id"]) && $filters["user_id"] == $value) ? " selected='selected'" : " ");
				print ">" . $users['lname'][$key] . ", " . $users['fname'][$key];
				print "</option>";
			}
			print "</select>";
			print "</td></tr>";
			print "</table>" . LF;
			print "<center><table>";
			print "<tr><td><button class='submit' type='submit' name='reset_filters' value='Reset Filters' class='submit'>Reset Filters</button></td></tr>";
			print "</table></center>";
		}
		
		print "<table id='editsorter' class='viewall tablesorter'>" . LF;
    	print "<caption>To edit please click on the name of the {$name}</caption>" . LF;
		print "<thead>";
    	if($userlevel >= 31) // in the case if we tick edit all and we are part of the admin group	
    		print "<tr><th>ID</th><th>NAME</th><th>CREATION DATE</th><th>OWNER</th><th>MODIFICATION DATE</th><th>EDITOR</th></tr>" . LF;
    	else if($userlevel == 11) // only for normal users, they are in "my entries"
    		print "<tr><th>ID</th><th>NAME</th><th>CREATION DATE</th><th>MODIFICATION DATE</th><th>EDITOR</th><th>APPROVED</th><th>SAVED FOR LATER</th></tr>" . LF;
    	print "</thead>";
    	print "<tbody>";
    	$index = 0;
    	foreach ($resources as $entry)
    	{
   			if($index % 2) 
				print "<tr class='even'>";
			else
				print "<tr class='odd'>";
   			print "<td width='40px'>" . $entry["id"] . "</td>";

   			print "<td><a title='Click to edit' class='hand' " .
            	"href='index.php?page=add&amp;action=edit&amp;id={$entry["id"]}&amp;res_type={$type}" .
              	"'>" . $entry["name"] . "</a></td>";
   			    
        	print "<td width='100px'>" . $entry["creation_date"] . "</td>";
        	if($userlevel >= 31)
        		print "<td width='90px'>" . $users["fname"][$entry["user_id"]] . " " . $users["lname"][$entry["user_id"]] . "</td>";
        	print "<td width='120px'>" . $entry["modification_date"] . "</td>";
        	print "<td width='90px'>" . $users["fname"][$entry["last_saved_by"]] . " " . $users["lname"][$entry["last_saved_by"]] . "</td>"; 
        	if($userlevel == 11)
        	{
        		print "<td width='90px'><b class='red'>" . ($entry["approved"] ? "YES" : "NO") . "</b></td>";
        		print "<td width='70px'><b class='red'>" . ($entry["saved_for_later"] ? "YES" : "NO") . "</b></td>";	
        	}
        	print "</tr>" . LF;
        	
        	$index++;
    	}
    	print "</tbody>";
    	print "</table>" . LF;
	}	
}
?>