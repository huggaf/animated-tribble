// Websocket-rails for angular
var ngWebSocketRails = angular.module('ngWebSocketRails', [])
ngWebSocketRails.provider('$webSocketRails', [function() {
  var path = 'localhost:3000/websocket';

  this.WebSocketRails = function(websocket_source) {
    var __this = this;
    var $scope = null;
    this.callbacks = [];

    this.scope = function(scope){
      $scope = scope;
      $scope.$on('$destroy', function() { __this.destroy(); });
      return this;
    }

    this.on =  function(event, callback){
      c = function(data){
            $scope.$apply(function () {
              callback(data);
            });
          }

      this.callbacks.push({event: event, callback: c});
      websocket_source.bind(event, c);
      return this;
    }

    this.destroy =  function(){
      for(idx in this.callbacks){
        callback = this.callbacks[idx];
        idx = websocket_source.callbacks[callback.event].indexOf(callback.callback);
        websocket_source.callbacks[callback.event].splice(idx,1);
      }
    }

  }

  this.$get = function() {
    this.websocket_source = new WebSocketRails(this.path);
    return new this.WebSocketRails(this.websocket_source);
  };
}]);
