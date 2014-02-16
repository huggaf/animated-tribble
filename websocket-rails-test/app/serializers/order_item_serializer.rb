class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :value, :total, :product_id

  has_one :product, serializer: ProductSerializer

  def attributes
    data = super
    data[:errors] = object.errors.full_messages
    data
  end
end
