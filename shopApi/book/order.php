<?php
   header('Access-Control-Allow-Origin: *');
   header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type, Accept');
   //var_dump($_POST);
   //获取applicatin-json的数据类型  然后解析对象 插入到数据库中使用
   //获取JSON的输入流对象
   // 判断Header头是 appliction-json 对象类型 才执行下面的代码
 //    $array = getallheaders();
	// $conteyType = $array['Content-Type'];
	// MIMEtype  类型
	// echo $conteyType;
	// 原生的数据采用application/json的方式过去
// if (strtolower($conteyType) == "application/json;charset=utf-8") {
   // 为什么要获取输入流里面的数据
   // 订单存在一对多的问题
  $json = file_get_contents('php://input');
  $obj = json_decode($json,true);
  if($obj){
	   //var_dump($obj);
	   //将数据插入到数据库中
	   require "./extends/Model.class.php";
	   require "./extends/config.php";
	   // 1 先生成订单id
	   $model = new Model('b_order');
	   $user_id = $obj['user_id'];
	   $orderArray['user_id'] = $user_id;
	   // 首先产生订单号
	   // 然后根据订单号 在向订单详情表中插入 每个具体订单的数据
	   $order_id = $model->add($orderArray);
	   if($order_id>0){
	   	    // 2 在根据订单id 向订单详情表中插入数据
	   	    if(isset($obj['cart'])&& is_array($obj['cart'])){
	   	    	// 调用插入订单的方式插入到数据库中
	   	    	insertOrder($obj,$order_id);
	   	    }else{
 	  			$returnResult['code'] = 2;
	   	  		$returnResult['data'] = "没有提交订单数据";
	   	  		echo json_encode($returnResult);
	   	    }
	   }else {
	   	  $returnResult['code'] = 3;
	   	  $returnResult['data'] = "该用户id不存在";
	   	  echo json_encode($returnResult);
	   }
	} else {
		$returnResult['code'] = 4;
		$returnResult['data'] = "no input data";
		echo json_encode($returnResult);
	}


    function insertOrder($obj, $order_id){
		$cartArray = $obj['cart'];
	   	//var_dump($cartArray); 
	    $detailModel = new Model('b_orderdetail');
   	    $tempResutl = true;
   	    foreach ($cartArray as $key => $value) {
   	    	  $detailArray['order_id'] =  $order_id;
   	    	  $detailArray['book_id'] = $value['id'];
   	    	  $detailArray['book_num'] = $value['num'];
   	    	  $detailResult = $detailModel->add($detailArray);
   	    	  if($detailResult>0){

   	    	  }else {
   	    	  		//echo "插入订单详情失败".'<br>';
   	    	  	 $tempResutl=false;
   	    	  }
   	    }
   	    if($tempResutl){
   	       $returnResult['code'] = 0;
   	       $returnResult['data'] = "订单成功";
   	       echo json_encode($returnResult);
   	    }else{
   	       $returnResult['code'] = 1;
   	       $returnResult['data'] = "订单详情插入失败sql错误";
   	       echo json_encode($returnResult);
   	    }
    }

  





