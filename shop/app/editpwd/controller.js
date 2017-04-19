 angular.module('editpwdCtrlModule',['Encrypt'])
	.controller('editpwdCtrl',['$scope','$state','productService','$ionicModal','articleAll','$cookieStore','$http','localStorageService','$stateParams','$ionicPopup','$httpParamSerializer','Md5',function($scope,$state,productService,$ionicModal,articleAll,$cookieStore,$http,localStorageService,$stateParams,$ionicPopup,$httpParamSerializer,Md5){
 		
 		$scope.userdata={};
		$scope.checkPwd = function(){
            return $scope.userdata.pwd === $scope.userdata.repwd;
        }

		var user_id=$stateParams.user_id
		var username=$stateParams.username
		$scope.userdata.username=username

		// console.log(user_id)
		// console.log(username)
		$scope.editpwdFn=function(){
			// console.log($scope.userdata.pwd)
			var password=Md5.hex_md5($scope.userdata.pwd)
			$http({
				url:"../shopApi/book/extends/action.php?a=edit",
				data:$httpParamSerializer({user_id:user_id,user_password:password}),
				method:'post',
   				headers:{"content-type":"application/x-www-form-urlencoded"},

			}).then(function(res){
				// console.log(res.)
				// console.log(res.data)
				if(res.data.code==1){
					$ionicPopup.alert({title:'修改成功'})
		   			$state.go('person')
				}else{
					$ionicPopup.alert({title:'修改失败'})
				}
				
				  	
			},function(error){

			})
		}
		
}])