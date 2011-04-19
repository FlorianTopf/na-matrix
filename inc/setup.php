<?php
/**
 * @file setup.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

 // Database login
  define("DB_HOST", "localhost");
//  define("DB_USERNAME", "europlanet_na1");
//  define("DB_PASSWORD", "europlanet%na1");
//  define("DB_DATABASE", "europlanet_na1");
  define("DB_USERNAME", "root");
  define("DB_PASSWORD", "");
  define("DB_DATABASE", "europlanet_na1_test");

  define("DOCROOT", "/Applications/XAMPP/htdocs/na1-matrix");

  //REAL NA1 SERVER:
  //define("DOCROOT", "/users/iwf/europlanet/matrix");

  // Mail setup
  define("MAIL_SMTP", "smtp.oeaw.ac.at");
  define("MAIL_TO", "robert.stoeckler@oeaw.ac.at,florian.topf@oeaw.ac.at");
  define("MAIL_FROM", "robert.stoeckler@oeaw.ac.at");
  define("MAIL_REPLY", "robert.stoeckler@oeaw.ac.at");
?>
