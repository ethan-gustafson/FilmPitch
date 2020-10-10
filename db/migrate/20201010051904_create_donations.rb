class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
