class Pitch < ActiveRecord::Base
	validates :title, :genre, :summary, :funding_goal, presence: true
    has_many :funds
	has_many :pitch_funders, through: :funds, source: :user
	belongs_to :user
end