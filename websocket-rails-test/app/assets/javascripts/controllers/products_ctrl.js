var ProductsCtrl = ["$scope", "$rootScope", "ProductResource", "OrderResource", function ($scope, $rootScope, ProductResource, OrderResource){
  $scope.products = []
  ProductResource.list(function(data){
    $scope.products = data;
  }, function(response){
    $rootScope.messages.push({type: 'danger', text: 'Ocorreu um erro na busca de produtos'});
  })

  $scope.addProduct = function(product){
    if($scope.adding){return}

    $scope.adding = true;
    $rootScope.messages = []

    OrderResource.addProduct({product_id: product.id}, function(){
      $scope.adding = false;
    }, function(response){
      if(response.data.errors)
        response.data.errors.forEach(function(error, idx){ $rootScope.messages.push({type: 'danger', text: error}); })

      $scope.adding = false;
    })
  }

}]
