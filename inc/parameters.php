<?php
/**
 * @file parameters.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

 // Set parameter values dependent on operating system
  if (strtoupper(substr(PHP_OS, 0, 3)) === "WIN")
  {
    define("LF", "\r\n");
  }
  else
  {
    define("LF", "\n");
  }

// Maximum size for file uploads
  define("MAX_UPLOAD_SIZE", 200000);

// Account selection lists
  $user_titles = array("Dr.", "Prof.", "Ms.", "Mrs.", "Mr.");
  $usage_selection = array("scientific", "commercial", "educational",
                           "other");
?>
