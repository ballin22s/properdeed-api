class Vendor < ApplicationRecord
  has_many :vendor_addresses, inverse_of: :vendor, dependent: :destroy
  
  has_many :service_tags, dependent: :destroy
  has_many :services, through: :service_tags
    
  validates_presence_of :user_id, :first_name, :last_name, :phone
  
  accepts_nested_attributes_for :vendor_addresses, allow_destroy: true, reject_if: :all_blank  

  def self.tagged_with(name)
    Service.find_by_name!(name).vendors
  end
  
  def all_services=(names)
    self.services = names.split(",").map do |name|
      Service.where(name: name.strip).first_or_create!
    end
  end

  def all_services
    self.services.map(&:name).join(", ")
  end
end
