<?php
/**
 * @file account.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  global $user_titles, $usage_selection;

  print "<CENTER><H2>Account modification</H2></CENTER>" . LF;

  print "<INPUT type='hidden' name='page' value='account'>" . LF;

  show_message();

  $link = new DbConnector();

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

  if (isSet($_POST["update"]))
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
    if (isSet($_SESSION["warning"]) || isSet($_SESSION["error"]))
      print "<SCRIPT>document.main_form.submit()</SCRIPT>";
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
      if (mysqli_affected_rows($link) > 0)
        set_message("Account successfully updated!", "message");
      else
        set_message("Error updating account!", "error");

      show_message();
    }
  }

  $link->close();

  if (!isset($_POST["update"]))
  {

    print "<P><TABLE class='main' border='0' cellpadding='4' cellspacing='4'>" . LF;

    print "<TR><TD><B>Title:</B></TD>" .
          "<TD><SELECT name='acc_title'>" . LF;
    foreach ($user_titles as $title)
    {
      print "<OPTION value='" . $title . "'";
      if ($_POST["acc_title"] == $title) print " selected";
      print ">" . $title . "</OPTION>" . LF;
    }
    print "</SELECT></TD></TR>" . LF;

    print "<TR><TD><B>First name:</B></TD>" .
          "<TD><INPUT name='acc_fname' size='30'" .
          " value='" . $_POST["acc_fname"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Last name:</B></TD>" .
          "<TD><INPUT name='acc_lname' size='30'" .
          " value='" . $_POST["acc_lname"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Affiliation:</B></TD>" .
          "<TD><INPUT name='acc_affiliation' size='30'" .
          " value='" . $_POST["acc_affiliation"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>E-mail:</B></TD>" .
          "<TD><INPUT name='acc_email' size='30'" .
          " value='" . $_POST["acc_email"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Intended use:</B></TD>" .
          "<TD><SELECT name='acc_category'>" . LF;
    foreach ($usage_selection as $use)
    {
      print "<OPTION value='" . $use . "'";
      if ($_POST["acc_category"] == $use) print " selected";
      print ">" . $use . "</OPTION>" . LF;
    }
    print "</SELECT></TD></TR>" . LF;

    print "<TR><TD><B>New password:</B></TD>" .
          "<TD><INPUT type='password' name='acc_pwd' size='16'> " .
          "(maximum 16 alphanumeric characters)</TD></TR>" . LF;
    print "<TR><TD><B>Confirm password:</B></TD>" .
          "<TD><INPUT type='password' name='acc_pwdv' size='16'> " .
          "(maximum 16 alphanumeric characters)</TD></TR>" . LF;

    print "</TABLE><P>" . LF;

    print "<INPUT type='submit' name='update' value='Update'><P>";
  }

?>