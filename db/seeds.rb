# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

GameStoreOwner.create(name: "Jordan")

Game.create(title: "Pokemon", release_year: 1998, game_store_owner_id: 1)
Game.create(title: "Undertale", release_year: 2015, game_store_owner_id: 1)

User.create(username: "alice", password: "batterypark123")
User.create(username: "bob", password: "rubyonrails4")
User.create(username: "chris", password: "flatironschool321")

4.times do
    Review.create(game_id: Game.all.sample.id, user_id: User.all.sample.id, rating: [1, 2, 3, 4, 5].sample)
end