class Pitch < ActiveRecord::Base
    has_many :funds, foreign_key: :funded_pitch
	has_many :pitch_funders, through: :funds, source: :pitch_funder
	belongs_to :user
end