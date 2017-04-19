angular.module('personCtrlModule',[])
	.controller('personCtrl',['$scope','$state','productService','$ionicModal','articleAll','$cookieStore','$http','localStorageService','$ionicPopup',function($scope,$state,productService,$ionicModal,articleAll,$cookieStore,$http,localStorageService,$ionicPopup){

   		var  newCookie = $cookieStore.get('user');
   		// console.log(newCookie.user_id)
   		// 登录个人中心
		if(newCookie==undefined){
   			var ShopCarShow =1
	   		}else{
	   			var ShopCarShow =2
	   		}
	   		$scope.gotoHome = function(){	
		   		$state.go("home");
		   	};
		   $scope.getShopCarShow=function(n){
		   		return ShopCarShow==n
	    }
		
		// 没有登录时
		productService.requestData(function(res){
            var getBookList = res.data.data;
			$scope.bookList=getBookList;    
        }, function(){

        })
		$scope.articleId=function(data){
	   		// console.log(data);
	   		$state.go("article", {id:data});
	   	}


	   	// 登陆之后
	   	// console.log(newCookie)
	   	$scope.showOrder=function(){
	   		var user_id=newCookie.user_id;
	   		// console.log(user_id)
	   		$state.go('showorder',{user_id:user_id})
	   	}

	   	// 查看评论
	   	$scope.showContent=function(){
	   		var user_id=newCookie.user_id;

	   		// console.log(user_id)
	   		$state.go('content',{user_id:user_id})
	   	}

	   	// 修改密码
	   	$scope.editPassword=function(){
	   		var username=newCookie.name;
	   		var user_id=newCookie.user_id;

	   		// console.log(username)
	   		$state.go('editpwd',{user_id:user_id,username:username})
	   	}

 		
 		// 注销登录
 		$scope.zhuxiaologin=function(){
 			$cookieStore.remove('user');
 			// console.log(1)
 			$ionicPopup.alert({title:'注销成功'})
 			$state.go("home");
 		}
 		if(newCookie){
 			$scope.yonghuming=newCookie.name
 		}

	}])