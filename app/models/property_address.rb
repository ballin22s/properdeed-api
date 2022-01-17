class PropertyAddress < ApplicationRecord
  belongs_to :property, optional: true 
  
  validates_presence_of :property_id, :state_id, :street1, :city, :zip
end
