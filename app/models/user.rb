class User < ApplicationRecord
  has_many :events
  has_many :reports
  
  has_secure_password
  validates :name, presence: true
  
  EMAIL_FORMAT_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT_REGEX }

  before_save { self.email = email.downcase }
end
