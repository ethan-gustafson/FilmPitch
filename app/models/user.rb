class User < ActiveRecord::Base
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates(:wallet, { length: {minimum: 0, maximum: 1000} })
    has_many :funds
	has_many :funded_pitches, through: :funds, source: :pitch
    has_many :pitches
    
    def transaction(dollars)
        remaining_balance = self.wallet - dollars 
        self.update_attributes wallet: remaining_balance
        self.wallet
    end

end