class Project < ApplicationRecord
  validates :name, :description, :goal, presence: true
  validates :name, uniqueness: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }

  # before_destroy -> When donations are created, projects will no longer be allowed
  # to be destroyed if there are donations on the project.

  has_one_attached :cover_image
  has_one_attached :script
  belongs_to :user

  has_many :comments

  @@genres = {
    :action=>"Action", :adventure=>"Adventure", :comedy=>"Comedy", 
    :crime=>"Crime", :drama=>"Drama", :fantasy=>"Fantasy", 
    :historical=>"Historical", :horror=>"Horror", :mystery=>"Mystery", 
    :philosophical=>"Philosophical", :political=>"Political", :romance=>"Romance", 
    :satire=>"Satire", :"science fiction"=>"Science Fiction", :social=>"Social", 
    :thriller=>"Thriller", :urban=>"Urban", :western=>"Western"
  }

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

  def self.genres
    @@genres
  end

  def self.find_projects_by_genre(genre)
    where(genre: genre.capitalize).last(10)
  end

  def acceptable_genre?(genre)
    key = genre.downcase.to_sym
    
    !self.genres.has_key?(key) ? errors.add(key, "invalid type") : true
  end
end
