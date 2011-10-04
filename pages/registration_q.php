<?php
/**
 * @file registration_q.php
 * @version $Id:$
 * @author Florian Topf, Robert Stöckler
 * 
 * @todo merge this with the other registration form
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
  
  
  // reCaptcha Library
  require_once ('lib/php/recaptchalib.php');
  
  // Get a key from https://www.google.com/recaptcha/admin/create
  $publickey = "6Lc2qMgSAAAAAGPZ2AOE86N8B7GltDk7RejaIZyU";
  $privatekey = "6Lc2qMgSAAAAAEOCHaEUXVT3sz8cug7z19LDRYdE";
  
  # the response from reCAPTCHA
  $resp = null;
  # the error code from reCAPTCHA, if any
  $error = null;

  global $user_titles, $usage_selection;

  print "<div><input type='hidden' name='page' value='registration_q'/></div>" . LF;

  print "<h2>Account registration</h2>" . LF;

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

  //$link = new DbConnector();
  
  if (isSet($_POST["registration_q"]))
  { 	
     # was there a reCAPTCHA response?
     if (isset($_POST["recaptcha_response_field"])) {
        $resp = recaptcha_check_answer ($privatekey,
                                        $_SERVER["REMOTE_ADDR"],
                                        $_POST["recaptcha_challenge_field"],
                                        $_POST["recaptcha_response_field"]);

        if ($resp->is_valid) {
                echo "You got it!";
        } else {
                # set the error code so that we can display it
                set_message("You entered the captcha wrong!", "warning");
                $error = $resp->error;
        }
     }  	
  	
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
      print "<script type='text/javascript'>document.getElementById('main_form').submit()</script>";
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
               $_POST["reg_category"] . "',11)";

      $link->query($query);
      if ($link->affectedRows() > 0)
      {
        print "<p>Thank you for registering!</p>" .
              "<p>A confirmation email has been sent to the specified address.</p>" .
              "<p>If you do not receive this message, please contact " .
              "<a href='mailto:robert.stoeckler@oeaw.ac.at'>robert.stoeckler@oeaw.ac.at</a>.</p>" . LF;

        mail_reg($_POST["reg_email"], $_POST["reg_title"],
                 $_POST["reg_lname"], $_POST["reg_uname"], $_POST["reg_pwd"]);
      }
      else
        set_message("Error creating account!", "error");

      show_message();
    }
  }

  if (!isset($_POST["registration_q"]))
  {
    if ($_POST["reg_title"] == "")
    {
      print "<p>In order to use the matrix, you need to register for " .
            "a user account by filling out the form below (all fields " .
            "need to be filled out).</p>" . LF;
      print "<p>The information provided will only be used internally " .
            "and for contacting you. No information will be forwarded " .
            "to third parties without explicit consent from the user.</p>" .
            "<p><hr></p>" . LF;
    }

// Store values in $_SESSION for retrieval on reload
    print "<p><table class='page'>" . LF;

    print "<tr><td><b>Title:</B></td>" .
          "<td><select name='reg_title'>" . LF;
    foreach ($user_titles as $title)
    {
      print "<option value='" . $title . "'";
      if ($_POST["reg_title"] == $title) print " selected";
      print ">" . $title . "</option>" . LF;
    }
    print "</select></td></tr>" . LF;

    print "<tr><td><b>First name:</B></td>" .
          "<td><input name='reg_fname' size='30' value='" .
          $_POST["reg_fname"] . "'></td></tr>" . LF;

    print "<tr><td><b>Last name:</B></td>" .
          "<td><input name='reg_lname' size='30' value='" .
          $_POST["reg_lname"] . "'></td></tr>" . LF;

    print "<tr><td><b>Affiliation:</B></td>" .
          "<td><input name='reg_affiliation' size='30' value='" .
          $_POST["reg_affiliation"] . "'></td></tr>" . LF;

    print "<tr><td><b>E-mail:</B></td>" .
          "<td><input name='reg_email' size='30' value='" .
          $_POST["reg_email"] . "'></td></tr>" . LF;

    print "<tr><td><b>Intended use:</B></td>" .
          "<td><select name='reg_category'>" . LF;
    foreach ($usage_selection as $use)
    {
      print "<option value='" . $use . "'";
      if ($_POST["reg_category"] == $use) print " selected";
      print ">" . $use . "</option>" . LF;
    }
    print "</select></td></tr>" . LF;

    print "<tr><td><b>User name:</B></td>" .
          "<td><input name='reg_uname' size='16' value='" .
          $_POST["reg_uname"] . "'" .
          "> (maximum 16 alphanumeric characters)</td></tr>" . LF;

    print "<tr><td><b>Password:</B></td>" .
          "<td><input type='password' name='reg_pwd' size='16' value='" .
          $_POST["reg_pwd"] . "'" .
          "> (maximum 16 alphanumeric characters)</td></tr>" . LF;

//---------- Password confirmation ------------------------------

    print "<tr><td><b>Confirm password:</B></td>" .
          "<td><input type='password' name='reg_pwd2' size='16' value='" .
          $_POST["reg_pwd2"] . "'" .
          "> (maximum 16 alphanumeric characters)</td></tr>" . LF;

//------------------------------------------------------------

    print "</table></p>" . LF;
    
    //display reCaptcha
    echo recaptcha_get_html($publickey, $error);

    print "<p><input type='submit' name='registration_q' value='Register'/></p>";
  }

  //$link->close();

?>