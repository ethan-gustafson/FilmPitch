class User < ActiveRecord::Base
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true
    has_many :funds
	has_many :funded_pitches, through: :funds, source: :pitch
	has_many :pitches
end