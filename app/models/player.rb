class Player < ActiveRecord::Base
  has_many :player_leagues
  has_many :leagues, through: :player_leagues
  has_many :player_teams
  has_many :teams, through: :player_teams

  validates_presence_of :name, :position, :nba_team, :points
  validates_uniqueness_of :name, scope: :team_id, message: " can not be a duplicate of someone already on your team"

  scope :sort_by_player, -> {order("points DESC")}

  def self.search(search)
    if search
      player = Player.find_by(name: search)
      if player
        return player
      else
        Player.all
      end
    else
      Player.all
    end
  end

end
