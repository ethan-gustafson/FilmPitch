class AddColumnToFunds < ActiveRecord::Migration[6.0]
  def change
    add_column :funds, :amount, :integer
  end
end
