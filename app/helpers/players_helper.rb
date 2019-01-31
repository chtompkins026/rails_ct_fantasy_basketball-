module PlayersHelper

  def owned?(player)
    !!player.team_id
  end
end
