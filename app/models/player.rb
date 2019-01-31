class Player < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :name, :position, :nba_team, :points
  validates_uniqueness_of :name, scope: :team_id, message: " can not be a duplicate of someone already on your team"

  scope :sort_by_player, ->{order("points DESC")}

  def self.search(search)
    if search
      player = Player.find_by(name: search)
      if player
        self.where(player_id: player)
      else
        Player.all
      end
    else
      Player.all
    end
  end

end
