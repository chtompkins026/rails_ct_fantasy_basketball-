class League < ActiveRecord::Base
  has_many :teams
  has_many :users, through: :team
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
