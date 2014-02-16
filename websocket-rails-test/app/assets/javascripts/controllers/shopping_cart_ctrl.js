var ShoppingCartCtrl = ["$scope", "$rootScope", "OrderResource", function ($scope, $rootScope, OrderResource){
  $scope.order = null;
  OrderResource.show(function(data){$scope.order = data})

  $scope.total = function(){
    if($scope.order && $scope.order.order_items.length > 0){
      f = {map: function(e){return parseFloat(e.total)},
           reduce: function(a,b){ return a + b } }

      list = $scope.order.order_items
      total = list.map(f.map).reduce(f.reduce);
    }
    else
      total = 0.0;

    return parseFloat(total);
  }

  $scope.add = function(order_item){
    if($scope.changing){return}
    $scope.changing = true;
    $rootScope.messages = [];

    OrderResource.updateProduct({product_id: order_item.product_id, amount: order_item.amount+1}, function(data){
      $scope.updateFromList(data);
      $scope.changing = false;
    }, function(response){
      $rootScope.responseErrors(response);
      $scope.changing = false;
    });

  }

  $scope.subtract = function(order_item){
    if($scope.changing){return}
    $scope.changing = true;
    $rootScope.messages = [];

    OrderResource.updateProduct({product_id: order_item.product_id, amount: order_item.amount-1}, function(data){
      $scope.updateFromList(data);
      $scope.changing = false;
    }, function(response){
      $rootScope.responseErrors(response);
      $scope.changing = false;
    });

  }

  $scope.remove = function(order_item){
    if($scope.changing){return}
    $scope.changing = true;
    $rootScope.messages = [];

    OrderResource.removeProduct({product_id: order_item.product_id}, function(data){
      $scope.removeFromList(data.id);
      $scope.changing = false;
    }, function(response){
      $rootScope.responseErrors(response);
      $scope.changing = false;
    });
  }

  $scope.updateFromList = function(data){
    idx = $scope.getIdx(data.id)
    if(idx == -1)
      $scope.order.order_items.push(data);
    else
      $scope.order.order_items[idx] = data;

  }

  $scope.removeFromList = function(id){
    idx = $scope.getIdx(id);
    if(idx > -1)
      $scope.order.order_items.splice(idx,1);

  }

  $scope.getIdx = function(id){
    list = ($scope.order && $scope.order.order_items || [])

    for(idx in list)
      if($scope.order.order_items[idx].id == id)
        return parseInt(idx);

    return -1;
  }

}]


