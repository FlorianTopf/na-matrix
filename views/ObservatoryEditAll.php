<?php
/**
 * @file ObservatoryEditAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<div><input type='hidden' name='page' value='edit'/></div>" . LF ;
//show_message();

//Observatories
if ($action == "approve")
	printEditAllTable("ground-based facility", $resources, "obs", $action);
else
	//a little hack => the userlevel (as action)
	printEditAllTable("ground-based facility", $resources, "obs", $userlevel);
?>