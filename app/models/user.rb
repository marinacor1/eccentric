class User < ActiveRecord::Base
  has_many :orders
  has_secure_password
  validates_presence_of :username, :email, :password, :password_confirmation
  validates :username, :email, uniqueness: true
  enum role: %w(default admin)
  scope :admin?, -> { where(role: 1) }
end
