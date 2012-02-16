<?php 
/**
 * @file SpacemissionEditAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 * 
 * @todo we need to make that hardcoded for the moment (since editall was changed for obs)
 */

print "<div><input type='hidden' name='page' value='edit'/></div>" . LF ;
//show_message();

//Space Missions
$name = "space mission";
$type = "spa";

	if (empty($resources))
		print "<h3>There are no {$name} entries to edit.</h3>" . LF;	
	else
	{
		print "<table class='viewall'>" . LF;
    	print "<caption>To edit please click on the name of the {$name}</caption>" . LF;
    	print "<tr><th>ID</th><th>NAME</th><th>CREATION DATE</th><th>MODIFICATION DATE</th></tr>" . LF;
    	$index = 0;
    	foreach ($resources as $entry)
    	{
   			if($index % 2) 
				print "<tr class='even'>";
			else
				print "<tr class='odd'>";
   			print "<td>" . $entry["id"] . "</td>";

   			print "<td><a title='Click to edit' class='hand' " .
              	"href='index.php?page=add&amp;action=edit&amp;id={$entry["id"]}&amp;res_type={$type}" .
              	"'>" . $entry["name"] . "</a></td>";
   			
        	print "<td>" . $entry["creation_date"] . "</td>";
        	print "<td>" . $entry["modification_date"] . "</td>";
        	print "</tr>" . LF;
        	
        	$index++;
    	}
    	print "</table>" . LF;
	}

?>