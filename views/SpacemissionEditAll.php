<?php 
/**
 * @file SpacemissionEditAll.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

print "<div><input type='hidden' name='page' value='edit'/></div>" . LF ;
//show_message();

//Space Missions
printEditAllTable("space mission", $resources, "spa");

?>