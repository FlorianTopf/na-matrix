<?php
/**
 * Input Validation Procedure
 * Tests if an Observatory name already exists
 * called by validator.js
 *
 * @file spacemissions.php
 * @version $Id$
 * @author Florian Topf
 */

include_once ('../lib/php/orm/DbConnector.php');

$name = trim(strtolower($_GET['add_spa_name']));

//CREATE DATABASE CONNECTION
$link = new DbConnector();

$query = "SELECT * FROM space_missions WHERE mission_name='$name';";
$result = $link->query($query);

if (mysqli_num_rows($result) > 0)
	$output = false;
else
	$output = true;
	
mysqli_free_result($result);

$link->close();

echo json_encode($output);
?>
