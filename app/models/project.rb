class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  validate :acceptable_genre?, :acceptable_film_type?
  before_destroy :donations_prevents_deletion?

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

  @@genres = {
    :action=>"Action", :adventure=>"Adventure", biopic: "Biopic", 
    :comedy=>"Comedy", :crime=>"Crime", :drama=>"Drama", :fantasy=>"Fantasy", 
    :historical=>"Historical", :horror=>"Horror", :mystery=>"Mystery", noir: "Noir", 
    :philosophical=>"Philosophical", :political=>"Political", :romance=>"Romance", 
    :satire=>"Satire", :science_fiction=>"Science Fiction", :silent=>"Silent", 
    :social=>"Social", :thriller=>"Thriller", :urban=>"Urban", :western=>"Western"
  }

  @@film_types = {
    advertisement: "Advertisement", animation: "Animation", 
    documentary: "Documentary", feature: "Feature", short: "Short",
    episodic: "Episodic"
  }

  def self.genres
    @@genres
  end

  def self.film_types
    @@film_types
  end

  scope :newly_created, -> { order(created_at: :desc) }
  scope :fully_funded, -> { includes(:user).where(goal_cents: 0) }

  def self.most_popular
    joins(:comments)
    .select("projects.*, count(comments.id) AS comments_count")
    .group("projects.id").
    order("comments_count DESC")
  end

  def acceptable_film_type?
    if !@@film_types.has_key?(self.film_type.downcase.to_sym) 
      errors.add(:film_type, "invalid type")
    end
  end

  def acceptable_genre?
    if !@@genres.has_key?(self.genre.downcase.to_sym) 
      errors.add(:genre, "invalid category")
    end
  end

  def donations_prevents_deletion?
    if self.donations.count > 0
      errors.add(:goal_cents, "Project cannot be deleted due to donations")
    end
  end
end
