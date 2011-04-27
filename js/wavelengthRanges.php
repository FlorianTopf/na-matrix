<?php
/**
 * Autocomplete Procedure
 * Runs an Autocompleter on Wavelength Ranges
 * called by wavelength_completer in functions.js
 *
 * @file wavelengthRanges.php
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

$query = "SELECT * FROM wavelength_ranges WHERE acronym LIKE '%$q%';";
$result = $link->query($query);
if ($link->getNumRows($result) > 0)
{
	$return = array();
	while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
	{
		array_push($return, array("id"=>$row['acronym'], "label"=>$row['acronym'] . 
		" [" . $row['name'] . "]" , "value" => strip_tags($row['acronym'])));
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


//$items = array(
//"radio"=>"radio",
//"very high frequency"=>"radio",
//"high frequency"=>"radio",
//"medium frequency"=>"radio",
//"low frequency"=>"radio"
//);

//$result = array();
//foreach ($items as $key=>$value) {
//if (strpos(strtolower($key), $q) !== false) {
//
//}
//if (count($result) > 11)
//break;
//}

// json_encode is available in PHP 5.2 and above, or you can install a PECL module in earlier versions
//echo json_encode($result);

?>