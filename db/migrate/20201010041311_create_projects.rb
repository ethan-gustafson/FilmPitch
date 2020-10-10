class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :film_type
      t.string :genre
      t.string :story_structure
      t.string :themes
      t.string :link
      t.decimal :goal, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
