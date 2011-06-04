<?php
/**
 * Input Validation Procedure
 * Tests if an Observatory name already exists
 * called by validate in functions.js
 *
 * @file observatories.php
 * @version $Id$
 * @author Florian Topf
 */

include_once ('../lib/php/orm/DbConnector.php');

$name = trim(strtolower($_GET['add_obs_name']));

//CREATE DATABASE CONNECTION
$link = new DbConnector('');

$query = "SELECT * FROM observatories WHERE name='$name';";
$result = $link->query($query);

if ($link->getNumRows($result) > 0)
	$output = false;
else
	$output = true;

mysqli_free_result($result);

$link->close();

echo json_encode($output);
?>
