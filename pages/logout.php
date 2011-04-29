<?php
/**
 * @file logout.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  $_SESSION = array();

  print "<script type='text/javascript'>window.open('index.php','_self')</script>";

?>