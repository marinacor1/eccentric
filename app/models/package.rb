class Package < ActiveRecord::Base
  belongs_to :destination
  validates :title, uniqueness: true
  validates_presence_of :title, :description, :price
end
