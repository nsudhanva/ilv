class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.float :amount
      t.integer :resident_id
      t.datetime :date_time
      t.integer :payment_type_id
      t.integer :income_type_id

      t.timestamps
    end
  end
end
