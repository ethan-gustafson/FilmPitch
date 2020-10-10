class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true

  has_one_attached :cover_image
  has_one_attached :script
  belongs_to :user
end
