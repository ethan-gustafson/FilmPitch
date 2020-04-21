class User < ActiveRecord::Base
    has_secure_password

    has_many :funds
    has_many :pitches
    
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :wallet, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, message: "You cannot have more than 1000 in your account" }
    
    def transaction(dollars)
        remaining_balance = self.wallet - dollars 
        self.update_attributes! wallet: remaining_balance # self.update_attributes! will update the user attribute wallet
        self.wallet # with the argument of remaining balance
    end

    def add_to_wallet(money)
        new_bank_balance = self.wallet + money.to_i # using to_i because of params value being added in the place of the argument
        self.update_attributes! wallet: new_bank_balance
        self.wallet
    end

end

# Find a way to reduce the number of times your project queries the database.