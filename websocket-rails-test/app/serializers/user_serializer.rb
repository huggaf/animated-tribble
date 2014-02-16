class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :admin

  def attributes
    data = super
    data[:errors] = object.errors.full_messages
    data
  end
end
