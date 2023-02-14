# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Game.create(title: "Pokemon", release_year: 1998)
Game.create(title: "Undertale", release_year: 2015)

User.create(name: "Alice")
User.create(name: "Bob")
User.create(name: "Chris")

4.times do
    Review.create(game_id: Game.all.sample.id, user_id: User.all.sample.id, rating: [1, 2, 3, 4, 5].sample)
end