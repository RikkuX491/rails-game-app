class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year
      t.integer :game_store_owner_id

      t.timestamps
    end
  end
end
