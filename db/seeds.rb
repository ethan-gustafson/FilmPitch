# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

xavior = User.create(
    name: "Charlie",
    username: "Telep@th",
    email: "charles@gmail.com",
    wallet: 1000,
    password: "123",
    password_confirmation: "123"
)


barry = User.create(
    name: "Barry Allen",
    username: "Flash",
    email: "speed_force@gmail.com",
    wallet: 1000,
    password: "123",
    password_confirmation: "123"
)

pitch_1 = Pitch.create(
    title: "Dramaq Weighn",
    summary: "A vampire who faints at the sight of blood.",
    funding_goal: 1000,
    user_id: 1,
    genre: "Comedy"
)

pitch_2 = Pitch.create(
    title: "The Flash",
    summary: "Live action Flashpoint",
    funding_goal: 0,
    user_id: 2,
    genre: "Comedy"
)