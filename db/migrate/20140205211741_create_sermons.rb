class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :book
      t.date :sermon_date
      t.integer :first_chapter
      t.integer :last_chapter
      t.integer :first_verse
      t.integer :last_verse

      t.timestamps
    end
  end
end
