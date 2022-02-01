class Support < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  REASON = %w[Add-A-Service Contact-Our-Team Bug-Report Password-Support Other]
  
  validates :email, :presence => true,
                    format:     { with: VALID_EMAIL_REGEX }  
  
  validates :message, :presence => { :message => " cannot be left blank" }
end
