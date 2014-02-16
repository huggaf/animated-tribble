class Api::OrderItemsController < ApplicationController

  before_filter :find_order

  def create
    order_item = @order.add_product(params[:product_id])

    if order_item.persisted?
      render json: Oj.dump(OrderItemSerializer.new(order_item))
    else
      render json: Oj.dump(OrderItemSerializer.new(order_item)), status: :unprocessable_entity
    end
  end

  def destroy
    order_item = @order.remove_product(params[:product_id])

    if order_item.destroyed?
      render json: Oj.dump(OrderItemSerializer.new(order_item))
    else
      render json: Oj.dump(OrderItemSerializer.new(order_item)), status: :unprocessable_entity
    end
  end

  def update
    order_item = @order.update_product(params[:product_id], params[:amount])

    if order_item.valid?
      render json: Oj.dump(OrderItemSerializer.new(order_item))
    else
      render json: Oj.dump(OrderItemSerializer.new(order_item)), status: :unprocessable_entity
    end
  end

  protected

  def find_order
    @order = Order.find_or_create_by_user_id_and_status(current_user.id, 'open')
  end
end
