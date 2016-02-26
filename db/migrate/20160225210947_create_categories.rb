class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :Art
      t.string :Comics
      t.string :Crafts
      t.string :Dance
      t.string :Design
      t.string :Fashion
      t.string :Film
      t.string :Video
      t.string :Food
      t.string :Games
      t.string :Journalism
      t.string :Music
      t.string :Photography
      t.string :Publishing
      t.string :Technology
      t.string :Theater

      t.timestamps null: false
    end
  end
end
