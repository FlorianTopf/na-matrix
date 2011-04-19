<?php
/**
 * @file logout.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  $_SESSION = array();

  print "<SCRIPT>window.open('index.php','_self')</SCRIPT>";

?>