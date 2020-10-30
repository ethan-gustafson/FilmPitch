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
  email: "ethan_gustafson@yahoo.com",
  password: "123456"
)

Project.create(
  name: "Dramaq Weighn",
  description: "The sight of blood makes this vampire queasy.",
  film_type: "Short",
  genre: "Comedy",
  story_structure: "3-Act Structure",
  themes: "Themes in story",
  link: "",
  goal: 2000,
  user_id: 1
)

Project.create(
  name: "Switched",
  description: "Modern freaky friday.",
  film_type: "Short",
  genre: "Comedy",
  story_structure: "3-Act Structure",
  themes: "Themes in story",
  link: "https://www.youtube.com/embed/-byF27tdrnA",
  goal: 2000,
  user_id: 1
)

Project.create(
  name: "Plasmids by Ryan Industries",
  description: "In a desperate situation, a product presents itself.",
  film_type: "Short",
  genre: "Action",
  story_structure: "3-Act Structure",
  themes: "Themes in story",
  link: "https://www.youtube.com/embed/_6XZJMRpszs",
  goal: 2000,
  user_id: 1
)

Project.create(
  name: "Bite On This",
  description: "Doritoz Zombies Commercial",
  film_type: "Advertisement",
  genre: "Comedy",
  story_structure: "3-Act Structure",
  themes: "Themes in story",
  link: "https://www.youtube.com/embed/UQBw3o0PZcY",
  goal: 2000,
  user_id: 1
)