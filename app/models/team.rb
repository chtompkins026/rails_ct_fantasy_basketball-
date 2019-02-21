class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :user

  has_many :player_teams
  has_many :players, through: :player_teams

  validates_presence_of :name, :total_points, :user_id, :league_id
  validates_uniqueness_of :name, message: "Error - this team name is already taken"
  validates_uniqueness_of :league_id, scope: :user_id, message: "Error - you already have a team in this league"


  def in_different_league?(player)
   player.leagues.exclude? league
  end

  def remove_players
    players.each do |p|
      player_team_help(p, self)
    end
  end

  def player_team_help(player, team)
    if player.on?(team) && team.user.owns_team?(team)
      pt = PlayerTeam.find_by({team_id: team.id, player_id: player.id})
      pt.destroy
    end
  end

end
