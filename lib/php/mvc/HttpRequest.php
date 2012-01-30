<?php
/**
 * @file HttpRequest.php
 * @version $Id$
 * @author Florian Topf
 */
include_once 'Request.php';

class HttpRequest implements Request
{
	private $parameters;
	
	public function __construct() {
		$this->parameters = $_REQUEST;
	}
	
	public function getParameterNames() {
		return array_keys($this->parameters);
	}
	
	public function issetParameter($name) {
		return isset($this->parameters[$name]);
	}
	
	public function getParameter($name) {
		if (isset($this->parameters[$name])) {
			return $this->parameters[$name];
		}
		return NULL;
		
	}
	
	public function getHeader($name) {
		$name = 'HTTP_' . strtoupper(str_replace('-', '_', $name));
		if(isset($_SERVER[$name])) {
			return $_SERVER[$name];
		}
		return NULL;
	}
}

?>