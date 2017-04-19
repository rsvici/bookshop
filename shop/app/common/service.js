angular.module('homeServiceModule',[])
	.constant("queryProductApi", "../shopApi/book/book.php?start=0&length=22")
	.service("productService", function($http,queryProductApi){
		this.requestData = function(success, error){
			$http({
				url:queryProductApi,
			}).then(success, error)
		}
	})
	.service("clearShopCar", function($http,queryProductApi){
		this.clearCar =0;
	})
	