class CreatePlayerLeagues < ActiveRecord::Migration
  def change
    create_table :player_leagues do |t|
      t.integer :league_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
