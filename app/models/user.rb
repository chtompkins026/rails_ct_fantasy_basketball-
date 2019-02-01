class User < ActiveRecord::Base
  has_secure_password
  has_many :teams
  has_many :leagues, through: :teams

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email, :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: " is not valid. Please add a valid email"
  
end
