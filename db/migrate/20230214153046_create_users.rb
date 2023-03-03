class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username

      # Allows the password and password_confirmation methods to work
      t.string :password_digest

      t.timestamps
    end
  end
end
