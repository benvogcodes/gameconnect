class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.string :developer
      t.string :genre

      t.timestamps null: false
    end
  end
end
