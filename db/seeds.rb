# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PLATFORMS = [
  "PC",
  "Xbox",
  "PS4",
  "Nintendo DS",
  "Nintendo Switch",
  "Sega Saturn",
  "Gamecube",
  "Nintendo Wii",
]

GENRE = [
  "First Person Shooter",
  "Simulation",
  "Racing",
  "Sports",
  "RPG",
  "MMORPG",
  "Real Time Strategy",
  "Platform",
  "Fighting",
  "Rhythm",
  "Stealth",
  "Survival"
]

# platform: PLATFORMS.sample

require 'faker'

puts "Destroying Reservations, Games and Users..."
Reservation.destroy_all
Game.destroy_all
User.destroy_all

puts "Creating developer accounts..."
User.create(name:"Nii",email:"nii@gmail.com",password:"123456")
User.create(name:"Gavin",email:"gavin@gmail.com",password:"123456")
User.create(name:"Shouko",email:"shouko@gmail.com",password:"123456")
User.create(name:"Yann",email:"yann@gmail.com",password:"123456")

# puts 'Creating 100 fake users...'
# 100.times do
#   user = User.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "123456"
#   )
# end

# puts 'Creating 100 games...'
# 100.times do
#   game = Game.new(
#     name: Faker::Game.title,
#     user: User.all.sample,
#     genre: Faker::Game.genre,
#     price: Faker::Commerce.price,
#     platform: Faker::Game.platform
#   )
#   game.save!
# end

# puts 'Creating 100 reservations...'
# 100.times do
#   start_date = Faker::Date.between(from: 3.months.ago, to: 2.months.from_now)
#   end_date = start_date + (rand(3) + 1).months
#   reservation = Reservation.create!(
#     user: User.all.sample,
#     game: Game.all.sample,
#     start_date: start_date,
#     end_date: end_date,
#     status: start_date < Date.today ? ["confirmed", "declined"].sample : ["pending", "confirmed", "declined"].sample
#     )
# end

puts 'Creating 100 fake users with games...'
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )

  rand(5).times do
    game = Game.new(
      name: Faker::Game.title,
      user: user,
      genre: GENRE.sample,
      price: Faker::Commerce.price,
      platform: PLATFORMS.sample,
    )
    game.save!

    if rand(2) == 0
      start_date = Faker::Date.between(from: 3.months.ago, to: 2.months.from_now)
      end_date = start_date + (rand(3) + 1).months
      reservation = Reservation.create!(
        user: User.where.not(id: user.id).sample,
        game: game,
        start_date: start_date,
        end_date: end_date,
        status: start_date < Date.today ? ["confirmed", "declined"].sample : ["pending", "confirmed", "declined"].sample
        )
    end
  end
end

puts 'Finished!'
