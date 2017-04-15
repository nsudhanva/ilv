class AddDescriptionToTables < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :role, :string
  	add_column :incomes, :description, :text
  	add_column :expenses, :description, :text
  end
end
