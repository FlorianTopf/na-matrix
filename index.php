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
//  require_once 'lib/php/mvc/HttpRequest.php';
  require_once ('controller.inc.php');
  require_once ('lib/php/orm/DbConnector.php');

  if (!isset($_SESSION["user_id"]))
  {
    $_SESSION["user_id"] = 1;
    $_SESSION["user_name"] = "anonymous";
    $_SESSION["user_level"] = 0;
  }

  if (isset($_SESSION["page"]))
  {
    $_POST["page"] = $_SESSION["page"];
    unSet($_SESSION["page"]);
  }
  if (isset($_POST["login"])) $_POST["page"] = "login";
  if (isset($_POST["logout"])) $_POST["page"] = "logout";
?>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
    <title>NA1-Matrix</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  	<meta http-equiv="cache-control" content="no-cache, must-revalidate"/>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="lib/js/jquery-ui-1.8.10.custom.css"/>
	<link rel="stylesheet" type="text/css" href="lib/js/jquery.tooltip.css"/>
	<!-- Add new AJAX loader from google when available -->
	<script type="text/javascript"
    src="http://maps.googleapis.com/maps/api/js?sensor=true">
	</script>
    <script type="text/javascript" src="lib/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="lib/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="lib/js/jquery.tooltip.js"></script>
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
      if (!isset($_POST["page"]))
      {
        if (isset($_GET["page"]))
          $_POST["page"] = $_GET["page"];
        else
          print "<div><input name='page' type='hidden'/></div>" . LF;
      }
    ?>

    <div id="top">
		<div id="top-menu-img"><img src="images/top_menu_img.gif" width="527" height="19" alt="top menu" title="top menu" /></div>
			<div id="top-menu">NA1-MATRIX of ground-based facilities &amp; space missions</div>
		<div id="top-menu-bottom-img"><img src="images/bottom_menu_img.gif" width="527" height="19" alt="top menu" title="top menu" /></div>
	</div>

    <div id="content-wrapper">
      <div id="left">
	    <div id="left-content">
		  <div id="left-menu-box">
            <div id="left-menu">
              <ul>
                <li class="left-level-1-no"><a href="<?php print $_SERVER["PHP_SELF"]; ?>?page=home">Home</a></li>
                <li class="left-level-1-no"><a href="<?php print $_SERVER["PHP_SELF"]; ?>?page=browse">Browse Matrix</a></li>
                <li class="left-level-1-no"><a href="<?php print $_SERVER["PHP_SELF"]; ?>?page=map">Ground-based Facility Map (Prototype)</a></li>
              </ul>
              <?php
	            if ($_SESSION["user_id"] <= 1)
	            {
	              print "<h1 class='menu-header'>&nbsp;Login:</h1>" . LF;
	              print "<ul><li class='left-level-1-center'>Username:&nbsp;<input name='userid' size='10'/></li>" . LF;
	              print "<li class='left-level-1-center'>Password:&nbsp;<input type='password' name='passwd' size='10'/></li>" . LF;
	              print "<li class='left-level-1-center'><input type='submit' name='login' value='Log in'/></li></ul>" . LF;
	              print "<h1 class='menu-header'></h1>" . LF;
	              print "<ul><li class='left-level-1-center'><a href='" . $_SERVER["PHP_SELF"] . "?page=registration_q'>Register a new<br/> account</a></li>" . LF;
	              print "<li class='left-level-1-center'><a href='" . $_SERVER["PHP_SELF"] . "?page=reset'>Forgot password?</a></li></ul>" . LF;
				}
	            else
	            {
	              print "<h1 class='menu-header'>&nbsp;Edit Matrix:</h1>" . LF;
	              print "<ul><li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=add&action=add'>Add entries</a></li>" . LF;
	              if ($_SESSION["user_level"] >= 21)
	              {
	              	print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=edit'>Edit entries</a></li>" . LF;
	              	print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=edit&action=approve&res_type=obs'>Approve entries</a></li>" . LF;
	              }	
	              if ($_SESSION["user_level"] == 11)
	              	print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=edit'>My entries</a></li>" . LF;
	             
	              /** @todo this is a bit of an hack, because user may get access to this script by directly going there (edit == 21) */
	              if ($_SESSION["user_level"] >= 31)
	              {
	              	if(DbConnector::checkDb('OldObs') && DbConnector::checkDb('OldSpa'))
	              		print "<li class='left-level-1-no'><a href='" . $_SERVER["PHP_SELF"] . "?page=edit&action=viewOld'>Add OLD entries</a></li>" . LF;	
	              }
	              print "<h1 class='menu-header'>&nbsp;Login:</h1>" . LF;
	              print "<ul><li class='left-level-1-center'><b>" . $_SESSION["user_name"] . " logged in</b></li>" . LF;
	              print "<li class='left-level-1-center'><a href='" . $_SERVER["PHP_SELF"] . "?page=account'>My account</a></li>" . LF;
	              print "<li class='left-level-1-center'><input type='submit' class='cancel' name='logout' value='Log out'></li></ul>" . LF;
	
	              if ($_SESSION["user_level"] >= 31)
	              {
	                print "<img src='images/blank.gif' height='30' alt='blank'/>";
	                print "<ul><li class='left-level-1-center'><a href='" . $_SERVER["PHP_SELF"] . "?page=registration'>Register a new<br/> account</a></li></ul>" . LF;
	              }
	            }
              ?>
			  <h1 class="menu-header"></h1>
			  <ul>
			    <li class="left-level-1-no"><a href="http://europlanet-na1.oeaw.ac.at/">RETURN TO NA1 WEBSITE</a></li>
			  </ul>
			  <h1 class="menu-header"></h1>
              <img src="images/blank.gif" height="30" alt="blank"/>
              <ul>
                <li class="left-level-1-center">
                	<b>Developed by</b><br /><a href="http://www.iwf.oeaw.ac.at/">IWF Graz Team</a>
                	<b>and</b>
                	<a href="http://www.phys.ucl.ac.uk/">UCL London Team</a>
                </li>
              </ul>
            </div> <!--  left-menu -->
          </div> <!--  left-menu-box -->
        </div> <!--  left-content -->
      </div> <!-- left -->
	  <div id="middle">
        <div id="middle-content">
		  <div id="middle-marker-box">
		    <div id="middle-marker">
	        <?php
	        //DEBUG:
			//echo "ACTION: GET: " . $_GET["action"] . "- POST: " . $_POST["action"] . "<br>";
			//echo "POST ADD_RES_TYPE: " . $_POST["add_res_type"] . "- POST RES_TYPE: " . $_POST["res_type"] . "<br>";
			//echo "RES_ID: GET: " . $_GET["id"] . "- POST: " . $_POST["add_res_id"] . "<br>";
			//echo "POST PAGE: " . $_POST["page"] . "<br>";
			//echo "PUSH PAGE: " . $_POST["push"] . "<br>";
			//echo "FILTER: " . $_POST["obs_filters"]["country"] . "<br>";
			/** @todo refactor all $_REQUEST variables => move them into controller */
	  		$action = '';
	  		$resource_id = '';
	  		$resource_type = '';
	  		$filters = array();
	  		$settings["is_user_res"] = FALSE;
	  		$settings["is_old_res"] = FALSE;
	  		$settings["is_edit"] = FALSE;
	  		$settings["is_add"] = FALSE;
	  		//$is_user_res = FALSE;
	  		//$is_old_res = FALSE;
	  		
	  		/** @todo a possible improvement of the controlling mechanism new request handler */
	  		//request = new HttpRequest();
	
	  		if(isset($_POST["page"]))
	        {	
	        	if(isset($_GET["action"]))
				{
				    $action = $_GET["action"];
	
				    if ($action == "approve")
				    	$resource_type = $_GET["res_type"];

				    if ($action == "edit")
				    {
				    	// GET RES ID and RES TYPE
				    	$resource_id = $_GET["id"];
				    	$resource_type = $_GET["res_type"];
				    }
	
				    if (/*($action == "loadTemp") || */($action == "loadOldObs") || ($action == "loadOldSpa"))
				    {
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
					//DEBUG:
					//print "Entering push!";
					//nl();
					
					$action = $_POST["push"];
					$resource_type = $_POST["res_type"];
					$resource_id= $_POST["add_res_id"];
					
					/** @todo this is a little hack - but the user likes it */
					if($action == "Submit to User")
						$action = "Save for Later";
					else if($action == "Add to Database")
						$action = "Update Entry";
	
					//if a user submitted resource was loaded an push got pressed to save it to main DB and delete OLD entry
					/*if ($_POST["is_user_res"])
					{
						$settings["is_user_res"] = TRUE;
						$_POST["is_user_res"] = '0';
					}*/
					if(isset($_POST["is_old_res"]))
					{
						//print "Old Entry";
						//nl();
						
						$settings["is_old_res"] = TRUE;
						$_POST["is_old_res"] = FALSE;
					}
					
					// we need that for the save for later option
					if(isset($_POST["is_edit"]))
					{
						
						//print ".. in Edit Mode";
						//nl();
						$settings["is_edit"] = TRUE;
						$_POST["is_edit"] = FALSE;
					}
					
					if(isset($_POST["is_add"]))
					{
						//print ".. in Add Mode";
						//nl();
						$settings["is_add"] = TRUE;
						$_POST["is_add"] = FALSE;
					}
				}
	
				if(isset($_POST["obs_filters"]))
				{
					// we need to reset if we change the res type
					if($resource_type != "spa")
						foreach($_POST["obs_filters"] as $key => $value)
							$filters[$key] = $value;
				}
	
				if(isset($_POST["spa_filters"]))
				{
					// we need to reset if we change the res type
					if($resource_type != "obs")
						foreach($_POST["spa_filters"] as  $key => $value)
							$filters[$key] = $value;
				}
	
				if(isset($_POST["reset_filters"]))
					$filters = array();
	
	
	  		  	Controller::check($_POST["page"], $action, $resource_type, $resource_id, $settings, $filters);
	
	          }
	          else
	            Controller::check("home");
	        ?>
            </div> <!-- middle-marker -->
          </div> <!-- middle-marker-box -->
        </div> <!-- middle-content -->
      </div> <!-- middle -->
      <div id="footer">
        <div id="footer-box">
          <div id="ue">
            <a href="http://europa.eu/index_en.htm" target="_blank"><img src="images/ue_logo_small.gif" width="40" height="23" alt="Project supported by the European Union." title="Project supported by the European Union." /></a>
            <a href="http://europa.eu/index_en.htm">Project supported <br />by the European Union</a>
          </div>
          <div id="footer-text">
            <b>Contact the Team: </b><br/><a href="mailto:florian.topf@oeaw.ac.at">Florian Topf</a> | <a href="mailto:manuel.scherf@oeaw.ac.at">Manuel Scherf</a> | <a href="mailto:jfabbri@star.ucl.ac.uk">Joanna Fabbri</a>
          </div> <!-- footer-text -->
        </div> <!-- footer-box -->
      </div> <!-- footer -->
    </div> <!-- content-wrapper -->
   </form>
  </div> <!-- outer-wrapper -->
  </body>
</html>
