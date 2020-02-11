class CreateFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :funds do |t|
      t.belongs_to :user
			t.belongs_to :pitch
    end
  end
end
