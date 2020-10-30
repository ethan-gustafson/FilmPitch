class MonetizeGoalInProject < ActiveRecord::Migration[6.0]
  def change
    change_table :projects do |t|
      t.monetize :goal # Rails 4x and above
    end
  end
end
