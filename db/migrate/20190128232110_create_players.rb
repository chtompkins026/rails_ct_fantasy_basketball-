class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nba_team
      t.integer :points
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
