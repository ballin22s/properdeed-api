class Property < ApplicationRecord
  has_one :property_address, dependent: :destroy
  has_many :units, dependent: :destroy
  has_many :lists, dependent: :destroy
  
  validates_presence_of :user_id, :multi_unit, :property_type
  
  accepts_nested_attributes_for :property_address, allow_destroy: true, reject_if: :all_blank  
end
