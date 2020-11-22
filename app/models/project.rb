class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  validate :acceptable_genre?, :acceptable_film_type?

  # before_destroy -> When donations are created, projects will no longer be allowed
  # to be destroyed if there are donations on the project.

  belongs_to :user
  has_one_attached :cover_image
  has_one_attached :script
  has_many :comments
  has_many :donations

  monetize :goal_cents, allow_nil: false, numericality: { 
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 1000000
  }

  def acceptable_film_type?
    if !film_types.has_key?(self.film_type.downcase.to_sym) 
      errors.add(:film_type, "invalid type")
    end
  end

  def acceptable_genre?
    if !genres.has_key?(self.genre.downcase.to_sym) 
      errors.add(:genre, "invalid category")
    end
  end

  scope :newly_created, -> { order(created_at: :desc) }
  scope :fully_funded, -> { includes(:user).where(goal_cents: 0) }

  def self.most_popular
    joins(:comments)
    .select("projects.*, count(comments.id) AS comments_count")
    .group("projects.id").
    order("comments_count DESC")
  end
end
