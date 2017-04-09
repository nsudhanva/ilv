class CreateResidents < ActiveRecord::Migration[5.0]
  def change
    create_table :residents do |t|
      t.integer :flat_no
      t.string :name
      t.integer :family
      t.string :email
      t.string :phone
      t.integer :resident_type_id

      t.timestamps
    end
  end
end
