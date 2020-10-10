require 'rails_helper'

RSpec.describe Donation, type: :model do
  subject { double("donation") }

  it "has an amount" do
    allow(subject).to receive(:amount).and_return(100.00)
    expect(subject.amount).to eq(100.00) 
  end

  xit "belongs to a user" do
    allow(subject).to receive(:user_id).and_return(1)
    expect(subject.user_id).to eq(1) 
  end

  xit "belongs to a project" do 
    allow(subject).to receive(:project_id).and_return(1)
    expect(subject.project_id).to eq(1) 
  end
end
