<?php
/**
 * @file Request.php
 * @version $Id$
 * @author Florian Topf
 */


interface Request
{
	public function getParameterNames();
	public function issetParameter($name);
	public function getParameter($name);
	public function getHeader($name);
}

?>