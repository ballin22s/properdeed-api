class State < ApplicationRecord
  has_many :property_addresses
  has_many :vendor_addresses

  validates_presence_of :name
  validates :abbr, uniqueness: true
end
