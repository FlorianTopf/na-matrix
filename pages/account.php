<?php
/**
 * @file account.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 * 
 * /** @todo muss noch an den allgemeinen style angepasst werden (code+design)
 */

  global $user_titles, $usage_selection;

  print "<h2>Account modification</h2>" . LF;

  print "<div><input type='hidden' name='page' value='account'/></div>" . LF;

  show_message();

  //$link = new DbConnector();

  if (!isset($_POST["update"]))
  {
    $query = "SELECT * FROM users_list WHERE id=" . $_SESSION["user_id"];
    $result = $link->query($query);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    mysqli_free_result($result);

    $_POST["acc_title"] = $row["title"];
    $_POST["acc_fname"] = $row["fname"];
    $_POST["acc_lname"] = $row["lname"];
    $_POST["acc_email"] = $row["email"];
    $_POST["acc_affiliation"] = $row["affiliation"];
    $_POST["acc_category"] = $row["category"];
  }

// Store values in $_SESSION for retrieval on reload
  varStore("acc_title", "");
  varStore("acc_fname", "");
  varStore("acc_lname", "");
  varStore("acc_email", "");
  varStore("acc_affiliation", "");
  varStore("acc_category", "");

  if (isset($_POST["update"]))
  {
    if (trim($_POST["acc_fname"]) == "")
      set_message("Missing first name", "warning");
    else if (trim($_POST["acc_lname"]) == "")
      set_message("Missing last name", "warning");
    else if (trim($_POST["acc_email"]) == "")
      set_message("Missing email address", "warning");
    else if (trim($_POST["acc_affiliation"]) == "")
      set_message("Missing affiliation", "warning");
    else if (trim($_POST["acc_pwd"]) != trim($_POST["acc_pwdv"]))
      set_message("Passwords don't match", "warning");

// Throw a warning and reload if needed
    if (isset($_SESSION["warning"]) || isset($_SESSION["error"]))
    	print "<script type='text/javascript'>document.getElementById('main_form').submit()</script>";
    else
    {
      $query = "UPDATE users_list SET " .
               "title='" . $_POST["acc_title"] . "'," .
               "fname='" . addslashes(trim($_POST["acc_fname"])) . "'," .
               "lname='" . addslashes(trim($_POST["acc_lname"])) . "'," .
               "email='" . addslashes(trim($_POST["acc_email"])) . "'," .
               "affiliation='" . addslashes(trim($_POST["acc_affiliation"])) . "'," .
               "category='" . $_POST["acc_category"] . "'";
// Change password only if new password is not blank
      if (trim($_POST["acc_pwd"]) != "")
        $query .= ",passwd='" . md5(trim($_POST["acc_pwd"])) . "'";

      $query .= " WHERE id=" . $_SESSION["user_id"] . " LIMIT 1";
      $link->query($query);
      if ($link->affectedRows() > 0)
        set_message("Account successfully updated!", "message");
      else
        set_message("Error updating account!", "error");

      show_message();
    }
  }
  
   //$link->close();

  if (!isset($_POST["update"]))
  {

    print "<p><table class='page'>" . LF;

    print "<tr><td><B>Title:</B></td>" .
          "<td><select name='acc_title'>" . LF;
    foreach ($user_titles as $title)
    {
      print "<option value='" . $title . "'";
      if ($_POST["acc_title"] == $title) print " selected";
      print ">" . $title . "</option>" . LF;
    }
    print "</select></td></tr>" . LF;

    print "<tr><td><b>First name:</b></td>" .
          "<td><input name='acc_fname' size='30'" .
          " value='" . htmlentities($_POST["acc_fname"]) . "'></td></tr>" . LF;

    print "<tr><td><b>Last name:</b></td>" .
          "<td><input name='acc_lname' size='30'" .
          " value='" . htmlentities($_POST["acc_lname"]) . "'></td></tr>" . LF;

    print "<tr><td><b>Affiliation:</b></td>" .
          "<td><input name='acc_affiliation' size='30'" .
          " value='" . htmlentities($_POST["acc_affiliation"]) . "'></td></tr>" . LF;

    print "<tr><td><b>E-mail:</b></td>" .
          "<td><input name='acc_email' size='30'" .
          " value='" . $_POST["acc_email"] . "'></td></tr>" . LF;

    print "<tr><td><b>Intended use:</b></td>" .
          "<td><select name='acc_category'>" . LF;
    foreach ($usage_selection as $use)
    {
      print "<option value='" . $use . "'";
      if ($_POST["acc_category"] == $use) print " selected";
      print ">" . $use . "</option>" . LF;
    }
    print "</select></td></tr>" . LF;

    print "<tr><td><b>New password:</b></td>" .
          "<td><input type='password' name='acc_pwd' size='16'> " .
          "(maximum 16 alphanumeric characters)</td></tr>" . LF;
    print "<tr><td><b>Confirm password:</b></td>" .
          "<td><input type='password' name='acc_pwdv' size='16'> " .
          "(maximum 16 alphanumeric characters)</td></tr>" . LF;

    print "</table></p>" . LF;

    print "<p><input type='submit' name='update' value='Update'/><p>";
  }

?>