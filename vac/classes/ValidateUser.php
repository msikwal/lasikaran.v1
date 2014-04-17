<?php
class Validate
{
	public static function checkForValidRequest(){
		$headers = array();
		foreach ($_SERVER as $key => $value) {
			if (strpos($key, 'HTTP_') === 0) {
					$headers[str_replace(' ', '', ucwords(str_replace('_', ' ', strtolower(substr($key, 5)))))] = $value;
			}
		}
		$auth = isset($headers['Auth']) ? $headers['Auth'] : "";
		if($auth!==$_COOKIE["mytoken"]){
				return false;
		//}else if($headers['Host']!=='localhost'){
		//		return false;
		}
		return true;	
	}	
}
?>