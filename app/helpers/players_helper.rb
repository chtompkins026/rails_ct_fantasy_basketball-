module PlayersHelper

  def owned?(playerteams)
    team_id = params[:team_id]
    playerteams.include?(team_id) ? TRUE : FALSE 
  end
end
