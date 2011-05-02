<?php
/**
 * Autocomplete Procedure
 * Runs an Autocompleter on Instrument Names
 * called by instrument_completer in functions.js
 *
 * @file instrumentNames.php
 * @version $Id$
 * @author Florian Topf
 */

// no term passed - just exit early with no response
if (empty($_GET['term'])) exit ;
$q = strtolower($_GET["term"]);
// remove slashes if they were magically added
if (get_magic_quotes_gpc()) $q = stripslashes($q);

include_once ('../lib/php/orm/DbConnector.php');

//CREATE DATABASE CONNECTION
$link = new DbConnector();

$query = "SELECT DISTINCT instrument_name AS name FROM instruments WHERE instrument_name LIKE '%$q%';";
$result = $link->query($query);
if ($link->getNumRows($result) > 0)
{
	$return = array();
	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	{
		array_push($return, array("id"=>$row['name'], "label"=>$row['name'],
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