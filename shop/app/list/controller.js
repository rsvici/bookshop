angular.module('listCtrlModule',[])
	.controller('listCtrl',['$scope','$state','productService','articleAll','$http','$cookieStore','localStorageService',function($scope,$state,productService,articleAll,$http,$cookieStore,localStorageService){

		/*productService.requestData(function(res){
            $scope.bookList= res.data.data;
            // console.log($scope.bookList)
        }, function(){

        })*/
    $scope.gotoList = function(){ 
        $state.go("searchlist");
      }
    

		var getName='';
		$scope.getListFilt=function(a){
			// console.log(a)
			if(getName==0){
				return true
			}else if(a.cateid.indexOf(getName)!=-1||a.title.indexOf(getName)!=-1||a.author.indexOf(getName)!=-1){
				return true;
			}else{
				return false;
			}
		}
		$scope.newSearchName='';
		$scope.getListSearch=function(n){
			getName = n;
		}
		$scope.articleId=function(data){
	   		// console.log(data);
	   		$state.go("article", {id:data});
	   	}

      // cookieStore
      var  newCookie = $cookieStore.get('user');

	   	 $scope.$watch(function(){
       		return articleAll;
       	}, function(){
       			var totalNumber = 0;
            if(newCookie==undefined ){
              totalNumber = 0;
            }else{
                angular.forEach(articleAll, function(item){
                totalNumber += item.number;
              })
              $scope.totalNumber = totalNumber;
              // console.log(totalNumber)
            }
       	}, true)




	   	  	// 上拉加载
      var newStart=10;
      var newLength=4;
      $scope.bookList=[];
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
             $scope.bookList.push(res.data.data[i])
          }
          // console.log($scope.newLoadMore)
          newStart+=4
        })



	   		// 停止加载
	   		$scope.$broadcast('scroll.infiniteScrollComplete');

	   	}












	}])