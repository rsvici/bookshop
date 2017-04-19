angular.module('resetCtrlModule',['Encrypt'])
	.controller('resetCtrl',['$scope','$httpParamSerializer','$http','Md5','$cookieStore','$state','$ionicPopup',function($scope,$httpParamSerializer,$http,Md5,$cookieStore,$state,$ionicPopup){
		 $scope.userdata= {};
   		


        //验证密码和确认密码
        $scope.checkPwd = function(){
            return $scope.userdata.pwd === $scope.userdata.repwd;
        }
        // console.log($scope.userdata)
        $scope.submitData = function(){
        	var newUserdata={
        		name:$scope.userdata.name,
        		password:Md5.hex_md5($scope.userdata.pwd),
        		tel:$scope.userdata.tel,
        		sex:$scope.userdata.sex
        	}
   			/*console.log(newUserdata);	
   			console.log($httpParamSerializer(newUserdata));	   */		

   			$http({
   				url:"../shopApi/book/userRegist.php",
   				method:"POST",
   				data:$httpParamSerializer(newUserdata),
   				headers:{"content-type":"application/x-www-form-urlencoded"},
   			}).then(function(res){
   				console.log(res)

				if(res.data.code==0){
   					var newUserdata={
		        		username:$scope.userdata.name,
		        		password:Md5.hex_md5($scope.userdata.pwd),
		        	}

		        	$http({
		   				url:"../shopApi/book/userInfoLogin.php",
		   				method:"POST",
		   				data:$httpParamSerializer(newUserdata),
		   				headers:{"content-type":"application/x-www-form-urlencoded"},
		   			}).then(function(newdata){
		   				// console.log(newdata)
		   				
		   				if(newdata.data.code==0){
						$cookieStore.put('user',{
							user_id:newdata.data.data.user_id,
							name:$scope.userdata.name
							});
							// console.log(newdata.data.data.user_id)
							$ionicPopup.alert({title:'注册成功'})
							$state.go("home",{});
		   				}
		  
		   			},function(error){
		  
		   			})	

			}else if(res.data.code==1){
				$ionicPopup.alert({title:res.data.data})
			}


   			},function(error){
  
   			})
   		}

		
	}])



