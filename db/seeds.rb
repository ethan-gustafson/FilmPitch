# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  first_name: "Ethan",
  last_name: "Gustafson",
  email: "ethan_gustafson@outlook.com",
  password: "123456"
)

Project.create(
  name: "Dramaq Weighn",
  description: "The sight of blood makes this vampire queasy.",
  film_type: "Short Film",
  genre: "Comedy",
  story_structure: "",
  themes: "",
  link: "",
  goal: 20000.00,
  user_id: 1
)

# User.create(
#   first_name: "Momo",
#   last_name: "Gustafson",
#   email: "ethan_gustafson@yahoo.com",
#   password: "123"
# )