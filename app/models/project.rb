class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  validate :acceptable_genre?, :acceptable_film_type?

  # before_destroy -> When donations are created, projects will no longer be allowed
  # to be destroyed if there are donations on the project.

  has_one_attached :cover_image
  has_one_attached :script
  belongs_to :user

  has_many :comments

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

  def self.find_projects_by_attr(key:, value:)
    # key = :genre, value = "Comedy"
    # where(:genre => "Comedy").last(10)
    where(key => value).last(10)
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

  def self.fully_funded
    joins(
      :user
    ).select("
      projects.id, 
      projects.name,
      projects.goal,
      projects.description, 
      projects.film_type, 
      users.first_name || ' ' || users.last_name AS author
    ").where(goal: 0).as_json
  end

  def self.most_popular
    joins(:comments).select("
      projects.id, 
      projects.name,
      projects.goal,
      projects.description, 
      projects.film_type,
      count(comments.id) AS comments_count
    ").group("projects.id, 
      projects.name,
      projects.goal,
      projects.description, 
      projects.film_type
    ").order("comments_count DESC").last(10).as_json
  end

  def self.newly_created
    
  end
end
