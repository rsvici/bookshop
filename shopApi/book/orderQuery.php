<?php
   header('Access-Control-Allow-Origin: *');
   // 订单数据采用分页实现
   $start = empty($_GET['start'])? 0: $_GET['start'];
   $length = empty($_GET['length'])? 10:$_GET['length'];

   if(isset($_GET['user_id'])){
   	   require "./extends/config.php";
   	   require "./extends/Model.class.php";
   	   // 先查询该用户ID是否存在 不可以查询不存在的用户
   	   $userModel = new Model("b_user");
   	   $selectResult = $userModel->find($_GET['user_id']);
   	   if($selectResult){
   	   	   $userId = $_GET['user_id'];
   	   		$order = new Model("b_order");
               // 查询的订单数据 采用分页的方式实现

   	   	   $orderIdResult = $order->where("user_id=$userId")->
                limit($start,$length)->order("order_id desc")->select();
                //var_dump($orderIdResult);
   	   	    // 一个人可能有多个订单 每个订单 对应多个商品
   	   	    if($orderIdResult){
   	   	    	// 查订单的详情  详细数据
   	   	    	$orderDetailModel = new Model("b_orderdetail");
   	   	    	$bookModel = new Model("b_book");
                  // 声明图片数据模型对象
                  $imageModel = new Model("b_images");
   	   	    	foreach ($orderIdResult as $key => $value) {
   	   	    		$orderId = $value['order_id'];
                     // 思考时间怎么显示出来???
   	   	    		$orderDetailResult = $orderDetailModel->where("order_id=$orderId")->select();
   	   	    		// 清空之前的数据信息
                     //var_dump($orderDetailResult);
                     //var_dump($orderIdResult);
                     $order_addtime = $value["order_addtime"];
   	   	    		unset($tempDetail);
   	   	    		foreach ($orderDetailResult as $key => $value) {
   	   	    			$bookInfo =  $bookModel->find($value['book_id']);
   	   	    			$value['book_title'] = $bookInfo['book_title'];
   	   	    			$value['book_price'] = $bookInfo['book_price'];
                        $value['order_addtime'] =  $order_addtime;
                        //拼接服务器的图片地址路径信息
                        $imageResult = $imageModel->where("book_id={$value['book_id']}")->select();
                        if($imageResult){
                           //$value['book_image'] = "http://www.html5swift.cn/bookShop/images/".$imageResult[0]["image_name"];
                           $value['book_image'] = $imageResult[0]["image_name"];
                        };
   	   	    			$tempDetail[$key] = $value;
   	   	    		}
   	   	    		$orderArray[] = $tempDetail;
   	   	    	}
   	   	    	$result['code'] = 0;
   	   	    	$result['data'] = $orderArray;
   	   	    	echo json_encode($result, JSON_UNESCAPED_SLASHES);
   	   	    }else {
   	   	    	$result['code'] = 3;
   	   			$result['data'] = "用户不存在订单";
   	   			echo json_encode($result);
   	   	    }
   	   }else {
   	   		$result['code'] = 2;
   	   		$result['data'] = "该用户id不存在";
   	   		echo json_encode($result);
   	   }
   }else {
   	   $result['code'] = 1;
   	   $result['data'] = "没有提交用户id";
   	   echo json_encode($result);
   }