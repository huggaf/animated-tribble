class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order, :product, presence: true
  validates :value, :total, numericality: true
  validates :amount, numericality: {greater_than: 0}

  before_save :calc_totals

  protected

  def calc_totals
    self.value = self.product.price
    self.total = (self.value * self.amount)
  end
end
