<?php session_start();
/**
 * @file index.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<?php
  ini_set("display_errors", "1");
//  set_include_path(
//  '.'.PATH_SEPARATOR.
//  './lib/php/orm'.PATH_SEPARATOR.
//  get_include_path()
//  );
  require_once ('inc/setup.php');
  require_once ('inc/parameters.php');
  require_once ('inc/functions.php');
  require_once ('controller.inc.php');

  if (!isSet($_SESSION["user_id"]))
  {
    $_SESSION["user_id"] = 1;
    $_SESSION["user_name"] = "anonymous";
    $_SESSION["user_level"] = 0;
  }

  if (isSet($_SESSION["page"]))
  {
    $_POST["page"] = $_SESSION["page"];
    unSet($_SESSION["page"]);
  }
  if (isSet($_POST["login"])) $_POST["page"] = "login";
  if (isSet($_POST["logout"])) $_POST["page"] = "logout";
?>

<HTML>
  <HEAD>
    <TITLE>NA1-Matrix</TITLE>
    <META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  	<META http-equiv="cache-control" content="no-cache, must-revalidate">
    <LINK rel="icon" href="images/favicon.ico" type="image/x-icon">
    <LINK rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <LINK rel="stylesheet" type="text/css" href="inc/style.css">
<!--  <LINK rel="stylesheet" type="text/css" href="inc/jquery-ui-1.8.10.custom.css">  -->   
    <SCRIPT src="inc/jquery-1.4.2.min.js"></SCRIPT>
    <SCRIPT src="inc/jquery.validate.min.js"></SCRIPT>
<!--  <SCRIPT src="inc/jquery-ui-1.8.10.custom.min.js"></SCRIPT>  -->    
    <SCRIPT src="inc/functions.js"></SCRIPT>
  </HEAD>

  <BODY>
  <div id="outer-wrapper">
    <div id="banner-top"></div>
	<div id="header">
      <div id="header-top">
        <div id="header-top-inside">
          <div id="logo">
            <a href="http://europlanet-jra3.oeaw.ac.at" target="_blank"><img src="images/europlanet_logo.gif" width="561" height="51" border="0" alt="EuroPlanet - Research Infrastructure." title="EuroPlanet - Research Infrastructure." /></a>
          </div>
          <div id="partners">
            <a href="http://europa.eu/index_en.htm" target="_blank"><img src="images/ue_logo.gif" width="81" height="47" border="0" alt="Project supported by the European Union." title="Project supported by the European Union." /></a>
            <a href="http://cordis.europa.eu/fp7/" target="_blank"><img src="images/7_logo.gif" width="77" height="53" border="0" alt="Seventh Framework Programme." title="Seventh Framework Programme." /></a>
          </div>
        </div>
      </div>
      <div id="header-img"></div>
    </div>
	<FORM action="<?php print $_SERVER["PHP_SELF"]; ?>" name="main_form" id="main_form" enctype="multipart/form-data" method="POST">

    <?php
      if (!isSet($_POST["page"]))
      {
        if (isSet($_GET["page"]))
          $_POST["page"] = $_GET["page"];
        else
          print "<INPUT name='page' type='hidden'>" . LF;
      }
    ?>

    <div id="top">
		<div id="top-menu-img"><img src="images/top_menu_img.gif" align="middle" width="527" height="19" border="0" alt="top menu" title="top menu" /></div>
			<div id="top-menu"><font style="font-family: verdana, arial; font-weight: bold; font-size: 22px" color="#172983">NA1-MATRIX of ground-based &amp; space-based observatories</font></div>
		<div id="top-menu-bottom-img"><img src="images/bottom_menu_img.gif" align="middle" width="527" height="19" border="0" alt="top menu" title="top menu" /></div>
	</div>

    <div id="content-wrapper">
    <CENTER>
    <TABLE class="main" border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
      <TR><!--LEFT MENU-->
        <TD valign="top"><IMG src="images/blank.gif" width="0" border="0"></TD>
        <TD valign="top" id="lmcol" width="208">
          <TABLE class="ltable" cellspacing="0" cellpadding="0" width="100%">
            <div id="left">
		    <div id="left-content">
		    <div id="left-menu-box">
            <div id="left-menu">
              <ul>
                <li class="left-level-1-no"><A href="<?php print $_SERVER["PHP_SELF"]; ?>?page=home">Home</A></li>
                <li class="left-level-1-no"><A href="<?php print $_SERVER["PHP_SELF"]; ?>?page=browse">Browse Matrix</A></li>

          <?php
          	if ($_SESSION["user_id"] <= 1)
            {
              print "<div align='center'><li><FONT font-weight='bold'; font-size='10px'; color='black';>Username: </FONT>" .
                    "<INPUT name='userid' size='10'></li></div>" . LF;
              print "<div align='center'><li><FONT font-weight='bold'; font-size='10px'; color='black';>Password: </FONT>" .
                    "<INPUT type='password' name='passwd' size='10'></li></div>" . LF;
              print "<div align='right'><li><INPUT type='submit' name='login' value='Log in'></li></div>" . LF;
              print "<div align='center'><li><A href='" . $_SERVER["PHP_SELF"] . "?page=reset'>Forgot password?</A></li></div>" .LF;
			}
            else
            {
              print "<h1 class='menu-header'>&nbsp;Edit Matrix:</h1>" . LF;
              print "<li class='left-level-1-no'><A href='" . $_SERVER["PHP_SELF"] . "?page=add&action=add'>Add entries</A></li>" . LF;
              print "<li class='left-level-1-no'><A href='" . $_SERVER["PHP_SELF"] . "?page=edit'>Edit entries</A></li>" .LF;
              print "<div align='center'><li><B>" . $_SESSION["user_name"] . " logged in</B></li></div>" . LF;
              print "<div align='center'><li><A href='" . $_SERVER["PHP_SELF"] . "?page=account'>My account</A></li></div>" . LF;
              print "<div align='center'><li><INPUT type='submit' class='cancel' name='logout' value='Log out'></li></div>" . LF;
              if ($_SESSION["user_level"] >= 31)
              {
                print "<IMG src='images/blank.gif' height='30' border='0'>";
                print "<div align='center'><li><A href='" . $_SERVER["PHP_SELF"] . "?page=registration'>Register a new account</A></li></div>" . LF;
              }
            }
          ?>

              </ul>
              <IMG src="images/blank.gif" height="30" border="0">
              <div align='center'><SPAN class="dhc"><B>Developed by&nbsp;&nbsp;</B><br /><A href="http://www.iwf.oeaw.ac.at/">IWF Graz Team</A></SPAN></div>
            </div>
            </div>
            </div>
            </div>
          </TABLE>
        </TD>
        <TD valign="top"><IMG src="images/blank.gif" width="10" border="0"></TD>
        <TD align="left" valign="top" width="770" class="rbody"><!-- LOAD MAIN FRAME -->
        <?php
        
        //DEBUG:
  		echo "ACTION: GET: " . $_GET["action"] . " POST: " . $_POST["action"] . "<br>";
  		echo "POST ADD_RES_TYPE: " . $_POST["add_res_type"] . " POST RES_TYPE: " . $_POST["res_type"] . "<br>";
  		echo "RES_ID: GET: " . $_GET["id"] . " POST: " . $_POST["add_res_id"] . "<br>";
  		echo "POST PAGE: " . $_POST["page"] . "<br>";
  		echo "PUSH PAGE: " . $_POST["push"] . "<br>";
          
		if(isset($_POST["page"]))
        {
        	if(isset($_GET["action"]))
			{
			    $action = $_GET["action"];
			
			    if ($action == "edit")
			    {
			      // GET RES ID and RES TYPE
			      $resource_id = $_GET["id"];
			      $resource_type = $_GET["res_type"];
			    }
			    
			    if ($action == "add")
    			{
      				// RESET RES ID and RES TYPE
      				$resource_id = NULL;
    				$resource_type = NULL;
    			}
			}
			
			//if selector was pressed
			if(isset($_POST["add_res_type"]))
			{
				$resource_type = $_POST["add_res_type"];
				$action = $_POST["action"];
			}
				
			//if push in add/edit was pressed
			if(isset($_POST["push"]))
			{
				$action = $_POST["push"];
				$resource_type = $_POST["res_type"];
				$resource_id= $_POST["add_res_id"];
			}
  		  	
  		  	Controller::check($_POST["page"], $action, $resource_type, $resource_id);
  		  	
          }
          else
            Controller::check("home", NULL, NULL, NULL);
        ?>
        </TD>
        <TD valign="top"><IMG src="images/blank.gif" width="10" border="0"></TD>
      </TR>
      <TR><TD valign="top" colspan="5"><IMG src="images/blank.gif" width="10" height="10" border="0"></TD></TR>
    </TABLE>
    </CENTER>
      <div id="footer"><!-- FOOTER-->
        <div id="footer-box">
          <div id="ue">
            <a href="http://europa.eu/index_en.htm" target="_blank"><img src="images/ue_logo_small.gif" width="40" height="23" border="0" alt="Project supported by the European Union." title="Project supported by the European Union." /></a>
            <a href="http://europa.eu/index_en.htm">Project supported <br />by the European Union</a>
          </div>
          <div id="footer-text">
            <b>Contact the Team: </b><br/><a href="mailto:florian.topf@oeaw.ac.at">Florian Topf</a> | <a href="mailto:robert.stoeckler@oeaw.ac.at">Robert Stoeckler</a> | <a href="mailto:manuel.scherf@oeaw.ac.at">Manuel Scherf</a>
          </div>
        </div>
      </div>
    </div> <!-- content-wrapper -->
   </FORM>
  </div> <!-- outer-wrapper -->
  </BODY>
</HTML>
