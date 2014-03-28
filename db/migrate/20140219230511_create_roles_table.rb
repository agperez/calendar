class CreateRolesTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :name
    	t.string :color
    end
    add_reference :roles, :event, index: true
    add_reference :roles, :user, index: true
  end
end
