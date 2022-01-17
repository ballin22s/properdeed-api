class VendorAddress < ApplicationRecord
  belongs_to :vendor, optional: true 
  
  validates_presence_of :state_id
end
