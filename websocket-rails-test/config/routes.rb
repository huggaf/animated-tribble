WebsocketRailsTest::Application.routes.draw do
  post   'login' => "api/session#create", defaults: {format: :json}
  delete 'logout' => "api/session#destroy", defaults: {format: :json}
  namespace :api, defaults: {format: :json} do

    resources :products, only: [:index]
    resources :users, only: [:create] do
      collection do
        get   :me, action: "show"
      end
    end

    get    "/order" => "orders#show"
    post   "/order_items/:product_id" => "order_items#create"
    patch  "/order_items/:product_id/:amount" => "order_items#update"
    delete "/order_items/:product_id" => "order_items#destroy"

  end

  root 'application#default'

  %w(produtos pedidos admin).each do |uri|
    get uri => "application#default"
  end

end
