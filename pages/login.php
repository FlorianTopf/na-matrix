<?php
/**
 * @file login.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  function authenticate($userid, $passwd)
  {
  	$link = new DbConnector('');

    $query = "SELECT id, username, passwd, email, level FROM users_list WHERE " .
             "username = '" . $userid .
             "' AND passwd = '" . md5($passwd) . "' LIMIT 1";
    $result = $link->query($query);
    if ($link->getNumRows($result) > 0)
    {
      $user = mysqli_fetch_array($result, MYSQLI_ASSOC);
      $id = $user["id"];
      $_SESSION["user_name"] = $user["username"];
      $_SESSION["user_level"] = intval($user["level"]);
      $_SESSION["email"] = $user["email"];
    }
    else
    {
      $id = 0;
    }

    $link->close();

    return $id;
  }

?>

<div><input type='hidden' name='page' value='login'/></div>

<h2>User login</h2>

<p><hr></p>


<?php

  if (!isset($_POST["userid"]))
  {
    print "User " . $_SESSION["user_name"] . " succesfully logged in!" . LF;
  }
  else
  {
    if ($_POST["userid"] == "")
    {
      print "<p>Please enter a valid user name and try again.</p>" . LF;
    }
    else
    {
      $id = authenticate($_POST["userid"], $_POST["passwd"]);
      if ($id > 0)
      {
        $_SESSION["user_id"] = $id;
        $_SESSION["page"] = "login";
        print "<script type='text/javascript'>window.open('index.php','_self')</script>";
      }
      else
      {
        print "<p>Login error. Please try again.</p>" . LF;
      }
    }
  }

?>