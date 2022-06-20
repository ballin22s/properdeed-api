class Property < ApplicationRecord
  has_many :property_addresses, dependent: :destroy
  has_many :units, dependent: :destroy
  has_many :lists, dependent: :destroy
  
  validates_presence_of :user_id, :multi_unit, :property_type
end
