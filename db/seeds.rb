# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  team = Team.create(name: Faker::Team.name)
  10.times do
    Game.create(
      team_id: team.id,
      field:   Faker::StarWars.planet,
      time:    Faker::Time.forward(14, :evening),
      date:    Faker::Date.forward(23)
    )
  end
end
