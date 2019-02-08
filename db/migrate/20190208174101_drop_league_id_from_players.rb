class DropLeagueIdFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :league_id, :integer
  end
end
