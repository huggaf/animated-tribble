class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true, if: :name_changed?

end
