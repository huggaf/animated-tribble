class User < ActiveRecord::Base
  has_secure_password

  has_many :orders

  validates :username, presence: true
  validates :username, uniqueness: true, if: :username_changed?
end
