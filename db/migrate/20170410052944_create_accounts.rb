class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.float :withdraw
      t.float :deposit
      t.integer :trans_for
      t.string :type
      t.datetime :date

      t.timestamps
    end
  end
end
