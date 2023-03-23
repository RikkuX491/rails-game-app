class CreateGameStoreOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :game_store_owners do |t|
      t.string :name

      t.timestamps
    end
  end
end
