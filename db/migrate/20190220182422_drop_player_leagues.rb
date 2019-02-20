class DropPlayerLeagues < ActiveRecord::Migration
  def change
    drop_table :player_leagues
  end
end
