<?php
	require "./extends/Model.class.php";
	require "./extends/config.php";

	header('Access-Control-Allow-Origin: *');
	//sleep(1);

    $start = empty($_GET['start'])? 0: $_GET['start'];

    $length = empty($_GET['length'])? 10:$_GET['length'];

    $bookModel = new Model("b_book");


    if(isset($_GET['cateid'])){
    	$cateModel = new Model('b_category');
    	$categoryResult = $cateModel->where("cate_id={$_GET['cateid']}")
    	                ->select();
    	if($categoryResult){
    		    	// 根据分类的信息搜索数据
    		$selectResult = $bookModel->where("cate_id={$_GET['cateid']}")->limit($start,$length)->order("book_id desc")-> select();
    		selectBook($selectResult);
    	}else {
			$result['code'] = 2;
			$result['data'] = 'cateid no exist';
			echo json_encode($result);
    	}
    }else {
    	// 没有提交分类的信息进行搜索数据
		$selectResult = $bookModel->limit($start,$length)->order("book_id desc")->select();
		//var_dump($result);
		selectBook($selectResult);
    };

    function selectBook($selectResult){
    	//数据分页
		if($selectResult){
			foreach ($selectResult as $key => $value) {
				$tempBook['id'] = $value['book_id'];
				$tempBook['title'] = $value['book_title'];
				$tempBook['author'] = $value['book_author'];
				$tempBook['price'] = (double)$value['book_price'];
				$tempBook['pudate'] = $value['book_pudate'];
				$tempBook['status'] = $value['book_status'];
				$tempBook['cateid'] = $value['cate_id'];

				$cateModel = new Model('b_category');

				$where = "";
				if (!empty($_GET['cateid'])) {	
					$where = "cate_id={$_GET['cateid']}";
				}
    			$categoryResult = $cateModel
    						->where($where)
    			            ->select();
				$tempBook['catename'] = $categoryResult[0]['cate_name'];

				$imageModel = new Model('b_images');
				$bookId = $value['book_id'];
				$imageResult =$imageModel->where("book_id=$bookId")->select();
				if($imageResult){
					$tempBook['images'] = $imageResult;
				}else{
					$tempBook['images'] = [];
				}
				$resultArray[] = $tempBook;
			}
			$result['code'] = 0;
			$result['data'] = $resultArray;
		}else {
			$result['code'] = 1;
			$result['data'] = 'no data';
		}
		echo json_encode($result);
    }

	





	

