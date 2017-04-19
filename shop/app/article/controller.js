angular.module('articleCtrlModule',[])
	// .value('articleAll',{})
	.factory("articleAll", function(localStorageService){
         return  localStorageService.getObj("articleAll") ? localStorageService.getObj("articleAll") : {};
    })
	// .service("articleAll", function(localStorageService){
	// 	if(localStorageService.getObj("gg")){
	// 		articleAll=localStorageService.getObj("gg")
	// 	}else{
	// 		articleAll={};
	// 	}
	   	 
	// })
	.value('dingdanList',{})
	.service('dingdanList',function(){
		this.obj={};
	})

	.controller('articleCtrl',['$scope','$http','$stateParams','articleAll','dingdanList','$cookieStore','$state','$httpParamSerializer','$ionicPopup',function($scope,$http,$stateParams,articleAll,dingdanList,$cookieStore,$state,$httpParamSerializer,$ionicPopup){
		var getArticleShow =1;
		$scope.getArticleShow=function(n){
			getArticleShow=n;
		}
		$scope.ArticleShow=function(n){
			return getArticleShow===n;
		}
		var articleId=$stateParams.id
		// var articleId=10;
		// console.log(articleId);
		$scope.number=1;

		$http({
			url:"../shopApi/book/bookId.php",
			params:{id:articleId},
			method:'get'
		}).then(function(res){
			$scope.articleAll=res.data.data;
			console.log($scope.articleAll)	
		},function(error){

		})
		$scope.addShopcar=function(){
			var id=$scope.articleAll.id;
			if (articleAll[id]) {
	   				//购物车中已经存在
	   				if($scope.number>1){
	   					articleAll[id]["number"]+=$scope.number
	   				}else{
	   					articleAll[id]["number"] ++;
	   				}
	   			// console.log(articleAll)
   			} else {
   				//购物车没有改商品
   				articleAll[id] = {
   					id:id,
	   				title: $scope.articleAll.title,
	   				price:$scope.articleAll.price,
	   				images:$scope.articleAll.images,
	   				author:$scope.articleAll.author,
	   				desc:$scope.articleAll.desc,
	   				number:$scope.number
	   			};
   				// console.log(articleAll)
   			}
		}


		//修改购物车数量

		$scope.minusNumber = function(){
		
   			if ($scope.number <= 1) {
   				$scope.number= 1;
   			} else {
   				$scope.number --;
   			}

   		}

	   	$scope.addNumber = function(){
	   		$scope.number ++;
	   	}

	   	var  newCookie = $cookieStore.get('user');
	   	$scope.dingdanList=function(){
	   		if(newCookie==undefined){
				$state.go('login',{})
				return;
	   		}
	   		dingdanList.obj={};
			// console.log($scope.articleAll)	
			// console.log($scope.number)
			// console.log(articleId)
			// console.log(newCookie);
			dingdanList.obj={obj:{
				id:articleId,
				number:$scope.number,
				title: $scope.articleAll.title,
   				price:$scope.articleAll.price,
   				images:$scope.articleAll.images,
   				author:$scope.articleAll.author			
			}}

			// console.log(dingdanList.obj)
			$state.go('orderpay')
	   	}

	   	$scope.userdata={};

	   	$scope.tijiaopinglun=function(){
	   		if(newCookie==undefined){
   				$ionicPopup.alert({title:'去登陆'})
	   			$state.go('login')
	   			return;
	   		}else{
	   		var newContent={
	   			id:$scope.articleAll.id,
	   			user_id:newCookie.user_id,
	   			content:$scope.userdata.content}
	   		// console.log(newContent)
	   		$http({
   				url:"../shopApi/book/comment.php",
   				method:"POST",
   				data:$httpParamSerializer(newContent),
   				headers:{"content-type":"application/x-www-form-urlencoded"},
   			}).then(function(res){
   				// console.log(res.data.code)
   				if(res.data.code==0){
   					$ionicPopup.alert({title:'评论成功'})
   					getArticleShow=1
   				}
   			})
	   	}
	   	}
	   	
	}])
