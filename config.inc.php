<?php
/**
 * @file config.inc.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

ini_set("display_errors", "1");

error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);

//  set_include_path(
//  '.'.PATH_SEPARATOR.
//  './lib/php/orm'.PATH_SEPARATOR.
//  get_include_path()
//  );

//TEST SERVER
//define("DOC_ROOT", "/Applications/XAMPP/htdocs/na1-matrix");
//define("DOC_ROOT", "D:/xampp/htdocs/na1-matrix");

//REAL NA1 SERVER:
define("DOC_ROOT", "/users/iwf/europlanet/matrix");

// Mail setup
define("MAIL_SMTP", "smtp.oeaw.ac.at");
define("MAIL_TO", "manuel.scherf@oeaw.ac.at, florian.topf@oeaw.ac.at");
define("MAIL_TO_ADD", "manuel.scherf@oeaw.ac.at, florian.topf@oeaw.ac.at, jfabbri@star.ucl.ac.uk");
define("MAIL_FROM", "manuel.scherf@oeaw.ac.at");
define("MAIL_REPLY", "manuel.scherf@oeaw.ac.at");

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


// Account selection lists (for registration
$user_titles = array("Dr.", "Prof.", "Ms.", "Mrs.", "Mr.");
$usage_selection = array("scientific", "commercial", "educational",
                           "other");
?>