module LeaguesHelper

  def league_name?(id)
    league = League.find_by(id: id)
    @lname = league.name
  end
end
