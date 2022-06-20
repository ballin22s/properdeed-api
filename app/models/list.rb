class List < ApplicationRecord
  belongs_to :property
  has_many :list_items

  validates_presence_of :name
end
