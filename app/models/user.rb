class User < ActiveRecord::Base
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :wallet, numericality: {greater_than: 0, less_than_or_equal_to: 1000, message: "You cannot have more than 1000 in your account" }
    has_many :funds
	has_many :funded_pitches, through: :funds, source: :pitch
    has_many :pitches
    
    def transaction(dollars)
        remaining_balance = self.wallet - dollars 
        self.update_attributes! wallet: remaining_balance
        self.wallet
    end

end