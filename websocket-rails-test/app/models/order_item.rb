class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order, :product, presence: true
  validates :value, :total, numericality: true
  validates :amount, numericality: {greater_than: 0}

  before_save :calc_totals

  after_create  {|order_item| order_item.send_message('order_items.created', OrderItemSerializer.new(order_item).serializable_hash) }
  after_update  {|order_item| order_item.send_message('order_items.updated', OrderItemSerializer.new(order_item).serializable_hash) }
  after_destroy {|order_item| order_item.send_message('order_items.deleted', {id: order_item.id}) }

  protected

  def send_message(event, data)
    connection = WebsocketRails.users[self.order.user_id]
    connection.send_message(event, data);
  end

  def calc_totals
    self.value = self.product.price
    self.total = (self.value * self.amount)
  end
end
