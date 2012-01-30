<?php
/**
 * Input Validation / Autocompleter Procedure
 * Tests if an Observatory name already exists
 *  called by validate in functions.js 
 * Makes a selection of Observatory names according to user input
 *  called by autocomplete in function.js
 *
 * @file spacemissions.php
 * @version $Id$
 * @author Florian Topf
 * 
 * 
 * no utf8_decode and utf8_encode needed anymore
 */

include_once ('../lib/php/orm/DbConnector.php');



//CREATE DATABASE CONNECTION
$link = new DbConnector('');

if(isset($_GET["extend"]))
{
	// no term passed - just exit early with no response
	if (empty($_GET['term'])) exit ;
//		$name = strtolower(utf8_decode($_GET["term"]));
		$name = strtolower($_GET["term"]);
	// remove slashes if they were magically added
	if (get_magic_quotes_gpc()) $name = stripslashes($name);
		$query = "SELECT id, mission_name FROM space_missions WHERE mission_name LIKE '%$name%';";
}
else
{
	$name = trim(strtolower($_GET['add_spa_name']));
	$query = "SELECT id FROM space_missions WHERE mission_name='$name';";
	//$query = "SELECT * FROM space_missions WHERE mission_name='$name';";
}

$result = $link->query($query);

if ($link->getNumRows($result) > 0)
{
	if(isset($_GET["extend"]))
	{
		$output = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
		{
//			array_push($output, array("id" => $row['id'], 
//				"label" => utf8_encode($row['mission_name']), 
//				"value" => strip_tags(utf8_encode($row['mission_name']))));
			array_push($output, array("id" => $row['id'], 
				"label" => $row['mission_name'], 
				"value" => strip_tags($row['mission_name'])));
		}
	}
	else {
		$output = false; }
}
else
	$output = true;

mysqli_free_result($result);

$link->close();

echo json_encode($output);
?>
