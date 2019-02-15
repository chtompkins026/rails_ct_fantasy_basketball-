class League < ActiveRecord::Base
  # belongs_to :player #Player must keep track of which league its in... for that specific player (keep track of which player exists/doesn't exist)
  has_many :player_leagues
  has_many :players, through: :player_leagues
  has_many :teams
  has_many :users, through: :teams

  validates_presence_of :name
  validates_uniqueness_of :name, message: "- league name already exists!"
end
