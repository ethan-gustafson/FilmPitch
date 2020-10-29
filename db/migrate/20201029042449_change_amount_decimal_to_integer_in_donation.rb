class ChangeAmountDecimalToIntegerInDonation < ActiveRecord::Migration[6.0]
  def change
    change_column :donations, :amount, :integer
  end
end
