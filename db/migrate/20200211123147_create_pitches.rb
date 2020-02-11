class CreatePitches < ActiveRecord::Migration[6.0]
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :summary
      t.string :video_link
      t.integer :funding_goal
    end
  end
end
