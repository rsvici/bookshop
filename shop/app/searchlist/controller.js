angular.module('searchlistCtrlModule',[])
 		.controller('searchlistCtrl',function($scope,$http,$state){
        var start=10;
        $scope.bookList={};
        //定义搜索
        $scope.searchValue = "";
        $scope.filterValue = "";

        //点击函数
        $scope.searchFn = function(){
          $scope.filterValue = $scope.searchValue;
        }
       //过滤函数
        $scope.filterFn = function(book){
          if(book!==undefined){
              return  book.title.indexOf($scope.filterValue) >= 0 || book.desc.indexOf($scope.filterValue) >= 0;
          }
           
        }
        
        $scope.tab = 1;
        $scope.reverse = false;

        //点击每一个选项
        $scope.sortBy=function(arg){
           if ($scope.tab === arg && $scope.tab !== 1){
            $scope.reverse = !$scope.reverse;
          }
           $scope.tab = arg;
           switch (arg) {
            case 1 : 
       			
                $scope.proFn = $scope.sortId 
                break;
            case 2 : 
                $scope.proFn = $scope.sortPrice; 
                break;
              }
        }

        $scope.showlist=false;
        //按照价格排序的函数
        $scope.sortPrice=function(item){
          return Number(item.price);
        }

        $scope.getListSearch=function(n){
        	// console.log(n)
        $http({
            method:'get',
            url:"../shopApi/book/bookSearch.php",
            params:{search:n}
        }).then(function(res){
        	// console.log(res)
        
        	if(res.data.code==0){
        		$scope.showlist=true;
        		$scope.bookList=res.data.data;
          		
        	}
          
        },function(){

        })

        }


        $scope.articleId=function(data){
	   		// console.log(data);
	   		$state.go("article", {id:data});
	   	}

         	// 下拉刷新
	   	$scope.refreshData=function(){
	   		
	   	// 停止刷新
	   		$scope.$broadcast('scroll.refreshComplete');
	   	}
 })
 	
