class Pitch < ActiveRecord::Base
	validates :title, :genre, :summary, :funding_goal, presence: true
    has_many :funds
	has_many :pitch_funders, through: :funds, source: :user
	belongs_to :user

	def user_fund(money)
		remaining_goal = self.funding_goal - money
		self.update_attributes! funding_goal: remaining_goal
		self.funding_goal
	end

	def self.fully_funded_projects
		where(funding_goal: 0)
	end

	def self.order_by_title
		fully_funded_projects.order(title: :asc)
	end
end