app.factory('SessionResource', ['$resource', function($resource) {
    return $resource('/api/session',
                          {},
                          { 'login':   {method:'POST'  , url: '/login'},
                            'logout':  {method:'DELETE', url: '/logout'} });
}]);

