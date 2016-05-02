class Destination < ActiveRecord::Base
  has_many :packages
  validates :planet, presence: true, uniqueness: true
end
