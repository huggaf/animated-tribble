var LoginCtrl = ["$scope", "$rootScope", "UserResource", "SessionResource", function ($scope, $rootScope, UserResource, SessionResource){
  // config de textos para o botão do formulário
  $scope.btnTexts = {signin: "Cadastrar",
                     login: "Entrar"};

  // inicia o formulário para login
  $scope.login = {type: 'login'};

  // envia o formulário dependendo da ação
  $scope.sendForm = function(){
    // pré-condição
    if($scope.logging){return}

    // tranca
    $scope.logging = true

    // limpa lista de feedback
    $rootScope.messages = [];

    // função de sucesso
    success_function = function(data){
      // preenche o usuário
      $rootScope.user = data;
      // esconde o formulário de login
      $rootScope.showLogin = false;
      // reseta o formulário para login
      $scope.login = {type: 'login'};

      $rootScope.messages.push({type: 'success', text: 'Login realizado com sucesso!'})
      // destranca
      $scope.logging = false;
    }

    // função de erro
    error_function = function(response){
      // feedback de erro
      $rootScope.responseErrors(response);

      // destranca
      $scope.logging = false;
    }

    switch($scope.login.type){
      case 'signin':    UserResource.create({user: $scope.login}, success_function, error_function); break;
      case 'login':     SessionResource.login({login: $scope.login}, success_function, error_function); break;
    }
  }
}]
