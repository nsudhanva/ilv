class RenameTypeToTransType < ActiveRecord::Migration[5.0]
  def change
  	remove_column :accounts, :type
  	add_column :accounts, :trans_type, :string

  	remove_column :accounts, :trans_for
  	add_column :accounts, :trans_for, :string
  end
end
