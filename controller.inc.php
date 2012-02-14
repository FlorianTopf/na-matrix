<?php
/**
 * @file controller.inc.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 * 
 * @todo refactor the whole switch statements! (we have some redudancy here)
 */

include_once ('lib/php/orm/DbConnector.php');
require_once ('lib/php/orm/ModelDAO.php');
//require_once ('models/Observatory.php');
//require_once ('models/Spacemission.php');
require_once ('lib/php/orm/Acl.php');

class Controller
{
	static function printSelector($page, $action = NULL, $resource_type = NULL)
	{
		print "<fieldset class='rfield'><legend>Resource Selection:</legend>" . LF;
    	print "<table class='selector'>" . LF;

    	print "<tr><td><input type='radio' id='add_res_type' name='add_res_type' value='obs'";
   		if ($resource_type == "obs") print " checked='checked'";
    	print " id='sel_obs' onchange=\"document.getElementById('main_form').submit()\"/>" .
          " <label for='sel_obs'><b>Ground-based Facility</b></label></td>" . LF;

   		print "<td><input type='radio' id='add_res_type' name='add_res_type' value='spa'";
    	if ($resource_type == "spa") print " checked='checked'";
    	print " id='sel_spa' onchange=\"document.getElementById('main_form').submit()\"/>" .
          " <label for='sel_spa'><b>Space Mission</b></label></td></tr>" . LF;

    	print "</table>";
    	print "<p class='warning'>You must have JAVASCRIPT enabled to work with the Matrix!</p></fieldset>";

    	if ($resource_type == NULL)
    		print "<h3>Please select a resource type</h3>" . LF;

    	print "<div><input type='hidden' name='page' value='" . $page . "'/>" . LF ;
    	print "<input type='hidden' name='action' value='" . $action . "'/></div>" . LF ;
	}

