app.factory('ProductResource', ['$resource', function($resource) {
    return $resource('/api/products',
                          {},
                          { 'list':    {method:'GET', isArray: true} }
                          );
}]);

