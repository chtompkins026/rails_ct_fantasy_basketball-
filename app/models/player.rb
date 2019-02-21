class Player < ActiveRecord::Base
  # TODO: delete player_leagues since it doesnt exist
  has_many :player_leagues
  has_many :leagues, through: :player_leagues

  has_many :player_teams
  has_many :teams, through: :player_teams

  validates_presence_of :name, :position, :nba_team, :points

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

  def not_on?(team)
    teams.exclude?(team)
  end

  def join(team, with:)
    player_teams.create(team_id: team.id, utility: with)
  end

  def leagues
    teams.map(&:league)
  end

end
