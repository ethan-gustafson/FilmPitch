class CreateFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :funds do |t|
      t.belongs_to :pitch_funder
			t.belongs_to :funded_pitch
    end
  end
end
