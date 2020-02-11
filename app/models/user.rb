class User < ActiveRecord::Base
    has_secure_password
    has_many :funds
	has_many :funded_pitches, through: :funds, source: :pitch
	has_many :pitches
end