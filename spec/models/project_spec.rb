require 'rails_helper'

RSpec.describe Project, type: :model do
  
  User.create(
    first_name: "Ethan",
    last_name: "Gustafson",
    email: "ethan_gustafson@outlook.com",
    password: "123456"
  )

  subject{
    described_class.new(
      name: "Plasmids by Ryan Industries",
      description: "A product saves a life.",
      film_type: "Short Film",
      genre: "Action",
      story_structure: "",
      themes: "",
      link: "https://youtu.be/_6XZJMRpszs",
      goal: 0,
      user_id: 1
    )
  }

  it "is valid when all attributes are valid" do
    expect(subject).to be_valid
  end

  it "validates presence of name, description and goal" do
    subject.name = ""
    subject.description = ""
    subject.goal = ""
    expect(subject).to_not be_valid
  end

  it "has a cover image" do
    expect(!!subject.cover_image).to be true
  end

  it "has one script attached" do
    expect(!!subject.script).to be true
  end
end
