class RemoveUserEventRefFromRoles < ActiveRecord::Migration
  def change
  	remove_column :roles, :user_id
  	remove_column :roles, :event_id
  end
end
