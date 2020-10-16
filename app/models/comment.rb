class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project 

  validates :description, :user_id, :project_id, presence: true
end
