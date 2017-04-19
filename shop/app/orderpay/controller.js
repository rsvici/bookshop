angular.module('orderpayCtrlModule',[])
	.controller('orderpayCtrl',['$scope','dingdanList','$cookieStore','$httpParamSerializer','$http','$state','articleAll','localStorageService','$ionicPopup',function($scope,dingdanList,$cookieStore,$httpParamSerializer,$http,$state,articleAll,localStorageService,$ionicPopup){
			// console.log(1)
		// console.log(dingdanList.obj)
		$scope.bookList=dingdanList.obj;
		// console.log($scope.bookList)
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

	   		$scope.$watch("bookList", function(){
	   			var total = 0;
	   			angular.forEach($scope.bookList, function(item,key){
	   				total += item.number * item.price;	
	   			})
	   			$scope.totalPrice = total;	
	   			// console.log(total)
	   		}, true)
	   		var newCookie = $cookieStore.get('user');
	   		// console.log(newCookie);
	   		$scope.paysuccess=function(){
	   			
	   			var newPay={}
	   			var cart=[];

	   			angular.forEach($scope.bookList, function(value,key){
       				cart.push({
       					id:value.id,
       					num:value.number
       				})
       			})

	   			if(cart.length<1){
	   				$state.go('shopcar')
	   				return
	   			}

	   			newPay={
	   				user_id:newCookie.user_id,
	   				cart:cart
	   			}
	   			// console.log(newPay)

		   		$http({
	   				url:"../shopApi/book/order.php",
	   				method:"POST",
	   				data:newPay,
	   				headers:{"content-type":"application/x-www-form-urlencoded"},
	   			}).then(function(res){
	   				if(res.data.code==0){
	   					$ionicPopup.alert({title:'购买成功'})
	   					localStorageService.num=1
	   					// localStorageService.deleteObj() 
						localStorageService.setObj("articleAll",{});
						
						angular.forEach($scope.bookList,function(val,key){
							delete $scope.bookList[key]
						})

	   					$state.go('person')

	   				}
	  				
	   			},function(error){
	  
	   			})

	  	 	}



	}])

