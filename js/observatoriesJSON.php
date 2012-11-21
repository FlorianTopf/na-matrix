<?php
/**
 * JSON location file generator for WebGL Globe
 * called by according functions in functions.js
 *
 * @file observatoriesJSON.php
 * @version $Id$
 * @author Florian Topf
 *
 * @todo we need to take care of observatories who want to be hidden!!
 */

include_once ('../lib/php/orm/DbConnector.php');


//CREATE DATABASE CONNECTION
$link = new DbConnector('');

//Select necessary rows in the Observatories table
//Questionnaire: "AND observatories.approved = 1"
//$query = "SELECT id, name, latitude, longitude FROM observatories WHERE longitude != 0.000000 AND latitude != 0.000000 AND observatories.approved = 1";
//Hidden Fields!!
$query = "SELECT observatories.id,  observatories.name, observatories.latitude, observatories.longitude FROM observatories, hidden_fields WHERE" . 
" observatories.longitude != 0.000000 AND observatories.latitude != 0.000000 AND hidden_fields.longitude = 0 AND hidden_fields.latitude = 0 AND " . 
"observatories.approved = 1 AND observatories.id = hidden_fields.id;";
$result = $link->query($query);
//Error message for query
if (!$result) {
  die('Invalid query: ' . $link->error());
}

header("Content-type: application/json");

$jsonobject = array();
$content = array();
array_push($jsonobject, "1990");
//Iterate through the rows, adding XML nodes for each
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){

//array_push($content, $row['latitude'] . "," . $row['longitude'] . ", 0.1");

//$content .= $row['latitude'] . "," . $row['longitude'] . ", 0.1, ";]
array_push($content, (double) $row['latitude']);
array_push($content, (double) $row['longitude']);
array_push($content, 0.5);
}

//array_push($test, $content);

//array_push($jsonobject, $test);

$test = array(array("1990", $content));

echo json_encode($test);

?>