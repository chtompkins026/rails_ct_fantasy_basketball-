module PlayersHelper

  def owned?(playerteams)
    team_id = params[:team_id]
    playerteams.include?(team_id) ? TRUE : FALSE
  end

  def eligibility_check(player, team)
    if player.teams.exclude?(team) && player.teams.pluck(:league_id).exclude?(team.league_id)
      return TRUE
    else
      return FALSE
    end
  end


end
