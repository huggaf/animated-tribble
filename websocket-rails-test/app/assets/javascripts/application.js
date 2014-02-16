// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require 'lib/angular.min.js'
//= require 'lib/angular-route.min.js'
//= require 'lib/angular-resource.min.js'
//= require 'lib/angular-sanitize.min.js'
//= require_self
//= require_tree .
// REQUIRE websocket_rails/main

var app = angular.module('app', ['ngSanitize', 'ngResource', 'ngRoute'],
                                  ['$routeProvider', '$locationProvider', '$httpProvider', function($routeProvider,$locationProvider,$httpProvider){

  // cache and history with pre-loaded sources
  $locationProvider.html5Mode(true);

  // angular routes
  $routeProvider.when("/produtos", {templateUrl: "/assets/products/index.html", controller: ProductsCtrl})
      .when("/pedidos", {templateUrl: "/assets/orders/index.html", controller: OrdersCtrl})

      .otherwise({redirectTo : '/produtos' });

  // json header
  $httpProvider.defaults.headers.common['Content-Type'] = 'application/json';
}]);

app.run(['$rootScope', '$location', 'UserResource', 'SessionResource', function($rootScope, $location, UserResource, SessionResource){
  $rootScope.colors = ["#d9534f", "#f0ad4e", "#5cb85c", "#428bca", "#5bc0de" ];

  $rootScope.showLogin = false;

  $rootScope.messages = [];

  $rootScope.user = null;
  UserResource.me(function(data){ $rootScope.user = data }); //pesquisa o usuário logado

  $rootScope.login = function(){
    $rootScope.showLogin = !$rootScope.showLogin;
  }

  $rootScope.addToOrder = function(product){

  }

  $rootScope.isActive = function (viewLocation) {
    return viewLocation === $location.path();
  };

  $rootScope.logout = function(){
    if(confirm('Deseja sair realmente?'))
      SessionResource.logout(function(){
        $rootScope.user = null;
        $location.path('/');
      })
  }

  $rootScope.responseErrors = function(response){
    if(response.data.errors)
      response.data.errors.forEach(function(el, idx){
        $rootScope.messages.push({type: 'danger', text: el});
      })
    else
      $rootScope.messages.push({type: 'danger', text: response.data});

  }


}])
