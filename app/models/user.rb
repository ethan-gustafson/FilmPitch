class User < ActiveRecord::Base
    has_secure_password
    has_many :funds, foreign_key: :pitch_funder
	has_many :funded_pitches, through: :funds, source: :funded_pitch
	has_many :pitches
end