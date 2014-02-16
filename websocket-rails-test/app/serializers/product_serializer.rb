class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price

  def attributes
    data = super
    data[:errors] = object.errors.full_messages
    data
  end
end
