<?php
	require "./extends/Model.class.php";
	require "./extends/config.php";

	//根据字段进行搜索实现
	if(isset($_GET['search'])){
		$search = $_GET['search'];
		$bookModel = new Model("b_book");
		// 模糊查询
		$searchCondition = "%$search%";

		// 搜索结果的数据分页默认10条
		$start = empty($_GET['start'])? 0: $_GET['start'];

    	$length = empty($_GET['length'])? 10:$_GET['length'];

		$searchResult = $bookModel
		                ->where("book_title LIKE '$searchCondition'")
		                ->limit($start,$length)
						->select();
		if($searchResult){
			foreach ($searchResult as $key => $value) {
				$tempBook['id'] = $value['book_id'];
				$tempBook['title'] = $value['book_title'];
				$tempBook['author'] = $value['book_author'];
				$tempBook['price'] = (double)$value['book_price'];
				$tempBook['pudate'] = $value['book_pudate'];
				$tempBook['status'] = $value['book_status'];

				$tempBook['cateid'] = $value['cate_id'];

				$cateModel = new Model('b_category');
    			$categoryResult = $cateModel
    						->where("cate_id={$value['cate_id']}")
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
		}else{
			$result['data'] = 'no search result';
			$result['code'] = 1;
		}
	}else{
		$result['data'] = 'no search params';
		$result['code'] = 2;	
	}
	header('Access-Control-Allow-Origin: *');
	echo json_encode($result);

