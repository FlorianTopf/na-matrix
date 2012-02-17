<?php
/**
 * XML location file generator for Google Maps
 * called by according MAP functions in functions.js
 *
 * @file observatoriesXML.php
 * @version $Id$
 * @author Florian Topf
 *
 * @todo we need to take care of observatories who want to be hidden!!
 */

include_once ('../lib/php/orm/DbConnector.php');

//Start XML file, create parent node
$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node);

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

header("Content-type: text/xml");

//Iterate through the rows, adding XML nodes for each
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
  //ADD TO XML DOCUMENT NODE
  $node = $dom->createElement("marker");
  $newnode = $parnode->appendChild($node);
  $newnode->setAttribute("id", $row['id']);
  $newnode->setAttribute("name", $row['name']);
  $newnode->setAttribute("lat", $row['latitude']);
  $newnode->setAttribute("lng", $row['longitude']);
}

echo $dom->saveXML();

?>