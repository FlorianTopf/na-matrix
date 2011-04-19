<?php
/**
 * Input Validation Procedure
 * Tests if an Observatory name already exists
 * called by validator.js
 *
 * @file observatories.php
 * @version $Id$
 * @author Florian Topf
 */

require_once("setup.php");
require_once("functions.php");

$name = trim(strtolower($_GET['add_obs_name']));

//CREATE DATABASE CONNECTION
$link = dbiSelect();

$query = "SELECT * FROM observatories WHERE name='$name';";
$result = mysqli_query($link, $query);
if (mysqli_num_rows($result) > 0)
{
	$output = false;
}
else
{
	$output = true;
}
mysqli_free_result($result);

echo json_encode($output);
?>
