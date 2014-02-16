class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  has_one :user, serializer: UserSerializer
  has_many :order_items, serializer: OrderItemSerializer

  def attributes
    data = super
    data[:errors] = object.errors.full_messages
    data
  end
end
