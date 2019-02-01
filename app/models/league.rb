class League < ActiveRecord::Base
  belongs_to :player 
  has_many :teams
  has_many :users, through: :teams

  validates_presence_of :name
  validates_uniqueness_of :name, message: "- league name already exists!"
end
