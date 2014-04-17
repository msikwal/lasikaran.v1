<?php
require("../includes/Db.class.php");
require("../classes/User.php");
require("../classes/ChildDetails.php");
$mode 			= $_REQUEST['mode'];
$inputArr		= $_REQUEST;
switch($mode){
	case "save" :
			$arr = saveUserInfo($inputArr);
			break;
	case "vac" :
			$arr = getVacInfo($inputArr);
			break;		
	default: 
			$arr = AuthUser($mobile,$password);
}
header('Content-type: application/json');
echo json_encode($arr,true);
exit;
function getVacInfo($inputArr){
		try {
			global $db;
			foreach( $inputArr as $key => $key_value ){
				$keyArr[$key] = $key_value;
			}
			//print_r($keyArr);
			$childObj = new ChildDetails($db);
			$row_child   = $childObj->getChildVacDetails($keyArr);
			if(is_array($row_child) && sizeof($row_child)>0){
				$childArr  = getFormatedArr($row_child);
				$arr = array(
					'status' => 1,
					'data' => $childArr
				);
			}else{
				$arr = array('status' => 0);
			}
			return $arr;
		}catch(Exception $e) {
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
}
function getFormatedArr($arr){
	$returnArr = array();
	
	for($i=0;$i<sizeof($arr);$i++){
		$childName = $arr[$i]['child_name'];
		$birthDate = $arr[$i]['birth_date'];
		$vacId 		= $arr[$i]['vac_id'];
		$returnArr[$birthDate][$vacId] = $arr[$i];
	}
	return $returnArr;
}
function saveUserInfo($inputArr){
		try {
			global $db;
			foreach( $inputArr as $key => $key_value ){
				$keyArr[$key] = $key_value;
			}
			$userObj 		= new User($db);
			$r_user 		= $userObj->getUserDetails($keyArr['m_name']);
			if(is_array($r_user) && sizeof($r_user)>0){
				$user_id = $r_user[0]['user_id'];
			}else{
				$i_user 		= $userObj->insertUserDetails($keyArr);
				$user_id 		= $db->lastInsertId();
			}
			$keyArr['parentId'] = $user_id;
			$childObj = new ChildDetails($db);
			$row_child   = $childObj->insertChildDetails($keyArr);
			if($row_child>0){
				$arr = array('status' => $row_child);
			}else{
				$arr = array('status' => 0);
			}
			return $arr;
		}catch(Exception $e) {
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
}		

?>
