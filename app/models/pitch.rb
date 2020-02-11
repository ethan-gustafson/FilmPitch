class Pitch < ActiveRecord::Base
    has_many :funds
	has_many :pitch_funders, through: :funds, source: :user
	belongs_to :user
end