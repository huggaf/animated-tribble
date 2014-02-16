class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, ->{ eager_load(:product).order('products.name') }

  validates :user, :status, presence: true

  def add_product(product_id)
    order_item = get_order_item(product_id)
    if order_item.present?
      order_item.amount += 1
    else
      order_item = order_items.new(product_id: product_id)
    end

    order_item.save
    order_item
  end

  def remove_product(product_id)
    order_item = get_order_item(product_id)
    if order_item.present?
      order_item.destroy
    end
    order_item
  end

  def update_product(product_id, amount)
    order_item = get_order_item(product_id)
    if order_item.present?
      order_item.amount = amount
    else
      order_item = order_items.new(product_id: product_id, amount: amount)
    end

    order_item.save
    order_item
  end

  def get_order_item(product_id)
    order_items.where(product_id: product_id).first
  end
end
