class RemoveUserIdFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :user_id, :integer
    remove_column :players, :league_id, :integer
  end
end
