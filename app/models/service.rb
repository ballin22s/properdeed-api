class Service < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: true }
  
  before_validation :downcase_name
  
  has_many :service_tags
  has_many :vendors, through: :service_tags
  
  private

  def downcase_name
    self.name = self.name.downcase
  end
end
