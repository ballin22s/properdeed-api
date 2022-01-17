class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  before_save :downcase_email

  validates_uniqueness_of :email
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
      uniqueness: { case_sensitive: false }
  
  has_many :properties, dependent: :destroy
  has_many :vendors, dependent: :destroy
  
  def generate_jwt
    JWT.encode({ id: id,
                exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
  
  def downcase_email
    self.email = email.downcase
  end
end
