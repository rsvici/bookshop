angular.module('myApp',['ionic','homeServiceModule','homeCtrlModule','listCtrlModule','shopcarCtrlModule','personCtrlModule','articleCtrlModule','resetCtrlModule',"ngCookies",'showorderCtrlModule','orderpayCtrlModule','contentCtrlModule','editpwdCtrlModule','searchlistCtrlModule'])
	.config(function($ionicConfigProvider,$stateProvider, $urlRouterProvider, $locationProvider) {
		$ionicConfigProvider.platform.android.tabs.style('standard');
		$ionicConfigProvider.platform.android.tabs.position('bottom');
		})

	 .config(function($stateProvider, $urlRouterProvider, $locationProvider){
	   		//去掉！
	   		$locationProvider.hashPrefix("");

	   		//其他跳转首页
	   		$urlRouterProvider.otherwise("/home");

	   		//设置具体的路由
	   		$stateProvider
	   		.state("home", {
	   			url:"/home",
	   			views:{
	   				"":{
	   					templateUrl:"views/home.html",
	   					controller:"homeCtrl"	
	   				}
	   				/*"tabs":{
	   					templateUrl:"views/tabs.html",
	   					
	   				}*/
	   			}
	   		})
	   		.state("list", {
	   			url:"/list",
	   			views:{
	   				"":{
	   					templateUrl:"views/list.html",
	   					controller:"listCtrl"	
	   				}
	   				/*"tabs":{
	   					templateUrl:"views/tabs.html"			
	   				}*/
	   			}
	   		})
	   		.state("shopcar", {
	   			url:"/shopcar",
	   			views:{
	   				"":{
	   					templateUrl:"views/shopcar.html",
	   					controller:"shopcarCtrl"	
	   				},
	   				/*"tabs":{
	   					templateUrl:"views/shopcarTabs.html"
	   				}*/
	   			}
	   		})
	   		.state("article", {
	   			url:"/article?id",
	   			views:{
	   				"":{
	   					templateUrl:"views/article.html",
	   					controller:"articleCtrl"	
	   				}
	   				
	   			}
	   		})
	   		.state("person", {
	   			url:"/person",
	   			templateUrl:"views/person.html",
	   			controller:"personCtrl"
	   		})
	   		.state("reset", {
	   			url:"/reset",
	   			templateUrl:"views/reset.html",
	   			controller:"resetCtrl"
	   		})
	   		.state("login", {
	   			url:"/login",
	   			templateUrl:"views/login.html",
	   			controller:"loginCtrl"
	   		})
	   		.state("showorder", {
	   			url:"/showorder?user_id",
	   			templateUrl:"views/showorder.html",
	   			controller:"showorderCtrl"
	   		})
	   		.state("orderpay", {
	   			url:"/orderpay",
	   			templateUrl:"views/orderpay.html",
	   			controller:"orderpayCtrl"
	   		})
	   		.state("content", {
	   			url:"/content?user_id",
	   			templateUrl:"views/content.html",
	   			controller:"contentCtrl"
	   		})
	   		.state("editpwd", {
	   			url:"/editpwd?user_id&username",
	   			templateUrl:"views/editpwd.html",
	   			controller:"editpwdCtrl"
	   		})
	   		.state("searchlist", {
	   			url:"/searchlist",
	   			templateUrl:"views/searchlist.html",
	   			controller:"searchlistCtrl"
	   		})
	   	})
