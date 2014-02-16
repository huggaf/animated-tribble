class Api::OrdersController < ApplicationController

  def show
    order = Order.find_or_create_by_user_id_and_status(current_user.id, 'open')
    render json: Oj.dump(OrderSerializer.new(order))
  end
end
