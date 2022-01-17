class Unit < ApplicationRecord
  belongs_to :property, optional: true 
  
  validates_presence_of :property_id, :name, :bed, :bath
end
