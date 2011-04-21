<?php

include_once ('lib/php/orm/DbConnector.php');
require_once ('lib/php/orm/ModelDAO.php');
//require_once ('models/Observatory.php');
//require_once ('models/Spacemission.php');
require_once ('lib/php/orm/Acl.php');

class Controller
{
	static function printSelector($page, $action = NULL, $resource_type = NULL)
	{
		print "<FIELDSET class='rfield'><LEGEND>Resource Selection:</LEGEND>" . LF;
    	print "<TABLE border='0' cellspacing='4' cellpadding='4' class='rtable' width='100%'>" . LF;

    	print "<TR><TD align='center' width='45%'>" .
          "<INPUT type='radio' name='add_res_type' value='obs'";
   		if ($resource_type == "obs") print " checked";
    	print " id='sel_obs' onchange=\"document.main_form.submit()\">" .
          " <LABEL for='sel_obs'><B>Observatory</B></LABEL></TD>" . LF;

   		print "<TD align='center' width='45%'>" .
          "<INPUT type='radio' name='add_res_type' value='spa'";
    	if ($resource_type == "spa") print " checked";
    	print " id='sel_spa' onchange=\"document.main_form.submit()\">" .
          " <LABEL for='sel_spa'><B>Space Mission</B></LABEL></TD></TR>" . LF;
    	print "</TABLE></FIELDSET>";
    	
    	if ($resource_type == NULL)
    		print "<H3 align='center'>Please select a resource type</H3>" . LF;
    		
    	print "<INPUT type='hidden' name='page' value='" . $page . "'>" . LF ;
    	print "<INPUT type='hidden' name='action' value='" . $action . "'>" . LF ;
	}
	
	static function check($page, $action = NULL, $resource_type = NULL, $resource_id = NULL)
	{
		$userid = $_SESSION["user_id"];
    	$userlevel = $_SESSION["user_level"];

    	/** @todo this is also used by views which do not act 
    	 * 	over DAOs atm AND also all pages (except login) 
    	 */
    	$link = new DbConnector();
    	
    	$level = Acl::getAclForOption($page);
    		
    	if($level == -1)
    	{
    		print "Page not found!" . LF;
    		return(FALSE);
    	} 	

    	if ($userlevel < $level)
    	{
      		//mysqli_close($link);
      		if ($_SESSION["user_id"] == 1)
      		{
        		print "This page is only available for entitled users." . LF;
        		print "<P>If you have an account, please log in first before continuing." . LF;
      		}
      		else
        		print "Access to this page is not allowed for your user level!" . LF;
    	}
    	else
    	{
   			/** @todo implement write stats */
    	   	self::write_stats($link, $page);
    //  	mysqli_close($link);
    		/** @todo add optional mail functionality */
	//      mail_page($page);
	
    		switch ($page) {
    		case "add": 
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
						
				 	if($action == "Add Entry")
				 	{
				 	    //NEW: WITH ACCESS CLASS
          				$status = $_observatory->add_resource();
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
           					 $_observatory->add_obs_keys($res_id, $action);
            				print "<H4>The new Observatory has been added to the database!</H4>" . LF;
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<H4>" . $status["error"] . "</H4>" . LF;
            				return;
          				}
				 	}
					 	
				 	if($action == "Update Entry")
				 	{
				 	    print "UPDATE OBSERVATORY<BR>";
				 		//NEW: WITH ACCESS CLASS
          				$status = $_observatory->update_resource($resource_id);
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_observatory->add_obs_keys($res_id, $action);
            				print "<H4>The Observatory has been updated in the database!</H4>" . LF;
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<H4>" . $status["error"] . "</H4>" . LF;
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
						
					if($action == "Add Entry")
					{
						//NEW: WITH ACCESS CLASS
          				$status = $_spacemission->add_resource();
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_spacemission->add_spa_keys($res_id, $action);
            				print "<H4>The new Space Mission has been added to the database!</H4>" . LF;
            				/** @todo mail functionality*/
            				//mail_add($_POST["add_res_name"], $res_id, $_POST["add_contact_email"]);
            				/** @todo here we add some sexy backlinks */
         				}
          				else
          				{
            				print "<H4>" . $status["error"] . "</H4>" . LF;
            				return;
          				}
					}
						
					if($action == "Update Entry")
					{
						print "UPDATE SPACE MISSION<br>";
						//NEW: WITH ACCESS CLASS
          				$status = $_spacemission->update_resource($resource_id);
          				if ($status["errno"] == 0)
          				{
            				$res_id = $status["res_id"];
            				//INSERT FK-TABLE ENTRY & REFERENCED TABLES ENTRIES
            				$_spacemission->add_spa_keys($res_id, $action);
            				print "<H4>The Space Mission has been updated in the database!</H4>" . LF;
            				/** @todo mail functionality*/
            				//mail_add($_POST["add_res_name"], $res_id, $_POST["add_contact_email"]);
            				/** @todo here we add some sexy backlinks */
          				}
          				else
          				{
            				print "<H4>" . $status["error"] . "</H4>" . LF;
            				return;
          				}
					}
				 break;
			default:
    			self::printSelector($page, $action, $resource_type); 
    			break; }
    		break;
    		case "edit":
    			switch($resource_type) {
    				case "obs":
    					self::printSelector($page, $action, $resource_type);
    					include "views/ObservatoryEditAll.php";
    					break;
    				case "spa":
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
    					self::printSelector($page, $action, $resource_type);
    					include "views/ObservatoryViewAll.php";
    					break;
    				case "spa":
    					self::printSelector($page, $action, $resource_type);
    					include "views/SpacemissionViewAll.php";
    					break;
    				case NULL:
    					self::printSelector($page, $action, $resource_type);
    					break;
    				default: 
    					break; }
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
	
	
}

?>