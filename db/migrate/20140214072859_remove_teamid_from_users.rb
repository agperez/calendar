class RemoveTeamidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :team_id
  end
end
