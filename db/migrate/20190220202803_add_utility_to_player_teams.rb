class AddUtilityToPlayerTeams < ActiveRecord::Migration
  def change
    add_column :player_teams, :utility, :boolean
  end
end
