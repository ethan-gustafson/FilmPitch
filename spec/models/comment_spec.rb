require 'rails_helper'

RSpec.describe Comment, type: :model do
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

  subject{
    described_class.new(
      description: "I love your story!",
      user_id: 1,
      project_id: 1
    )
  }

  it "is valid when all attributes are valid" do
    expect(subject).to be_valid
  end
end
