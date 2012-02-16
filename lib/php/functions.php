<?php
/**
 * @file functions.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  function checkbox_value($name, $x_value=NULL, $y_value=NULL) 
  {
  	if($x_value != NULL && $y_value != NULL)
  		return (isset($_POST[$name][$x_value][$y_value]) ? "1" : "0");
  	if($x_value != NULL && $y_value == NULL)
  		return (isset($_POST[$name][$x_value]) ? "1" : "0");
  	else
  		return (isset($_POST[$name]) ? "1" : "0");
  }

  function varStore($varname, $vardefault)
  {
    if (!isset($_SESSION[$varname]))
    {
      //DEBUG:
      //echo "INFO: <b>" . $varname . "</b> STORED IN SESSION WITH " . $vardefault . "<br>";
      $_SESSION[$varname] = $vardefault;
    }

    if (isset($_POST[$varname]))
    {
      //DEBUG:
      //echo "INFO: <b>" . $varname . "</b> STORED IN SESSION FROM POST WITH " . $_POST[$varname] . "<br>";
      $_SESSION[$varname] = $_POST[$varname];
    }
    else
    {
      //DEBUG:
      //echo "INFO: <b>" . $varname . "</b> STORED IN POST FROM SESSION WITH " . $_SESSION[$varname] . "<br>";
      $_POST[$varname] = $_SESSION[$varname];
    }
  }

  function set_message($message, $type)
  {
    $_SESSION[$type] = $message;
  }

  function show_message()
  {
    if (isset($_SESSION["message"]))
    {
      print "<FIELDSET class ='message'>" . $_SESSION["message"] . "</FIELDSET><P>" . LF;
      unSet($_SESSION["message"]);
    }
    else if (isset($_SESSION["warning"]))
    {
      print "<FIELDSET class ='warning'>" . $_SESSION["warning"] . "</FIELDSET><P>" . LF;
      unSet($_SESSION["warning"]);
    }
    else if (isset($_SESSION["error"]))
    {
//      ini_set("SMTP", MAIL_SMTP);
//
//      $to = "DHConsultancy@skynet.be";
//      $subject = "Europlanet catalogue error";
//      $headers = "From: DHConsultancy@skynet.be\n";
//      $headers .= "Reply-To: DHConsultancy@skynet.be";
//      $from = "-fDHConsultancy@skynet.be";
//      $message = "User " . $_SESSION["user_id"] . " (" .
//                 $_SESSION["user_name"] . ") on page " . $_POST["page"] .
//                 ": " . $_SESSION["error"];
      //mail($to, $subject, $message, $headers, $from);

      print "<FIELDSET class ='error'>" . $_SESSION["error"] . "</FIELDSET><P>" . LF;
      unSet($_SESSION["error"]);
    }
  }

//  function mail_add($name, $id, $email)
//  {
//    ini_set("SMTP", MAIL_SMTP);
//
//    $subject = "Europlanet NA1 Matrix: new or updated entry";
//    
//    $headers = "From: " . MAIL_FROM . "\n";
//    $headers .= "Reply-To: " . MAIL_REPLY;
//    $from = "-f" . MAIL_FROM;
//
//    $message = "User " . $_SESSION["user_name"] .
//               " added or updated the entry '" .
//               $name . "' (resource id: " . $id . "); contact email is " .
//               $email . "\n";
//
//    mail(MAIL_TO, $subject, $message, $headers, $from);
//  }

?>
