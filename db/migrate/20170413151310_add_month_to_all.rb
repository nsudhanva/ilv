class AddMonthToAll < ActiveRecord::Migration[5.0]
  def change
  	add_column :incomes, :month, :string
  	add_column :expenses, :month, :string
  end
end
