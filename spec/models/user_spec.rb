require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: "Alli",
      last_name: "Karavas",
      email: "allistar23@hotmail.com",
      password: "123456"
    )
  }

  # devise automatically validates with these validators:
  # :validates_presence_of, 
  # :validates_uniqueness_of, 
  # :validates_format_of, 
  # :validates_confirmation_of, 
  # :validates_length_of
  
  it "is valid when attributes are valid" do
    expect(subject).to be_valid
  end

  it "has one attached profile photo" do
    expect(!!subject.profile_image).to be true
  end
  
end
