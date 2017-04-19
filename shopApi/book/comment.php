<?php 
    header("Access-Control-Allow-Origin:*");
	// 接口文件
	// 客户端请求服务器的接口文件
	// 提交4个参数注册
	if(isset($_POST['user_id']) && 
		isset($_POST['content'])&&
		isset($_POST['id'])){
		// 添加数据库的验证
		require "./extends/Model.class.php";
		require "./extends/config.php";
		$userid =  $_POST['user_id'];
		$userModel = new Model('b_user');

		// 注册时先查询该用户是否存在
		$selectResult = $userModel->where("user_id='$userid'")->select();
		if($selectResult){
			$goodModel = new Model("b_book");
			$goodResult = $goodModel->where("book_id={$_POST['id']}")->select();
			if($goodResult){
				$commentModel = new Model("b_comment");
			    //提交评论
				$newComment['user_id'] = $_POST['user_id'];
				$newComment['book_id'] = $_POST['id'];
				$newComment['comment_content'] = $_POST['content'];
				$addResult = $commentModel->add($newComment);
				if($addResult){
					$result['code'] = 0;
					$result['data'] = "提交成功";
					echo json_encode($result);
				}else {
					$result['code'] = 1;
					$result['data'] = "提交失败";
					echo json_encode($result);
				}
			}else {
				$result['code'] = 2;
				$result['data'] = "评论对应的商品不存在";
				echo json_encode($result);
			}
		}else {
			$result['code'] = 3;
			$result['data'] = "该用户不存在";
			echo json_encode($result);
		}
	}else {
		$result['code'] = 4;
		$result['data'] = "no post pararms";
		echo json_encode($result);
	}
