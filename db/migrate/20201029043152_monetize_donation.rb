class MonetizeDonation < ActiveRecord::Migration[6.0]
  def change
    change_table :donations do |t|
      t.monetize :amount # Rails 4x and above
    end
  end
end
