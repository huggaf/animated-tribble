app.factory('UserResource', ['$resource', function($resource) {
    return $resource('/api/users',
                          {},
                          { 'me':    {method:'GET', url: '/api/users/me'},
                            'create':  {method:'POST'} }
                          );
}]);

