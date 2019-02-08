class AddUtilityStatusToCreatePlayerLeagues < ActiveRecord::Migration
  def change
    add_column :player_leagues, :utility, :boolean
  end
end