	static function check($page, $action = NULL , $resource_type = NULL, $resource_id = NULL, $settings = NULL, $filters = array())
	{
		$userid = $_SESSION["user_id"];
    	$userlevel = $_SESSION["user_level"];

    	/** @todo this is also used by views which do not act
    	 * 	over DAOs atm AND also all pages (except login)
    	 */
    	$link = new DbConnector('');

    	$level = Acl::getAclForOption($page);

    	if($level == -1)
    	{
    		print "Page not found!" . LF;
    		return(FALSE);
    	}

    	if ($userlevel < $level)
    	{
      		if ($_SESSION["user_id"] == 1)
      		{
        		print "<p>This page is only available for entitled users.</p>" . LF;
        		print "<p>If you have an account, please log in first before continuing.</p>" . LF;
      		}
      		else
        		print "<p>Access to this page is not allowed for your user level!</p>" . LF;
    	}
    	else
    	{
    	   	self::write_stats($link, $page);

    		/** @todo add optional mail functionality */
	//      mail_page($page);

    		/** @todo this switch statement needs to be approved, since it will be extended in the future */
    		switch ($page) {
    		case "add":
    			// ------------------- Questionnaire Start ----------------------
    			if ($_SESSION["user_level"] == 11)
    			{
    				$_observatory = ModelDAO::getFromName("Observatory");
					/** get resource! */
    				if($action == "edit")
					{
						$_observatory->get_resource($resource_id);
						include "views/ObservatoryCreateUpdate.php";
					}
					
					if($action == "add")
					{
						//self::printSelector($page, $action, $resource_type);
						include "views/ObservatoryCreateUpdate.php";
					}

					if($action == "Add Entry")
				 	{
				 	    //NEW: WITH ACCESS CLASS
          				$status = $_observatory->add_resource();
          				//print "DEBUG: Observatory added to main DB" . LF;
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
           					 $_observatory->add_obs_keys($res_id, $action);

            				print "<h4>Thank You! </br>Your Entry has been submitted and once validated it will be added to the database</h4>" . LF;

            				/** @todo here we add some sexy backlinks */
            				
            				/** @todo mail functionality, resource name, id and username 
            				 * we need to add here also a mail functionality for the user (to be approved) 
            				 * */
            				self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
				 	}
				 	
    				if($action == "Update Entry")
				 	{
				 	    //print "UPDATE OBSERVATORY<BR>";
				 		//NEW: WITH ACCESS CLASS
          				$status = $_observatory->update_resource($resource_id);
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_observatory->add_obs_keys($res_id, $action);
            				print "<h4>Thank You! </br>The Observatory has been updated in the database!</h4>" . LF;
            				
            				/** @todo mail functionality, resource name, id and username
            				 * we need to add here also a mail functionality for the user (to be approved)
            				 * */
            				self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
            				
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
				 	}
				    break;  
    			}
    			// ---------------------Questionnaire Stop --------------------
				switch ($resource_type) {
				case "obs":
					//$_observatory = new ObservatoryDAO();
					$_observatory = ModelDAO::getFromName("Observatory");
					/** get resource! */
					if($action == "edit")
					{
						$_observatory->get_resource($resource_id);
						include "views/ObservatoryCreateUpdate.php";
					}

					if($action == "add")
					{
						self::printSelector($page, $action, $resource_type);
						include "views/ObservatoryCreateUpdate.php";
					}

					if($action == "loadOldObs")
					{
						/** @todo: load OLD Entries via dedicated obs object function */
						$_observatory->get_old_resource($resource_id);
						print "<h4>You are about to add an OLD NA1 resource to the database!</h4>" . LF;
						include "views/ObservatoryCreateUpdate.php";
					}

				 	if($action == "Add Entry")
				 	{
				 	    //NEW: WITH ACCESS CLASS
          				$status = $_observatory->add_resource();
          				//print "DEBUG: Observatory added to main DB" . LF;
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
           					 $_observatory->add_obs_keys($res_id, $action);

           					 //print "DEBUG: Observatory reference tables added to main DB" . LF;

           					 // DELETE entry in OLD NA1 DB
           					 if($settings["is_old_res"])
           					 {
           					 	$_observatory->del_old_resource($resource_id);
           					 	$settings["is_old_res"] = FALSE;
           					 }

            				print "<h4>The new Observatory has been added to the database!</h4>" . LF;

            				 /** @todo mail functionality, resource name, id and username*/
            				//self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
            				
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
				 	}

				 	if($action == "Update Entry")
				 	{
				 	    //print "UPDATE OBSERVATORY<BR>";
				 		//NEW: WITH ACCESS CLASS
          				$status = $_observatory->update_resource($resource_id);
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_observatory->add_obs_keys($res_id, $action);
            				print "<h4>The Observatory has been updated in the database!</h4>" . LF;
            				
            				/** @todo mail functionality, resource name, id and username*/
            				//self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
            				
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
				 	}
				break;
				case "spa":
					//$_spacemission = new SpacemissionDAO();
					$_spacemission = ModelDAO::getFromName("Spacemission");
					/** get resource! */
					if($action == "edit")
					{
						$_spacemission->get_resource($resource_id);
						include "views/SpacemissionCreateUpdate.php";
					}

					if($action == "add")
					{
						self::printSelector($page, $action, $resource_type);
						include "views/SpacemissionCreateUpdate.php";
					}

					if($action == "loadOldSpa")
					{
						/** @todo: load OLD Entries via dedicated spa object function, ADD into new DB, DEL OLD DB entry */
						$_spacemission->get_old_resource($resource_id);
						print "<h4>You are about to add an OLD NA1 resource to the database!</h4>" . LF;
						include "views/SpacemissionCreateUpdate.php";
					}

					if($action == "Add Entry")
					{
						//NEW: WITH ACCESS CLASS
          				$status = $_spacemission->add_resource();
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_spacemission->add_spa_keys($res_id, $action);
            				print "<h4>The new Space Mission has been added to the database!</h4>" . LF;
            				
            				/** @todo mail functionality, resource name, id and username*/
            				//self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
            				
            				/** @todo here we add some sexy backlinks */
            				
            				if($settings["is_old_res"])
           					 {
           					 	$_spacemission->del_old_resource($resource_id);
           					 	$settings["is_old_res"] = FALSE;
           					 }
         				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
					}

					if($action == "Update Entry")
					{
						//print "UPDATE SPACE MISSION<br>";
						//NEW: WITH ACCESS CLASS
          				$status = $_spacemission->update_resource($resource_id);
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_spacemission->add_spa_keys($res_id, $action);
            				print "<h4>The Space Mission has been updated in the database!</h4>" . LF;
            				
            				/** @todo mail functionality, resource name, id and username*/
            				//self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"]);
            				
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
					}
				 break;
			default:
    			self::printSelector($page, $action, $resource_type);
    			break; }
    		break;
    		case "edit":
    			// ------------------- Questionnaire Start ----------------------
    			if ($_SESSION["user_level"] == 11)
    			{
				   $_observatory = ModelDAO::getFromName("Observatory");
				   $filters = array('user_id' => $_SESSION["user_id"]);
				   $resources = $_observatory->get_all_resources($page, $filters);
				   include "views/ObservatoryEditAll.php";
				   break;
    			}
    			// ---------------------Questionnaire Stop --------------------
    			switch($resource_type) {
    				case "obs":
    					if ($action == "viewOld")
    					{
    						self::printSelector($page, $action, $resource_type);
    						include "views/ObservatoryEditAllOld.php";
    						break;
    					}
    					$_observatory = ModelDAO::getFromName("Observatory");
    					$resources = $_observatory->get_all_resources($page);
    					self::printSelector($page, $action, $resource_type);
    					include "views/ObservatoryEditAll.php";
    					break;
    				case "spa":
    					if ($action == "viewOld")
    					{
    						self::printSelector($page, $action, $resource_type);
    						include "views/SpacemissionEditAllOld.php";
    						break;
    					}
    					$_spacemission = ModelDAO::getFromName("Spacemission");
    					$resources = $_spacemission->get_all_resources($page);
    					self::printSelector($page, $action, $resource_type);
    					include "views/SpacemissionEditAll.php";
    					break;
    				case NULL:
    					self::printSelector($page, $action, $resource_type);
    					break; }
    			break;
    		case "browse":
    			switch ($resource_type) {
    				case "obs":
    					$_observatory = ModelDAO::getFromName("Observatory");
    					$resources = $_observatory->get_all_resources($page, $filters);
    					$resources_count = count($resources);
    					self::printSelector($page, $action, $resource_type);
    					include "views/ObservatoryViewAll.php";
    					break;
    				case "spa":
    					$_spacemission = ModelDAO::getFromName("Spacemission");
    					$resources = $_spacemission->get_all_resources($page, $filters);
    					$resources_count = count($resources);
    					self::printSelector($page, $action, $resource_type);
    					include "views/SpacemissionViewAll.php";
    					break;
    				case NULL:
    					self::printSelector($page, $action, $resource_type);
    					break;
    				default:
    					break; }
    			break;
    		case "map":
    			include "views/ObservatoryMapAll.php";
    			break;
    		default:
    			include "pages/" . $page . ".php";
    			break;
    		}
		}
		$link->close();
	}

  	static function write_stats($link, $page)
  	{
    	$userid = $_SESSION["user_id"];

    	$query = "INSERT INTO users_statistics VALUES (NULL, " .
             $userid . ", '" . $page . "', NOW())";

    	$link->query($query);
  	}
  	
  /** @todo improve this function / we need users E-Mail Address here */
  static function mail_add($res_name, $res_id, $user_name, $email)
  {
    ini_set("SMTP", MAIL_SMTP);

    $subject = "Europlanet NA1 Matrix: new or updated entry";
    
    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
    $headers .= "From: " . MAIL_FROM . "\n";
    $headers .= "Reply-To: " . MAIL_REPLY;
    $from = "-f" . MAIL_FROM;

    $message = "User " . $user_name .
               " added or updated the entry '" .
               $res_name . "' (resource id: " . $res_id . "); contact email is " .
               $email . "\n";

    mail(MAIL_TO_ADD, $subject, $message, $headers, $from);
  }


}

?>