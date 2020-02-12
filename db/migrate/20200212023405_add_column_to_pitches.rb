class AddColumnToPitches < ActiveRecord::Migration[6.0]
  def change
    add_column :pitches, :genre, :string
  end
end
