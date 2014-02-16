app.factory('OrderResource', ['$resource', function($resource) {
    return $resource('/api/order',
                          {},
                          { 'show':          {method:'GET'},
                            'addProduct':    {method:'POST',   url: '/api/order_items/:product_id',         params: {product_id: "@product_id"}   },
                            'removeProduct': {method:'DELETE', url: '/api/order_items/:product_id',         params: {product_id: "@product_id"}   },
                            'updateProduct': {method:'PATCH',  url: '/api/order_items/:product_id/:amount', params: {product_id: "@product_id", amount: "@amount"}  }
                          }
                          );
}]);

