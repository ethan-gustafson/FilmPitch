class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :project

  monetize :amount_cents,
    allow_nil: false, 
    numericality: { 
      greater_than_or_equal_to: 0, 
      less_than_or_equal_to: 1000000
    }
end
