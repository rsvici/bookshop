angular.module('homeCtrlModule',['Encrypt'])
	.controller('homeCtrl',['$scope','productService','$ionicModal','$state','$http','Md5','$cookieStore','$httpParamSerializer','articleAll','localStorageService',function($scope,productService,$ionicModal,$state,$http,Md5,$cookieStore,$httpParamSerializer,articleAll,localStorageService){

	   	$scope.gotoList = function(){	
	   		$state.go("searchlist")
	   	}
	  
		// 获取数据
		productService.requestData(function(res){
            var getBookList = res.data.data;
            var bookList1=getBookList.slice(0,6)
            var bookList2=getBookList.slice(6,12)
            var bookList3=getBookList.slice(12,18)

           /* console.log(bookList1);
            console.log(bookList2);
            console.log(bookList3);*/
            $scope.bookList= res.data.data.reverse();
            $scope.bookListAll=[
            	{nav:'benzhouremai.jpg',photo:'1.jpg',obj:bookList1},
            	{nav:'mingshehaoshu.jpg',photo:'2.jpg',obj:bookList2},
            	{nav:'xinshushangjia.jpg',photo:'3.jpg',obj:bookList3}
            	]
        }, function(){

        })



	   	// 下拉刷新
	   	$scope.refreshData=function(){
        var newStart=5;
        $scope.noMorePage=true;
	   		
	   	// 停止刷新
	   		$scope.$broadcast('scroll.refreshComplete');
	   	}


	   	// 上拉加载
      var newStart=0;
      var newLength=4;
      $scope.newLoadMore=[];
      $scope.noMorePage=true
	   	$scope.loadMore=function(){
         if(newStart>20){
              $scope.noMorePage=false
              $scope.$broadcast('scroll.infiniteScrollComplete');
              return
          }else{
              $scope.noMorePage=true
          }

	   		
        $http({url:'../shopApi/book/book.php',
          method:'get',
          params:{start:newStart,length:newLength}
          })
        .then(function(res){
          // console.log(res)
          for(var i=0 ;i<res.data.data.length;i++){
             $scope.newLoadMore.push(res.data.data[i])
          }
          // console.log($scope.newLoadMore)
          newStart+=4
        })



	   		// 停止加载
	   		$scope.$broadcast('scroll.infiniteScrollComplete');

	   	}



      var  newCookie = $cookieStore.get('user');

	   	$scope.articleId=function(data){
	   		// console.log(data);
	   		$state.go("article", {id:data});
	   	}

	   	$scope.$watch(function(){
       		return articleAll;
       	}, function(){
       			var totalNumber = 0;
            if(newCookie==undefined){
              totalNumber = 0;
              
            }else{
                angular.forEach(articleAll, function(item){
                totalNumber += item.number;
              })
              $scope.totalNumber = totalNumber;
              // console.log(totalNumber)
            }
       			
       	}, true)

      // console.log(newCookie)
    if(newCookie==undefined){
        $scope.panduanlogin=true
      }else{
        $scope.panduanlogin=false
      }





	}])

	.controller('loginCtrl',['$scope','productService','$ionicModal','$state','$http','Md5','$cookieStore','$httpParamSerializer','$ionicPopup',function($scope,productService,$ionicModal,$state,$http,Md5,$cookieStore,$httpParamSerializer,$ionicPopup){


		$scope.userdata={};
		$scope.submitData = function(){
			// console.log($scope.userdata)
        	var newUserdata={
        		username:$scope.userdata.name,
        		password:Md5.hex_md5($scope.userdata.pwd),
        	}
   			/*console.log(newUserdata);	
   			console.log($httpParamSerializer(newUserdata));	 */  		

   			$http({
   				url:"../shopApi/book/userInfoLogin.php",
   				method:"POST",
   				data:$httpParamSerializer(newUserdata),
   				headers:{"content-type":"application/x-www-form-urlencoded"},
   			}).then(function(res){
   				if(res.data.code==0){
  					$cookieStore.put('user',{
  						user_id:res.data.data.user_id,
              name:$scope.userdata.name
             
  					});
  					// console.log(res.data.data.user_id)
  					$ionicPopup.alert({title:'登录成功'})
  					$state.go("person",{});
            return;
   				}else{
            $ionicPopup.alert({title:'登录失败,重新登录'})
          }
  
   			},function(error){
  
   			})
   		}






}])