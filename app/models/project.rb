class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true

  has_one_attached :cover_image
  belongs_to :user
end
