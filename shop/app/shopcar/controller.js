angular.module('shopcarCtrlModule',[])
	.controller('shopcarCtrl',['$scope','$state','productService','$ionicModal','articleAll','$cookieStore','$http','localStorageService','dingdanList','$ionicPopup',function($scope,$state,productService,$ionicModal,articleAll,$cookieStore,$http,localStorageService,dingdanList,$ionicPopup){

   		var  newCookie = $cookieStore.get('user');
   		

   		// console.log(newCookie.user_id)
		if(newCookie==undefined){
   			$state.go("login", {});
   		}

		// 去首页
		$scope.gotoHome = function(){	
	   		$state.go("home",  {});
	   	};
	   	// 数据遍历
	
		// 模态框
	
		// 显示函数
		var ShopCarShow=2;
		$scope.getShopCarShow=function(n){
			return n===ShopCarShow;
		}

		/*if(localStorageService.num==1){
			console.log(1);
			$scope.bookList
			angular.forEach($scope.bookList,function(val,key){
				delete $scope.bookList[key]
			})

			localStorageService.setObj("articleAll",$scope.bookList);
	   		// localStorageService.deleteObj()

			localStorageService.num=0;
		}else{
			console.log(2);
	
			$scope.bookList=articleAll;
		}
		console.log(articleAll)*/
		$scope.bookList	=articleAll;



		
		// console.log(articleAll)
			//购物车信息
       		
       		//定义购物车商品的总价
	   		$scope.totalPrice = 0;

       		//修改购物车数量
	   		$scope.minusNumber = function(item){
	   			if (item.number <= 1) {
	   				item.number = 1;
	   			} else {
	   				item.number --;
	   			}

	   		}

	   		$scope.addNumber = function(item){
	   			item.number ++;
	   		}


	   		//删除购物车一条商品
	   		$scope.deleteShopcar = function(key){
	   			delete $scope.bookList[key]; 
	   		}

	   		//清空购物车
	  	
	  		
	   		var shopCarCookie1 = $cookieStore.get('newShopcarCookie');
	   		//监听总价的变化
	   		var newShopcarObj={};
	   		$scope.$watch("bookList", function(){
	   			var total = 0;
	   			angular.forEach($scope.bookList, function(item,key){
	   				total += item.number * item.price;	
	   			})
	   			$scope.totalPrice = total;	
	   			localStorageService.setObj("articleAll",$scope.bookList)

				// localStorageService.getObj("articleAll") 
		
				// console.log(localStorageService.getObj("gg"))
	   		}, true)


	   	$scope.dingdanList=function(){
	   		if(JSON.stringify($scope.bookList) == "{}"){
	   			$ionicPopup.alert({title:'购物车没有商品'})
	   		}else{
	   			
	   			dingdanList.obj={};			
				dingdanList.obj=$scope.bookList;
				// console.log($scope.bookList)
				$state.go('orderpay')
	   		}
	   		
	   	}

	  

	   			   	
	}])
	.service("localStorageService", function($window){
	   		
	   		//设置 字符串
	   		this.set = function(key, value){
	   			$window.localStorage[key] = value;
	   		}
	   		//读取 字符串
	   		this.get = function(key){
	   			return $window.localStorage[key];
	   		}
	   		//设置 对象
	   		this.setObj = function(key, obj) {
	   			$window.localStorage[key] = angular.toJson(obj)
	   		}
	   		//读取 对象
	   		this.getObj = function(key) {
	   			return angular.fromJson($window.localStorage[key])
	   		} 
	   		// 删除 对象
	   		this.deleteObj = function() {
	   			window.localStorage.clear()
	   		}

	   		this.num=0;
	   })
	