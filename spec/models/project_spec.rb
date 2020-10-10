require 'rails_helper'

RSpec.describe Project, type: :model do
  subject{
    described_class.new(
      name: "Dramaq Weighn",
      description: "The sight of blood makes this vampire queasy.",
      film_type: "Short Film",
      genre: "Comedy",
      story_structure: "",
      themes: "",
      link: "",
      goal: 20000.00
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
end
