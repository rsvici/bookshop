angular.module('showorderCtrlModule',[])
	.controller('showorderCtrl',['$scope','$state','productService','$ionicModal','articleAll','$cookieStore','$http','localStorageService','$stateParams','$ionicPopup',function($scope,$state,productService,$ionicModal,articleAll,$cookieStore,$http,localStorageService,$stateParams,$ionicPopup){
 
		var user_id=$stateParams.user_id
		// console.log(user_id)
		$scope.showOrder=[];
		function demo(){
			$http({
				url:"../shopApi/book/orderQuery.php",
				params:{user_id:user_id,length:5},
				method:'get'
			}).then(function(res){
				// console.log(res.data)
				// console.log(res.data.data)
				if(res.data.code==0){
					$scope.showOrder=res.data.data;
				}else{
					$ionicPopup.alert({title:'没有订单'})
		   			$state.go('person')
				}
				
				// console.log((res.data.data[0][0].order_addtime).valueOf())	  	
			},function(error){

			})
		}
		demo()

		// 下拉刷新
	   	$scope.refreshData=function(){
	   		var newStart=5;
            $scope.noMorePage=true;
	   		demo()
	   	// 停止刷新
      		

	   		$scope.$broadcast('scroll.refreshComplete');
	   	}

	// 上拉加载
      var newStart=5;
      var newLength=5;
      
      $scope.noMorePage=true
	  $scope.loadMore=function(){
         if(newStart>100){
              $scope.noMorePage=false
              $scope.$broadcast('scroll.infiniteScrollComplete');
              return
          }else{
              $scope.noMorePage=true
          }

	   		
        $http({url:'http://localhost/bookshop/shopApi/book/orderQuery.php',
          method:'get',
          params:{user_id:user_id,start:newStart,length:newLength}
          })
        .then(function(res){
          // console.log(1)
          // console.log(res)

        	if(res.data.code==0){
				for(var i=0 ;i<5;i++){
		            $scope.showOrder.push(res.data.data[i])
		        }
			}else{
				$ionicPopup.alert({title:'没有订单'})
	   			$state.go('person')
			}
         
          // console.log($scope.newLoadMore)
          newStart+=5
        })

	   		// 停止加载
	   		$scope.$broadcast('scroll.infiniteScrollComplete');

	   	}




}])