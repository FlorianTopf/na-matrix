<?php
/**
 * @file reset.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */

 //Creates random 5 chars password containing [A-Z and 0-9]
 function randPw()
 {
 	$pwd_tmp = "";
 	for ($i=0; $i<6; $i++) {
      $d=rand(1,30)%2;
      $pwd_tmp .= $d ? chr(rand(65,90)) : chr(rand(48,57));
    }
 	return $pwd_tmp;
 }

  function mailReset($email, $uname, $pword)
  {
  	ini_set("SMTP", MAIL_SMTP);

    $subject = "Europlanet NA1 Matrix: Password reset! ";

    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
    $headers .= "From: " . MAIL_FROM . "\r\n";
    $headers .= 'Bcc: ' . MAIL_TO . "\r\n";
    $headers .= "Reply-To: " . MAIL_REPLY;

    $from = "-f" . MAIL_FROM;

    $message = "Dear " . $uname . LF . LF;
    $message .= "Your password has been reset to: ". $pword . LF;
    $message .= "You may now access the server at http://europlanet-na1.oeaw.ac.at/matrix/ ";
    $message .= "with username " . $uname . " and the new password." . LF;
    $message .= "You can change your account details, including your password, any time via ";
    $message .= "'My Account' beneath the 'Log out' button. " . LF . LF . LF;
    $message .= "Sincerely," . LF . LF . LF . "The team" . LF . LF;

    mail($email, $subject, $message, $headers, $from);
  }

//----------------------------------------------------------------------

  print "<h2>Password reset</h2>" . LF;

  print "<div><input type='hidden' name='page' value='reset'/></div>" . LF;

  varStore("res_uname", "");

  show_message();

  //$link = newDbConnector();

  if (isset($_POST["reset"]))
  {
  	if (trim($_POST["res_uname"]) == "")
  	  set_message("Missing user name", "warning");


    // checks if uname exists
    $user_exists = 0;
  	$query = "SELECT username, email FROM users_list";
    $result = $link->query($query);
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
      if (strtoupper(trim($_POST["res_uname"])) == strtoupper($row["username"]))
      {
      	$res_mail =  trim($row["email"]);
        $user_exists = 1;
        break;
      }
    }
    mysqli_free_result($result);

    if ($user_exists == 0)
    {
      set_message("This user name is not existing!", "warning");
    }

    // Throw a warning and reload if needed ELSE change pw & send mail
    if (isset($_SESSION["warning"]) || isset($_SESSION["error"]))
       print "<script type='text/javascript'>document.getElementById('main_form').submit()</script>";
    else
    {
      $res_pwd = randPw();
      $query = "UPDATE users_list SET passwd='". md5(trim($res_pwd)) ."' WHERE username='". trim($_POST["res_uname"]) ."'";
      $link->query($query);
      if ($link->affectedRows() > 0)
      {
        print "<p>Your password has been reset! " .
              "An email containing your new password has been sent to the " .
              "email address accosiated to your account.<p>" . LF;

        print "<p>If you do not receive this mail, please contact " .
              "<a href='mailto:florian.topf@oeaw.ac.at'>florian.topf@oeaw.ac.at</a>.</p>" . LF;

        mailReset($res_mail, $_POST["res_uname"], $res_pwd);
      }
      else
        set_message("Error resetting password!", "error");
        //set_message("Error resetting password!" . LF . "uname:" . $_POST["res_uname"] . LF . "randPW:" . $res_pwd . LF . "user_exists:" . $user_exists , "error");

      show_message();
    }
  }

  // Intro text & input form
  if (!isset($_POST["reset"]))
  {
    if ($_POST["res_uname"] == "")
    {
      print "<p>In order to reset your password, you need to provide your " .
            "Login name at the input field below.</p>" . LF;
      print "<p>An email containing your new password will be send to the " .
            "email address associated to your account.</p>" . LF;
    }

    // Store values in $_SESSION for retrieval on reload
    print "<p><table class='page'>" . LF;

    print "<tr><td><b>Login name:</b></td>" .
          "<td><input name='res_uname' size='16' value='" .
          $_POST["res_uname"] . "'>" .
          "</td></tr>" . LF;

    print "</table></p>" . LF;
    print "<p><input type='submit' name='reset' value='Reset'></p>";
  }

  //$link->close();

?>