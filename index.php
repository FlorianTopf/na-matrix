<?php session_start();
/**
 * @file index.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 */
?>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<?php
  require_once ('config.inc.php');
  require_once ('lib/php/functions.php');
  require_once ('lib/php/orm/html.php');
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

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
    <title>NA1-Matrix</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
  	<meta http-equiv="cache-control" content="no-cache, must-revalidate"/>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="lib/js/jquery-ui-1.8.10.custom.css"/>   
    <script type="text/javascript" src="lib/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="lib/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="lib/js/jquery-ui-1.8.10.custom.min.js"></script>
    <script type="text/javascript" src="js/functions.js"></script>
  </head>

  <body>
  <div id="outer-wrapper">
    <div id="banner-top"></div>
	<div id="header">
      <div id="header-top">
        <div id="header-top-inside">
          <div id="logo">
            <a href="http://europlanet-jra3.oeaw.ac.at" target="_blank"><img src="images/europlanet_logo.gif" width="561" height="51" alt="EuroPlanet - Research Infrastructure." title="EuroPlanet - Research Infrastructure." /></a>
          </div>
          <div id="partners">
            <a href="http://europa.eu/index_en.htm" target="_blank"><img src="images/ue_logo.gif" width="81" height="47" alt="Project supported by the European Union." title="Project supported by the European Union." /></a>
            <a href="http://cordis.europa.eu/fp7/" target="_blank"><img src="images/7_logo.gif" width="77" height="53" alt="Seventh Framework Programme." title="Seventh Framework Programme." /></a>
          </div>
        </div>
      </div>
      <div id="header-img"></div>
    </div>
	<form action="<?php print $_SERVER["PHP_SELF"]; ?>" id="main_form" enctype="multipart/form-data" method="post">

    <?php
      if (!isSet($_POST["page"]))
      {
        if (isSet($_GET["page"]))
          $_POST["page"] = $_GET["page"];
        else
          print "<div><input name='page' type='hidden'/></div>" . LF;
      }
    ?>

    <div id="top">
		<div id="top-menu-img"><img src="images/top_menu_img.gif" align="middle" width="527" height="19" alt="top menu" title="top menu" /></div>
			<div id="top-menu"><font style="font-family: verdana, arial; font-weight: bold; font-size: 22px;" color="#172983">NA1-MATRIX of ground-based &amp; space-based observatories</font></div>
		<div id="top-menu-bottom-img"><img src="images/bottom_menu_img.gif" align="middle" width="527" height="19" alt="top menu" title="top menu" /></div>
	</div>

    <div id="content-wrapper">
<!--    <center>-->
    <table class="main" border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
      <tr><!--LEFT MENU-->
        <td valign="top"><img src="images/blank.gif" width="0" /></td>
        <td valign="top" id="lmcol" width="208">
          <table class="ltable" cellspacing="0" cellpadding="0" width="100%">
            <div id="left">
		    <div id="left-content">
		    <div id="left-menu-box">
            <div id="left-menu">
              <ul>
                <li class="left-level-1-no"><a href="<?php print $_SERVER["PHP_SELF"]; ?>?page=home">Home</a></li>
                <li class="left-level-1-no"><a href="<?php print $_SERVER["PHP_SELF"]; ?>?page=browse">Browse Matrix</a></li>

          <?php
          	if ($_SESSION["user_id"] <= 1)
            {
              print "<div align='center'><li><font font-weight='bold'; font-size='10px'; color='black';>Username: </font>" .
                    "<input name='userid' size='10'></li></div>" . LF;
              print "<div align='center'><li><font font-weight='bold'; font-size='10px'; color='black';>Password: </font>" .
                    "<input type='password' name='passwd' size='10'></li></div>" . LF;
              print "<div align='right'><li><input type='submit' name='login' value='Log in'></li></div>" . LF;
              print "<div align='center'><li><a href='" . $_SERVER["PHP_SELF"] . "?page=reset'>Forgot password?</a></li></div>" .LF;
			}
            else
            {
              print "<h1 class='menu-header'>&nbsp;Edit Matrix:</h1>" . LF;
              print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=add&action=add'>Add entries</a></li>" . LF;
              print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=edit'>Edit entries</a></li>" .LF;
              print "<div align='center'><li><b>" . $_SESSION["user_name"] . " logged in</b></li></div>" . LF;
              print "<div align='center'><li><a href='" . $_SERVER["PHP_SELF"] . "?page=account'>My account</a></li></div>" . LF;
              print "<div align='center'><li><input type='submit' class='cancel' name='logout' value='Log out'></li></div>" . LF;
              if ($_SESSION["user_level"] >= 31)
              {
                print "<img src='images/blank.gif' height='30'>";
                print "<div align='center'><li><A href='" . $_SERVER["PHP_SELF"] . "?page=registration'>Register a new account</a></li></div>" . LF;
              }
            }
          ?>

              </ul>
              <img src="images/blank.gif" height="30"/>
              <div align='center'><span class="dhc"><b>Developed by&nbsp;&nbsp;</b><br /><a href="http://www.iwf.oeaw.ac.at/">IWF Graz Team</a></span></div>
            </div>
            </div>
            </div>
            </div>
          </table>
        </td>
        <td valign="top"><img src="images/blank.gif" width="10"/></td>
        <td align="left" valign="top" width="770" class="rbody"><!-- LOAD MAIN FRAME -->
        
        <?php
        //DEBUG:
//		echo "ACTION: GET: " . $_GET["action"] . "- POST: " . $_POST["action"] . "<br>";
//		echo "POST ADD_RES_TYPE: " . $_POST["add_res_type"] . "- POST RES_TYPE: " . $_POST["res_type"] . "<br>";
//		echo "RES_ID: GET: " . $_GET["id"] . "- POST: " . $_POST["add_res_id"] . "<br>";
//		echo "POST PAGE: " . $_POST["page"] . "<br>";
//		echo "PUSH PAGE: " . $_POST["push"] . "<br>";
  		$action = '';
  		$resource_id = '';
  		$resource_type = '';
          
		/** @todo refactor all $_REQUEST variables */
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
            Controller::check("home");
        ?>
        
        </td>
        <td valign="top"><img src="images/blank.gif" width="10"/></td>
      </tr>
      <tr><td valign="top" colspan="5"><img src="images/blank.gif" width="10" height="10"/></td></tr>
    </table>
<!--    </center>-->
      <div id="footer"><!-- FOOTER-->
        <div id="footer-box">
          <div id="ue">
            <a href="http://europa.eu/index_en.htm" target="_blank"><img src="images/ue_logo_small.gif" width="40" height="23" alt="Project supported by the European Union." title="Project supported by the European Union." /></a>
            <a href="http://europa.eu/index_en.htm">Project supported <br />by the European Union</a>
          </div>
          <div id="footer-text">
            <b>Contact the Team: </b><br/><a href="mailto:florian.topf@oeaw.ac.at">Florian Topf</a> | <a href="mailto:robert.stoeckler@oeaw.ac.at">Robert Stoeckler</a> | <a href="mailto:manuel.scherf@oeaw.ac.at">Manuel Scherf</a>
          </div>
        </div>
      </div>
    </div> <!-- content-wrapper -->
   </form>
  </div> <!-- outer-wrapper -->
  </body>
</html>
