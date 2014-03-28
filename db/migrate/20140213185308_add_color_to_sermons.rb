class AddColorToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :color, :string
  end
end
