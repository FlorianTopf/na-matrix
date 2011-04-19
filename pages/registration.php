<?php
/**
 * @file registration.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

  function mail_reg($email, $title, $lname, $uname, $pword)
  {
    ini_set("SMTP", MAIL_SMTP);

    $subject = "Europlanet NA1 Matrix user registration";

    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
    $headers = "From: " . MAIL_FROM . "\n";
    $headers .= 'Cc: ' . MAIL_TO . "\r\n";
    $headers .= "Reply-To: " . MAIL_REPLY;

    $from = "-f" . MAIL_FROM;

    $message = "Dear " . $title . " " . $lname . "," . LF . LF;
    $message .= "you were registered for the NA1 Matrix. ";
    $message .= "You may now access the server at http://europlanet-na1.oeaw.ac.at/matrix/ ";
    $message .= "with username " . $uname . " and the password " . $pword . LF . LF . LF;
    $message .= "Sincerely," . LF . LF . LF . "The team" . LF . LF;

    mail($email, $subject, $message, $headers, $from);
  }


  global $user_titles, $usage_selection;

  print "<INPUT type='hidden' name='page' value='registration'>" . LF;

  print "<CENTER><H2>Account registration</H2></CENTER>" . LF;

  varStore("reg_uname", "");
  varStore("reg_pwd", "");
  varStore("reg_pwd2", "");   //FIXXXME
  varStore("reg_title", "");
  varStore("reg_fname", "");
  varStore("reg_lname", "");
  varStore("reg_email", "");
  varStore("reg_affiliation", "");
  varStore("reg_category", "");

  show_message();

  $link = new DbConnector();

  if (isSet($_POST["registration"]))
  {
    if (trim($_POST["reg_uname"]) == "")
      set_message("Missing user name", "warning");
    if (trim($_POST["reg_pwd"]) == "")
      set_message("Missing password", "warning");
    if (trim($_POST["reg_pwd"]) != trim(($_POST["reg_pwd2"])))
      set_message("Confirmation password mismatch", "warning");
    if (trim($_POST["reg_fname"]) == "")
      set_message("Missing first name", "warning");
    else if (trim($_POST["reg_lname"]) == "")
      set_message("Missing last name", "warning");
    else if (trim($_POST["reg_email"]) == "")
      set_message("Missing email address", "warning");
    else if (trim($_POST["reg_affiliation"]) == "")
      set_message("Missing affiliation", "warning");

// Check if username already in use
    $query = "SELECT username FROM users_list";
    $result = $link->query($query);
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
      if (strtoupper(trim($_POST["reg_uname"])) == strtoupper($row["username"]))
      {
        set_message("This user name is already allocated!", "warning");
        break;
      }
    }
    mysqli_free_result($result);

// Throw a warning and reload if needed
    if (isSet($_SESSION["warning"]) || isSet($_SESSION["error"]))
      print "<SCRIPT>document.main_form.submit()</SCRIPT>";
    else
    {
      $query = "INSERT INTO users_list (`id`,`username`,`passwd`," .
               "`title`,`fname`,`lname`,`email`,`affiliation`," .
               "`category`,`level`) VALUES(NULL,'" .
               addslashes(trim($_POST["reg_uname"])) . "','" .
               md5(trim($_POST["reg_pwd"])) . "','" .
               $_POST["reg_title"] . "','" .
               addslashes(trim($_POST["reg_fname"])) . "','" .
               addslashes(trim($_POST["reg_lname"])) . "','" .
               addslashes(trim($_POST["reg_email"])) . "','" .
               addslashes(trim($_POST["reg_affiliation"])) . "','" .
               $_POST["reg_category"] . "',21)";

      $link->query($query);
      if (mysqli_affected_rows($link) > 0)
      {
        print "Thank you for registering! " .
              "A confirmation email has been sent to the specified address. " .
              "If you do not receive this message, please contact " .
              "<A href='mailto:robert.stoeckler@oeaw.ac.at'>Robert.Stoeckler@OeAW.ac.at</A>.<P>" . LF;

        mail_reg($_POST["reg_email"], $_POST["reg_title"],
                 $_POST["reg_lname"], $_POST["reg_uname"], $_POST["reg_pwd"]);
      }
      else
        set_message("Error creating account!", "error");

      show_message();
    }
  }

  if (!isset($_POST["registration"]))
  {
    if ($_POST["reg_title"] == "")
    {
      print "In order to use the catalogue, you need to register for " .
            "a user account by filling out the form below (all fields " .
            "need to be filled out)." . LF;
      print "The information provided will only be used internally " .
            "and for contacting you. No information will be forwarded " .
            "to third parties without explicit consent from the user." .
            "<P><HR><P>" . LF;
    }

// Store values in $_SESSION for retrieval on reload
    print "<P><TABLE class='main' border='0' cellpadding='4' cellspacing='4'>" . LF;

    print "<TR><TD><B>Title:</B></TD>" .
          "<TD><SELECT name='reg_title'>" . LF;
    foreach ($user_titles as $title)
    {
      print "<OPTION value='" . $title . "'";
      if ($_POST["reg_title"] == $title) print " selected";
      print ">" . $title . "</OPTION>" . LF;
    }
    print "</SELECT></TD></TR>" . LF;

    print "<TR><TD><B>First name:</B></TD>" .
          "<TD><INPUT name='reg_fname' size='30' value='" .
          $_POST["reg_fname"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Last name:</B></TD>" .
          "<TD><INPUT name='reg_lname' size='30' value='" .
          $_POST["reg_lname"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Affiliation:</B></TD>" .
          "<TD><INPUT name='reg_affiliation' size='30' value='" .
          $_POST["reg_affiliation"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>E-mail:</B></TD>" .
          "<TD><INPUT name='reg_email' size='30' value='" .
          $_POST["reg_email"] . "'></TD></TR>" . LF;

    print "<TR><TD><B>Intended use:</B></TD>" .
          "<TD><SELECT name='reg_category'>" . LF;
    foreach ($usage_selection as $use)
    {
      print "<OPTION value='" . $use . "'";
      if ($_POST["reg_category"] == $use) print " selected";
      print ">" . $use . "</OPTION>" . LF;
    }
    print "</SELECT></TD></TR>" . LF;

    print "<TR><TD><B>User name:</B></TD>" .
          "<TD><INPUT name='reg_uname' size='16' value='" .
          $_POST["reg_uname"] . "'" .
          "> (maximum 16 alphanumeric characters)</TD></TR>" . LF;

    print "<TR><TD><B>Password:</B></TD>" .
          "<TD><INPUT type='password' name='reg_pwd' size='16' value='" .
          $_POST["reg_pwd"] . "'" .
          "> (maximum 16 alphanumeric characters)</TD></TR>" . LF;

//---------- Password confirmation ------------------------------

    print "<TR><TD><B>Confirm password:</B></TD>" .
          "<TD><INPUT type='password' name='reg_pwd2' size='16' value='" .
          $_POST["reg_pwd2"] . "'" .
          "> (maximum 16 alphanumeric characters)</TD></TR>" . LF;

//------------------------------------------------------------

    print "</TABLE><P>" . LF;

    print "<INPUT type='submit' name='registration' value='Register'><P>";
  }

  $link->close();

?>