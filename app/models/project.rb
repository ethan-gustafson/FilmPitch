class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  # before_destroy -> When donations are created, projects will no longer be allowed
  # to be destroyed if there are donations on the project.

  has_one_attached :cover_image
  has_one_attached :script
  belongs_to :user

  def self.fully_funded
    where(goal: 0)
  end
end
