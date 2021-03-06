<?php
/**
 * Autocomplete Procedure
 * Runs an Autocompleter on Telescope Names
 * called by telescope_completer in functions.js
 *
 * @file telescopeNames.php
 * @version $Id$
 * @author Florian Topf
 * 
 * no utf8_decode and utf8_encode needed anymore
 * @todo we need only approved telescopes!
 */

// no term passed - just exit early with no response
if (empty($_GET['term'])) exit ;
//$q = strtolower(utf8_decode($_GET["term"]));
$q = strtolower($_GET["term"]);
// remove slashes if they were magically added
if (get_magic_quotes_gpc()) $q = stripslashes($q);

include_once ('../lib/php/orm/DbConnector.php');

//CREATE DATABASE CONNECTION
$link = new DbConnector('');

$query = "SELECT DISTINCT telescope_name AS name FROM telescopes WHERE telescope_name LIKE '%$q%';";
$result = $link->query($query);
if ($link->getNumRows($result) > 0)
{
	$return = array();
	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	{
//		array_push($return, array("id" => utf8_encode($row['name']), 
//			"label" => utf8_encode($row['name']), 
//			"value" => strip_tags(utf8_encode($row['name']))));
		array_push($return, array("id" => $row['name'], 
			"label" => $row['name'], 
			"value" => strip_tags($row['name'])));
	}
}
else
{
	$return = false;
}
mysqli_free_result($result);

$link->close();

// json_encode is available in PHP 5.2 and above, or you can install a PECL module in earlier versions
echo json_encode($return);

?>