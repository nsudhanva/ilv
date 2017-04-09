class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :expense_type_id
      t.float :amount
      t.integer :payment_type_id
      t.datetime :date_time

      t.timestamps
    end
  end
end
