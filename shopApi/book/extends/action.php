<?php
$action = empty($_GET['a']) ? "query" : $_GET['a'];

require "./Model.class.php";
require "./config.php";

switch ($action) {
	case "query": 
		$user_id=$_GET['user_id'];
		$model = new Model("b_comment");
		$data = $model->where("user_id =$user_id")->select();
		echo json_encode($data);
		break;
		
	case "edit":
		$model = new Model("b_user");
		$res = $model->save($_POST);
		$result = array();
		if ($res > 0) {
			$result['code'] = 1;
			$result['message'] = "修改成功";

		} else {
			$result["code"] = 0;
			$result["message"] = "修改失败";
		}
		echo json_encode($result);

		break;

}
