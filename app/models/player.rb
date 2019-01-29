class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :name, :position, :nba_team, :points
  validates_uniqueness_of :name, scope: :team_id, message: " can not be a duplicate of someone already on your team"

  scope :sort_by_player, ->{order("points DESC")}
end
