<?php
/**
 * @file functions.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */


//  function dbiSelect()
//  {
//    mysqli_init();
//    $link = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE) or exit(mysqli_error($link));
//
//    return $link;
//  }

//  function isValidURL($url)
//  {
//	return preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url);
//  }
//
//  function url_exists($url)
//  {
//  	$handle = @fopen($url, "r");
//	if ($handle === false)
//		return false;
//	fclose($handle);
//	return true;
//  }
//  
//  function clean_num($num)
//  {
//  	return rtrim(rtrim($num, '0'), '.');
//  }

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


//  function check_page($page)
//  {
//    $userid = $_SESSION["user_id"];
//    $userlevel = $_SESSION["user_level"];
//
//    $link = dbiSelect();
//
//    $query = "SELECT level FROM pages_list WHERE " .
//             "name='" . $page . "' LIMIT 1";
//    $result = mysqli_query($link, $query);
//
//
//    if ((mysqli_num_rows($result) == FALSE) ||
//        (mysqli_num_rows($result) == 0))
//    {
//      print "Page not found!" . LF;
//      mysqli_close($link);
//      return(FALSE);
//    }
//
//    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
//    $level = $row["level"];
//    mysqli_free_result($result);
//
//    if ($userlevel < $level)
//    {
//      mysqli_close($link);
//      if ($_SESSION["user_id"] == 1)
//      {
//        print "This page is only available for entitled users." . LF;
//        print "<P>If you have an account, please log in first before continuing." . LF;
//      }
//      else
//        print "Access to this page is not allowed for your user level!" . LF;
//    }
//    else
//    {
//      write_stats($link, $page);
//      mysqli_close($link);
////      mail_page($page);
//      include "views/". $page;
//    }
//  }


//function mail_page($page)
//{
//    ini_set("SMTP", MAIL_SMTP);
//
//    $subject = "Europlanet catalogue access";
//    $headers = "From: DHConsultancy@skynet.be\n";
//    $headers .= "Reply-To: DHConsultancy@skynet.be";
//    $from = "-fDHConsultancy@skynet.be";
//
//    if (isset($_SESSION["user_name"]))
//    {
//      $user = $_SESSION["user_name"];
//    }
//    else
//    {
//      $user = "anonymous";
//    }
//    $message = "Page access: " . $page . " by user " . $user;
//
//    mail(MAIL_TO, $subject, $message, $headers, $from);
//}


//  function write_stats($link, $page)
//  {
//    $userid = $_SESSION["user_id"];
//
//    $query = "INSERT INTO users_statistics SELECT NULL, " .
//             $userid . ", id, NOW() FROM pages_list WHERE name='" .
//             $page . "' LIMIT 1";
//
//    mysqli_query($link, $query);
//  }


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
