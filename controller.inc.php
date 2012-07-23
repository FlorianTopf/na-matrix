<?php
/**
 * @file controller.inc.php
 * @version $Id$
 * @author Florian Topf, Robert Stöckler
 * 
 * @todo refactor the whole switch statements! (we have some redudancy here)
 * @todo refactor all uses of SESSION vars!
 * @todo integrate status messagess from add_obs_keys!!
 * @todo improve handling between different userlevels (seems to be problematic some times!!)
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

    	$level = Acl::getAclForPages($page);

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
    			if ($userlevel == 11)
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

					/** @todo we need to think about other options here */
					if(($action == "Add Entry") || (($action == "Save for Later") && $settings["is_add"]))
				 	{
				 	    //NEW: WITH ACCESS CLASS
				 	    // We have to inform the method if its "Save for Later" or "Add Entry"
          				if($action == "Save for Later")
          				    // TRUE weil save for later
				 			$status = $_observatory->add_resource(TRUE);
				 		else if($action == "Add Entry")
				 			$status = $_observatory->add_resource();
				 			
          				//print "DEBUG: Observatory added to main DB" . LF;
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				// SAVE FOR LATER + ADD / ADD ENTRY
           					$_observatory->add_obs_keys($res_id, $action);

            				// We have to inform the Admins if its "Save for Later" or "Add Entry"
           					if($action == "Save for Later")
            				{
           						print "<h4>Your entry has been saved for later editing.</h4>" . LF;
            					print "<h4>You can edit it in the menu &quot;My entries&quot;</h4>" . LF;
            					
            					self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"], true, true);
            				}
            				
            				if($action == "Add Entry")
            				{
            					print "<h3>Thank You!</h3>";
           						print "<h4>Your entry has been submitted and once validated it will be added to the database.</h4>" . LF;
            					print "<h4>You will receive an E-Mail notification after approval of your provided information.</h4>" . LF;
            					
            					self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"], true);
            				}

            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<h4>" . $status["error"] . "</h4>" . LF;
            				return;
          				}
				 	}
				 	
    				/** @todo we need to think about other options here */
				 	if(($action == "Update Entry") || (($action == "Save for Later") && $settings["is_edit"]))
				 	{
				 	    //print "UPDATE OBSERVATORY";
				 	    //nl();
				 		//NEW: WITH ACCESS CLASS
				 	    // We have to inform the method if its "Save for Later" or "Add Entry"
          				if($action == "Save for Later")
          				    // TRUE weil Save for Later
				 			$status = $_observatory->update_resource($resource_id, TRUE);
				 		else if($action == "Update Entry")
				 			$status = $_observatory->update_resource($resource_id);
				 			
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				// FALSE weil KEIN ADD
            				$_observatory->add_obs_keys($res_id, $action, FALSE);
            				
            				// We have to inform the ADMINS if its "Save for Later" or "Update Entry"
            				if($action == "Save for Later")
            				{
            					print "<h4>Your entry has been saved for later editing.</h4>" . LF;
            					print "<h4>You can edit it in the menu &quot;My entries&quot;</h4>" . LF;
            					
            					self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"], false, true);
            				}
            				if($action == "Update Entry")
            				{
            					print "<h3>Thank You!</h3>";
            					print "<h4>Your entry has been updated in the database and needs to be validated again.</h4>" . LF;
            					print "<h4>You will be notifid by E-Mail once the information is approved.</h4>";
            					
            					self::mail_add($res_name, $res_id, $_SESSION["user_name"], $_SESSION["email"], false);
            				}
            					
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
						$_observatory->get_old_resource($resource_id);
						print "<h4>You are about to add an OLD NA1 resource to the database!</h4>" . LF;
						include "views/ObservatoryCreateUpdate.php";
					}
					
					if($action == "Delete Old Entry")
					{
						//print "Delete Old Entry: " . $resource_id;
						$status = $_observatory->del_old_resource($resource_id);
						
						if($status["errno"] === 0)
           					print "<h4>Observatory deleted from the old database!</h4>" . LF;
           				else
           					print "<h4>" . $status["error"] . "</h4>" . LF;
					}
					
					if($action == "Delete Entry")
					{
						//print "Delete Entry: " . $resource_id;
						$status = $_observatory->del_resource($resource_id);
						
						if($status["errno"] === 0)
           					print "<h4>Observatory deleted from the database!</h4>" . LF;
           				else
           					print "<h4>" . $status["error"] . "</h4>" . LF;
					}
						
				 	/** @todo we need to think about other options here */
					if(($action == "Add Entry") || (($action == "Save for Later") && $settings["is_add"]))
				 	{
				 	    //DEBUG:
				 		//print "ADD ENTRY! ";
				 		
				 		//NEW: WITH ACCESS CLASS
				 	    /** @todo we have to inform the method, that it's ONLY save for later */
          				if($action == "Save for Later")
          				{
				 			//DEBUG:
          					//print "SAVE FOR LATER! ";
          					$status = $_observatory->add_resource(TRUE);
          				}
				 		else if($action == "Add Entry")
				 		{
				 			//DEBUG:
          					//print "ADD ENTRY! ";
				 			$status = $_observatory->add_resource();
				 		}
          				//print "DEBUG: Observatory added to main DB" . LF;
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//$res_name = $status["res_name"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				//DEBUG:
            				//print "ADDING KEYS!";
           					$_observatory->add_obs_keys($res_id, $action);

           					//print "DEBUG: Observatory reference tables added to main DB" . LF;

           					// DELETE entry in OLD NA1 DB
           					if($settings["is_old_res"])
           					{
           					 	$status_1 = $_observatory->del_old_resource($resource_id);
           					 	$settings["is_old_res"] = FALSE;
           					 	if($status_1["errno"] === 0)
           					 		print "<h4>Observatory deleted from the old database!</h4>" . LF;
           					 	else
           					 		print "<h4>" . $status_1["error"] . "</h4>" . LF;
           					 	
           					}

            				print "<h4>The new Observatory has been added to the database!</h4>" . LF;
            				
            				if($action == "Save for Later")
            					print "<h4>Note, that you have only saved it for later, so it is not approved yet!</h4>" . LF;
            					
            				if($action == "Add Entry")
            					print "<h4>Note, that this entry is now viewable via &quot;Browse Matrix&quot;</h4>" . LF;

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

				 	/** @todo we need to think about other options here */
				 	if(($action == "Update Entry") || (($action == "Save for Later") && $settings["is_edit"]))
				 	{
				 	    //DEBUG:
				 		//print "UPDATE ENTRY! ";
				 		//print "UPDATE OBSERVATORY<BR>";
				 		//NEW: WITH ACCESS CLASS
				 		/** @todo we have to inform the method, that it's ONLY save for later */
				 		if($action == "Save for Later")
				 		{
          					//DEBUG
				 			//print "SAVE FOR LATER!";
				 			$status = $_observatory->update_resource($resource_id, TRUE);
				 		}
          				else if($action == "Update Entry")
          				{
          					//DEBUG
				 			//print "UPDATE ENTRY!";
          					$status = $_observatory->update_resource($resource_id);
          				}
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				$res_name = $status["res_name"];
            				$is_my_entry = $status["is_my_entry"];
            				$email_to_id = $status["user_id"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_observatory->add_obs_keys($res_id, $action, FALSE);         				

    						$query = "SELECT email FROM users_list WHERE " .
             				"id = '" . $email_to_id . "' LIMIT 1";
    						
    						$result = $link->query($query);
    						$user = mysqli_fetch_array($result, MYSQLI_ASSOC);
    						if ($link->getNumRows($result) > 0)
      							$email_to = $user["email"];
    						else
      							$email_to = NULL;
            				
            				print "<h4>The Observatory has been updated in the database!</h4>" . LF;
            				
            				if($action == "Save for Later")
            				{
            					/** @todo change this notification */
            					print "<h4>Note, that you have only saved it for later, so it is not approved yet!</h4>";
            					// IN CASE IF "SUBMIT TO USER WAS PRESSED"
            					if(!$is_my_entry && ($email_to != NULL))
            						self::mail_update($res_name, $res_id, $_SESSION["email"], $email_to, FALSE);
            					else 
            						print "<h4>I don't want to send to anonymous and myself emails!</h4>";
            				}
            					
            				if($action == "Update Entry")
            				{
            					/** @todo change this notification */
            					print "<h4>Note, that this entry is now viewable via &quot;Browse Matrix&quot;</h4>";
            					// IN CASE IF "ADD TO DATABASE WAS PRESSED"
            					if(!$is_my_entry && ($email_to != NULL))
            						self::mail_update($res_name, $res_id, $_SESSION["email"], $email_to);
            					else 
            						print "<h4>I don't want to send to anonymous and myself emails!</h4>";
            				}
            				
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
						$_spacemission->get_old_resource($resource_id);
						print "<h4>You are about to add an OLD NA1 resource to the database!</h4>" . LF;
						include "views/SpacemissionCreateUpdate.php";
					}
					
					if($action == "Delete Old Entry")
					{
						//print "Delete Old Entry: " . $resource_id;
						$status = $_spacemission->del_old_resource($resource_id);
						
						if($status["errno"] === 0)
           					print "<h4>Space Mission deleted from the old database!</h4>" . LF;
           				else
           					print "<h4>" . $status["error"] . "</h4>" . LF;
					}
					
					if($action == "Delete Entry")
					{
						//print "Delete Entry: " . $resource_id;
						$status = $_spacemission->del_resource($resource_id);
						
						if($status["errno"] === 0)
           					print "<h4>Space mission deleted from the database!</h4>" . LF;
           				else
           					print "<h4>" . $status["error"] . "</h4>" . LF;
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
    			if ($userlevel == 11)
    			{
				   $_observatory = ModelDAO::getFromName("Observatory");
				   $filters['user_id'] = $_SESSION["user_id"];
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
    					if ($action == "approve")
    					{
    						$filters['approved'] = 0;
    						$resources = $_observatory->get_all_resources($page, $filters);
    						include "views/ObservatoryEditAll.php";
    						break;
    					}
    					$filters['approved'] = 1;
    					$resources = $_observatory->get_all_resources($page, $filters);
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
  	
  /** 
   * @fn mail_add($res_name, $res_id, $user_name, $email, $add=TRUE, $save=FALSE)
   * @brief Mail functionality for add or update in the questionnaire procedure.
   * Admins will get "entry needs approval"
   * 
   * @param string $res_name
   * @param int $res_id
   * @param string $user_name
   * @param string $email
   * @param boolean $add
   */
  static function mail_add($res_name, $res_id, $user_name, $email, $add=TRUE, $save=FALSE)
  {
    ini_set("SMTP", MAIL_SMTP);

    if($add)
    	$subject = "Europlanet NA1 Matrix: New entry";
    else 
    	$subject = "Europlanet NA1 Matrix: Updated entry";
    
    $headers = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
    $headers .= "From: " . MAIL_FROM . "\r\n";
    $headers .= "Reply-To: " . MAIL_REPLY;
    $from = "-f" . MAIL_FROM;

    $message = "The User " . $user_name;
    
    if($add)
    	$message .= " added the entry '";
    else
    	$message .= " updated the entry '";
               
    $message .= $res_name . "' (resource id: " . $res_id . "); The users contact email is " .
                $email . "\n";
                
    if($save)
        $message .= LF. LF ."This entry was saved for later by the user!\n";
    else
    	$message .= LF. LF. "This entry needs to be reviewed and approved!\n";


    mail(MAIL_TO_ADD, $subject, $message, $headers, $from);
  }
  
  /** 
   * @fn mail_update($res_name, $res_id, $user_name, $email, $add=TRUE, $save=FALSE)
   * @brief Mail functionality for add or update in the questionnaire procedure.
   * Users will get "entry needs approval" or "approved
   * 
   * @param string $res_name
   * @param int $res_id
   * @param string $email_from
   * @param string $email_to
   * @param boolean $approved
   */
  static function mail_update($res_name, $res_id, $email_from, $email_to, $approved = TRUE)
  {
    ini_set("SMTP", MAIL_SMTP);

    if($approved)
    	$subject = "Europlanet NA1 Matrix: Your entry has been approved";
    else 
    	$subject = "Europlanet NA1 Matrix: Your entry has been modified";
    
    $headers = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
    $headers .= "From: " . MAIL_FROM . "\r\n";
    $headers .= 'Bcc: ' . MAIL_TO_ADD . "\r\n";
    $headers .= "Reply-To: " . MAIL_REPLY;
    $from = "-f" . MAIL_FROM;

    $message = "The Administrators of the NA1 Matrix ";
    
    if($approved)
    	$message .= " approved the entry '";
    else
    	$message .= " modified the entry '";
               
    $message .= $res_name . "'; The responsible administrator contact email is " .
                $email_from . "\n";
                
    if($approved)
    {
        $message .= LF. LF. "You can now find your entry in the \"Browse Matrix\" option\n!";
        $message .= "Note, that if you modify this entry in \"My Entries\", it will be again marked for approval!\n";
    }
    else
    {
    	$message .= LF. LF. "You need to review the changes made by the administrators in \"My Entries\"!\n";
    	$message .= "Please check the entry carefully, do modifications if needed and click on \"Update Entry\"!\n";
    }

//	print $subject;
//	nl();
//	print $headers;
//	nl();
//	print $from;
//	nl();
//	print $message;
//	nl();
//	
//	print $email_to;
    	
    /** @todo we need to send this to the responsible user */	
    mail($email_to, $subject, $message, $headers, $from);
  }

}

?>