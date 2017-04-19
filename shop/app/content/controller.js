 angular.module('contentCtrlModule',[])
	.controller('contentCtrl',['$scope','$state','productService','$ionicModal','articleAll','$cookieStore','$http','localStorageService','$stateParams','$ionicPopup',function($scope,$state,productService,$ionicModal,articleAll,$cookieStore,$http,localStorageService,$stateParams,$ionicPopup){
 
		var user_id=$stateParams.user_id
		// console.log(user_id)
		$http({
			url:"../shopApi/book/extends/action.php?a=query",
			params:{user_id:user_id},
			method:'get'
		}).then(function(res){
			// console.log(res)
			// console.log(res.data)
			if(!res.data.length==0){
				$scope.showOrder=res.data;
			}else{
				$ionicPopup.alert({title:'没有评论'})
	   			$state.go('person')
			}
			
			// console.log((res.data.data[0][0].order_addtime).valueOf())	  	
		},function(error){

		})
}])