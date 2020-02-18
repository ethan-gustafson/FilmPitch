class Fund < ActiveRecord::Base
    belongs_to :user
    belongs_to :pitch
    
    validate :user_balance
    validate :invalid_fund

    def user_balance
        if self.user.wallet < self.amount
            self.errors[:amount] << "is greater than what you have in your wallet"
        end
    end

    def invalid_fund
        if self.amount > self.pitch.funding_goal
            self.errors[:amount] << "is greater than the funding goal"
        end
    end

end